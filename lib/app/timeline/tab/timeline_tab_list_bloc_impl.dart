import 'package:fedi/app/timeline/tab/timeline_tab_bloc.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_list_bloc.dart';
import 'package:fedi/app/timeline/type/timeline_type_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/web_sockets/listen_type/web_sockets_listen_type_model.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

final _logger = Logger("timeline_tab_list_bloc_impl.dart");

class TimelineTabListBloc extends AsyncInitLoadingBloc
    implements ITimelineTabListBloc {
  @override
  List<String> get timelineIds => timelineTabBlocs
      .map((timelineTabBloc) => timelineTabBloc.timelineId)
      .toList();

  @override
  late List<ITimelineTabBloc> timelineTabBlocs;

  @override
  ITimelineTabBloc get homeTimelineTabBloc => timelineTabBlocs.firstWhere(
        (timelineTabBloc) => timelineTabBloc.timeline.type == TimelineType.home,
      );

  late BehaviorSubject<ITimelineTabBloc> selectedTimelineTabBlocSubject;

  @override
  ITimelineTabBloc get selectedTimelineTabBloc =>
      selectedTimelineTabBlocSubject.value!;

  @override
  Stream<ITimelineTabBloc> get selectedTimelineTabBlocStream =>
      selectedTimelineTabBlocSubject.stream;

  TimelineTabListBloc({
    required List<String> timelineIds,
    required String? oldSelectedTimelineId,
    required ITimelineTabBloc Function(
      String timelineId,
      WebSocketsListenType webSocketsListenType,
    ) timelineTabBlocCreator,
  }) {
    var selectedTimelineId = oldSelectedTimelineId ?? timelineIds.first;

    timelineTabBlocs = [];
    for (var timelineId in timelineIds) {
      var timelineTabBloc = timelineTabBlocCreator(
        timelineId,
        selectedTimelineId == timelineId
            ? WebSocketsListenType.foreground
            : WebSocketsListenType.background,
      );

      timelineTabBlocs.add(timelineTabBloc);
    }
    int initialIndex = timelineIds.indexOf(selectedTimelineId);

    if (initialIndex <= 0) {
      _logger.warning(() => "initialIndex $initialIndex \n"
          "oldSelectedTimelineId $oldSelectedTimelineId");
      initialIndex = 0;
    }

    selectedTimelineTabBlocSubject = BehaviorSubject.seeded(
      timelineTabBlocs[initialIndex],
    );

    addDisposable(custom: () async {
      for (var bloc in timelineTabBlocs) {
        await bloc.dispose();
      }
    });
  }

  @override
  Future internalAsyncInit() async {
    for (var timelineTabBloc in timelineTabBlocs) {
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
    for (var bloc in timelineTabBlocs) {
      bloc.resubscribeWebSocketsUpdates(
        bloc == selectedTimelineTabBloc
            ? WebSocketsListenType.foreground
            : WebSocketsListenType.background,
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
