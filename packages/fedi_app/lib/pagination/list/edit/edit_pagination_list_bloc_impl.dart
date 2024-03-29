import 'package:collection/collection.dart' show IterableExtension;
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/ui/list/fedi_list_smart_refresher_model.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_model.dart';
import 'package:fedi_app/pagination/list/edit/edit_pagination_list_bloc.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/list/pagination_list_model.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:logging/logging.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';

typedef ItemEquality<TItem> = bool Function(TItem a, TItem b);

final _logger = Logger('edit_pagination_list_bloc_impl.dart');

class EditPaginationListBloc<TPage extends PaginationPage<TItem>, TItem>
    extends DisposableOwner implements IEditPaginationListBloc<TPage, TItem> {
  final IPaginationListBloc<TPage, TItem> paginationListBloc;

  final ItemEquality<TItem> itemEquality;

  EditPaginationListBloc({
    required this.paginationListBloc,
    required this.itemEquality,
  });

  @override
  Future<void> clearChangesAndRefresh() async {
    addedItemsSubject.add([]);
    removedItemsSubject.add([]);
    await refreshWithController();
  }

  @override
  bool get isSomethingChanged => _calculateIsSomethingChanged(
        addedItems: addedItems,
        removedItems: removedItems,
      );

  bool _calculateIsSomethingChanged({
    required List<TItem> addedItems,
    required List<TItem> removedItems,
  }) {
    var isSomethingChanged = addedItems.isNotEmpty || removedItems.isNotEmpty;
    _logger.finest(() => ' isSomethingChanged $isSomethingChanged');

    return isSomethingChanged;
  }

  @override
  Stream<bool> get isSomethingChangedStream => Rx.combineLatest2(
        addedItemsStream,
        removedItemsStream,
        (
          List<TItem> addedItems,
          List<TItem> removedItems,
        ) =>
            _calculateIsSomethingChanged(
          addedItems: addedItems,
          removedItems: removedItems,
        ),
      );

  List<TItem> get originalItems => paginationListBloc.items;

  Stream<List<TItem>> get originalItemsStream => paginationListBloc.itemsStream;

  final BehaviorSubject<List<TItem>> addedItemsSubject =
      BehaviorSubject.seeded([]);
  final BehaviorSubject<List<TItem>> removedItemsSubject =
      BehaviorSubject.seeded([]);

  @override
  List<TItem> get addedItems => List.unmodifiable(addedItemsSubject.value);

  Stream<List<TItem>> get addedItemsStream => addedItemsSubject.stream.map(
        (value) => List.unmodifiable(
          value,
        ),
      );

  @override
  List<TItem> get removedItems => List.unmodifiable(removedItemsSubject.value);

  Stream<List<TItem>> get removedItemsStream => removedItemsSubject.stream.map(
        (value) => List.unmodifiable(
          value,
        ),
      );

  @override
  List<TItem> get items => _calculateCurrentItems(
        originalItems: originalItems,
        addedItems: addedItems,
        removedItems: removedItems,
        itemEquality: itemEquality,
      );

  static List<TItem> _calculateCurrentItems<TItem>({
    required List<TItem> originalItems,
    required List<TItem> addedItems,
    required List<TItem> removedItems,
    required ItemEquality<TItem> itemEquality,
  }) {
    List<TItem> result;

    _logger.finest(
      () => '_calculateCurrentItems \n'
          'originalItems ${originalItems.length} \n'
          'addedItems ${addedItems.length} \n'
          'removedItems ${removedItems.length}',
    );
    result = <TItem>[
      ...originalItems,
      ...addedItems,
    ];

    // ignore: cascade_invocations
    result.removeWhere(
      (item) => _calculateIsItemAdded(
        items: removedItems,
        item: item,
        itemEquality: itemEquality,
      ),
    );

    _logger.finest(
      () => '_calculateCurrentItems \n'
          'originalItems ${originalItems.length}'
          'addedItems ${addedItems.length}'
          'removedItems ${removedItems.length}'
          'result ${result.length}',
    );

    return result;
  }

  @override
  Stream<List<TItem>> get itemsStream => Rx.combineLatest3(
        originalItemsStream,
        addedItemsStream,
        removedItemsStream,
        (
          List<TItem> originalItems,
          List<TItem> addedItems,
          List<TItem> removedItems,
        ) =>
            _calculateCurrentItems(
          originalItems: originalItems,
          addedItems: addedItems,
          removedItems: removedItems,
          itemEquality: itemEquality,
        ),
      );

  @override
  Future<void> addItem(TItem item) async {
    var foundInRemoved = _findItemInList(
      items: removedItems,
      item: item,
      itemEquality: itemEquality,
    );
    if (foundInRemoved != null) {
      var items = removedItemsSubject.value;
      // ignore: cascade_invocations, avoid-ignoring-return-values
      items.remove(foundInRemoved);

      removedItemsSubject.add(items);

      return;
    }

    var foundInOriginal = _findItemInList(
      items: originalItems,
      item: item,
      itemEquality: itemEquality,
    );

    if (foundInOriginal != null) {
      return;
    }

    var foundInAdded = _findItemInList(
      items: addedItems,
      item: item,
      itemEquality: itemEquality,
    );

    if (foundInAdded != null) {
      return;
    }

    addedItemsSubject.add([item, ...addedItems]);
  }

  @override
  Future<void> removeItem(TItem item) async {
    var foundInAdded = _findItemInList(
      items: addedItems,
      item: item,
      itemEquality: itemEquality,
    );

    if (foundInAdded != null) {
      var items = addedItemsSubject.value;
      // ignore: cascade_invocations, avoid-ignoring-return-values
      items.remove(foundInAdded);

      addedItemsSubject.add(items);

      return;
    }

    var foundInRemoved = _findItemInList(
      items: removedItems,
      item: item,
      itemEquality: itemEquality,
    );
    if (foundInRemoved == null) {
      removedItemsSubject.add(
        [
          item,
          ...removedItems,
        ],
      );
    }
  }

  @override
  bool isItemAdded(TItem item) => _calculateIsItemAdded(
        items: items,
        item: item,
        itemEquality: itemEquality,
      );

  static bool _calculateIsItemAdded<TItem>({
    required List<TItem>? items,
    required TItem item,
    required ItemEquality<TItem> itemEquality,
  }) =>
      _findItemInList(
        items: items,
        item: item,
        itemEquality: itemEquality,
      ) !=
      null;

  static TItem? _findItemInList<TItem>({
    required List<TItem>? items,
    required TItem item,
    required ItemEquality<TItem> itemEquality,
  }) =>
      items?.firstWhereOrNull(
        (currentItem) => itemEquality(currentItem, item),
      );

  @override
  Stream<bool> isItemAddedStream(TItem item) => itemsStream.map(
        (items) => _calculateIsItemAdded(
          items: items,
          item: item,
          itemEquality: itemEquality,
        ),
      );

  @override
  AsyncInitLoadingState? get initLoadingState =>
      paginationListBloc.initLoadingState;

  @override
  Stream<AsyncInitLoadingState> get initLoadingStateStream =>
      paginationListBloc.initLoadingStateStream;

  @override
  bool? get isLoading => paginationListBloc.isLoading;

  @override
  Stream<bool> get isLoadingStream => paginationListBloc.isLoadingStream;

  @override
  int? get itemsCountPerPage => paginationListBloc.itemsCountPerPage;

  @override
  Stream<List<TItem>> get itemsDistinctStream => itemsStream.distinct();

  @override
  Stream<PaginationListLoadingError> get loadMoreErrorStream =>
      paginationListBloc.loadMoreErrorStream;

  @override
  FediListSmartRefresherLoadingState? get loadMoreState =>
      paginationListBloc.loadMoreState;

  @override
  // TODO: implement loadMoreStateStream
  Stream<FediListSmartRefresherLoadingState> get loadMoreStateStream =>
      paginationListBloc.loadMoreStateStream;

  @override
  Future<FediListSmartRefresherLoadingState> loadMoreWithoutController() =>
      paginationListBloc.loadMoreWithoutController();

  @override
  Future<void> performAsyncInit() => paginationListBloc.performAsyncInit();

  @override
  RefreshController get refreshController =>
      paginationListBloc.refreshController;

  @override
  Stream<PaginationListLoadingError> get refreshErrorStream =>
      paginationListBloc.refreshErrorStream;

  @override
  FediListSmartRefresherLoadingState? get refreshState =>
      paginationListBloc.refreshState;

  @override
  Stream<FediListSmartRefresherLoadingState> get refreshStateStream =>
      paginationListBloc.refreshStateStream;

  @override
  Future<void> refreshWithController() =>
      paginationListBloc.refreshWithController();

  @override
  Future<FediListSmartRefresherLoadingState> refreshWithoutController() =>
      paginationListBloc.refreshWithoutController();

  @override
  List<TPage> get sortedPages => paginationListBloc.sortedPages;

  @override
  Stream<List<TPage>> get sortedPagesStream =>
      paginationListBloc.sortedPagesStream;

  @override
  dynamic get initLoadingException => paginationListBloc.initLoadingException;
}
