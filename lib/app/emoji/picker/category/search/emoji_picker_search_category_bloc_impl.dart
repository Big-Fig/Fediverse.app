import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_flutter/easy_dispose_flutter.dart';
import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/emoji_picker/category/code/custom_emoji_picker_code_category_bloc.dart';
import 'package:fedi/emoji_picker/category/custom_emoji_picker_category_bloc.dart';
import 'package:fedi/emoji_picker/item/code/custom_emoji_picker_code_item_model.dart';
import 'package:fedi/emoji_picker/item/custom_emoji_picker_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class EmojiPickerSearchCategoryBloc extends AsyncInitLoadingBloc
    implements ICustomEmojiPickerCategoryBloc {
  final List<ICustomEmojiPickerCodeCategoryBloc> allCategoryBlocs;
  final BehaviorSubject<List<CustomEmojiPickerItem>?> itemsSubject =
      BehaviorSubject.seeded(
    [],
  );

  final TextEditingController searchTextEditingController =
      TextEditingController();

  EmojiPickerSearchCategoryBloc({
    required this.allCategoryBlocs,
  }) {
    itemsSubject.disposeWith(this);
    searchTextEditingController.disposeWith(this);

    searchTextEditingController.listenAsDisposable(
      () {
        _performSearch();
      },
    ).disposeWith(this);
  }

  void _performSearch() {
    var text = searchTextEditingController.text.toLowerCase().trim();

    if (text.isNotEmpty) {
      var listOfFilteredItems = allCategoryBlocs
          .map(
            (bloc) =>
                bloc.items?.where(
                  (item) => item.name.toLowerCase().contains(text),
                ) ??
                [],
          )
          .toList();

      var filteredItems = listOfFilteredItems.fold(
        <CustomEmojiPickerCodeItem>[],
        (
          List<CustomEmojiPickerCodeItem> result,
          Iterable<CustomEmojiPickerCodeItem> blocFilteredItems,
        ) =>
            result
              ..addAll(
                blocFilteredItems,
              ),
      );

      itemsSubject.add(filteredItems);
    } else {
      itemsSubject.add([]);
    }
  }

  @override
  Stream<List<CustomEmojiPickerItem>?> get itemsStream => itemsSubject.stream;

  @override
  List<CustomEmojiPickerItem>? get items => itemsSubject.value;

  @override
  Future internalAsyncInit() async {
    var futures = allCategoryBlocs.map(
      (bloc) => bloc.performAsyncInit(),
    );

    await Future.wait(futures);
  }
}
