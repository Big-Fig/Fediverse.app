import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/timeline/tab/timeline_tab_bloc.dart';
import 'package:fedi_app/app/timeline/tab/timeline_tab_list_bloc.dart';
import 'package:fedi_app/app/timeline/type/timeline_type_model.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

final _logger = Logger('timeline_tab_list_bloc_impl.dart');

class TimelineTabListBloc extends AsyncInitLoadingBloc
    implements ITimelineTabListBloc {
  @override
  List<String> get timelineIds => timelineTabBlocs
      .map((timelineTabBloc) => timelineTabBloc.timelineId)
      .toList();

  @override
  // ignore: avoid-late-keyword
  late List<ITimelineTabBloc> timelineTabBlocs;

  @override
  ITimelineTabBloc get homeTimelineTabBloc => timelineTabBlocs.firstWhere(
        (timelineTabBloc) => timelineTabBloc.timeline.type == TimelineType.home,
      );

  // ignore: avoid-late-keyword
  late BehaviorSubject<ITimelineTabBloc> selectedTimelineTabBlocSubject;

  @override
  ITimelineTabBloc get selectedTimelineTabBloc =>
      selectedTimelineTabBlocSubject.value;

  @override
  Stream<ITimelineTabBloc> get selectedTimelineTabBlocStream =>
      selectedTimelineTabBlocSubject.stream;

  TimelineTabListBloc({
    required List<String> timelineIds,
    required String? oldSelectedTimelineId,
    required ITimelineTabBloc Function(
      String timelineId,
      WebSocketsChannelHandlerType handlerType,
    )
        timelineTabBlocCreator,
  }) {
    var selectedTimelineId = oldSelectedTimelineId ?? timelineIds.first;

    timelineTabBlocs = [];
    for (final timelineId in timelineIds) {
      var timelineTabBloc = timelineTabBlocCreator(
        timelineId,
        selectedTimelineId == timelineId
            ? WebSocketsChannelHandlerType.foregroundValue
            : WebSocketsChannelHandlerType.backgroundValue,
      );

      timelineTabBlocs.add(timelineTabBloc);
    }
    var initialIndex = timelineIds.indexOf(selectedTimelineId);

    if (initialIndex <= 0) {
      _logger.warning(
        () => 'initialIndex $initialIndex \n'
            'oldSelectedTimelineId $oldSelectedTimelineId',
      );
      initialIndex = 0;
    }

    selectedTimelineTabBlocSubject = BehaviorSubject.seeded(
      timelineTabBlocs[initialIndex],
    );

    addCustomDisposable(
      () async {
        for (final bloc in timelineTabBlocs) {
          await bloc.dispose();
        }
      },
    );
  }

  @override
  Future<void> internalAsyncInit() async {
    for (final timelineTabBloc in timelineTabBlocs) {
      await timelineTabBloc.performAsyncInit();
    }
  }

  @override
  void changeSelectedTimelineTabBloc(ITimelineTabBloc selectedTimelineTabBloc) {
    if (this.selectedTimelineTabBloc.timelineId ==
        selectedTimelineTabBloc.timelineId) {
      return;
    }

    // merge unmerged on selection
    var paginationListBloc =
        selectedTimelineTabBloc.paginationListWithNewItemsBloc;
    if (paginationListBloc.unmergedNewItemsCount > 0) {
      paginationListBloc.mergeNewItems();
    }
    for (final bloc in timelineTabBlocs) {
      bloc.resubscribeWebSocketsUpdates(
        bloc == selectedTimelineTabBloc
            ? WebSocketsChannelHandlerType.foregroundValue
            : WebSocketsChannelHandlerType.backgroundValue,
      );
    }

    selectedTimelineTabBlocSubject.add(selectedTimelineTabBloc);
  }

  @override
  void changeSelectedTimelineTabBlocIndex(int selectedTimelineTabBlocIndex) =>
      changeSelectedTimelineTabBloc(
        timelineTabBlocs[selectedTimelineTabBlocIndex],
      );

  @override
  int get selectedTimelineTabBlocIndex =>
      timelineTabBlocs.indexOf(selectedTimelineTabBloc);

  @override
  Stream<int> get selectedTimelineTabBlocIndexStream =>
      selectedTimelineTabBlocStream.map(
        (selectedTimelineTabBloc) =>
            timelineTabBlocs.indexOf(selectedTimelineTabBloc),
      );
}
