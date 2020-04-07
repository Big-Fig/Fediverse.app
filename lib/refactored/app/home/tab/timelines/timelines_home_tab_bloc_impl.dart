import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/refactored/app/home/tab/timelines/timelines_home_tab_bloc.dart';
import 'package:fedi/refactored/app/home/tab/timelines/timelines_home_tab_model.dart';
import 'package:fedi/refactored/app/status/list/cached/status_cached_list_service.dart';
import 'package:fedi/refactored/app/status/pagination/cached/status_cached_pagination_bloc.dart';
import 'package:fedi/refactored/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_bloc.dart';
import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_bloc_impl.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/timeline/home/home_timeline_service_impl.dart';
import 'package:fedi/refactored/app/timeline/local/local_timeline_service_impl.dart';
import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/refactored/app/timeline/public/public_timeline_service_impl.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/refactored/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("timelines_home_tab_page_bloc_impl.dart");

class TimelinesHomeTabBloc extends DisposableOwner
    implements ITimelinesHomeTabBloc {
  @override
  void selectTab(TimelineTab tab) {
    selectedTabSubject.add(tab);
  }

  // ignore: close_sinks
  BehaviorSubject<TimelineTab> selectedTabSubject;

  @override
  TimelineTab get selectedTab => selectedTabSubject.value;

  @override
  Stream<TimelineTab> get selectedTabStream => selectedTabSubject.stream;

  final IPleromaTimelineService pleromaTimelineService;
  final IPleromaAccountService pleromaAccountService;
  final IStatusRepository statusRepository;
  final IAccountRepository accountRepository;
  final IMyAccountBloc myAccountBloc;
  final ICurrentAuthInstanceBloc currentInstanceBloc;
  final ITimelineLocalPreferencesBloc timelineLocalPreferencesBloc;

  TimelinesHomeTabBloc({
    @required TimelineTab startTab,
    @required this.pleromaTimelineService,
    @required this.pleromaAccountService,
    @required this.statusRepository,
    @required this.accountRepository,
    @required this.myAccountBloc,
    @required this.currentInstanceBloc,
    @required this.timelineLocalPreferencesBloc,
  }) {
    selectedTabSubject = BehaviorSubject.seeded(startTab);

    addDisposable(subject: selectedTabSubject);

    _logger.finest(() => "constructor");

    homeTimelineService = HomeTimelineService(
        pleromaTimelineService: pleromaTimelineService,
        statusRepository: statusRepository,
        timelineLocalPreferencesBloc: timelineLocalPreferencesBloc,
        currentInstanceBloc: currentInstanceBloc,
        homeAccount: myAccountBloc.account,
        accountRepository: accountRepository,
        pleromaAccountService: pleromaAccountService);
    addDisposable(disposable: homeTimelineService);

    homeTimelinePaginationBloc = StatusCachedPaginationBloc(
        itemsCountPerPage: 20,
        maximumCachedPagesCount: null,
        statusListService: homeTimelineService);
    addDisposable(disposable: homeTimelinePaginationBloc);
    homeTimelinePaginationListBloc =
        StatusPaginationListBloc(paginationBloc: homeTimelinePaginationBloc);
    addDisposable(disposable: homeTimelinePaginationListBloc);

    localTimelineService = LocalTimelineService(
        pleromaTimelineService: pleromaTimelineService,
        statusRepository: statusRepository,
        currentInstanceBloc: currentInstanceBloc,
        timelineLocalPreferencesBloc: timelineLocalPreferencesBloc);
    addDisposable(disposable: localTimelineService);

    localTimelinePaginationBloc = StatusCachedPaginationBloc(
        itemsCountPerPage: 20,
        maximumCachedPagesCount: null,
        statusListService: localTimelineService);
    addDisposable(disposable: localTimelinePaginationBloc);
    localTimelinePaginationListBloc =
        StatusPaginationListBloc(paginationBloc: localTimelinePaginationBloc);
    addDisposable(disposable: localTimelinePaginationListBloc);

    publicTimelineService = PublicTimelineService(
        pleromaTimelineService: pleromaTimelineService,
        statusRepository: statusRepository,
        currentInstanceBloc: currentInstanceBloc,
        timelineLocalPreferencesBloc: timelineLocalPreferencesBloc);
    addDisposable(disposable: publicTimelineService);

    publicTimelinePaginationBloc = StatusCachedPaginationBloc(
        itemsCountPerPage: 20,
        maximumCachedPagesCount: null,
        statusListService: publicTimelineService);
    addDisposable(disposable: publicTimelinePaginationBloc);
    publicTimelinePaginationListBloc =
        StatusPaginationListBloc(paginationBloc: publicTimelinePaginationBloc);
    addDisposable(disposable: publicTimelinePaginationListBloc);

    var currentTimelineLocalPreferences = timelineLocalPreferencesBloc.value;

    timelineLocalPreferencesBloc.stream.listen((timelineLocalPreferences) {
      if (currentTimelineLocalPreferences == timelineLocalPreferences) {
        return;
      }
      currentTimelineLocalPreferences = timelineLocalPreferences;

      _logger.finest(() => "timelineLocalPreferences "
          "$currentTimelineLocalPreferences");

      homeTimelinePaginationListBloc.refresh();
      localTimelinePaginationListBloc.refresh();
      publicTimelinePaginationListBloc.refresh();
    });
  }

  IStatusCachedListService homeTimelineService;
  IStatusCachedPaginationBloc homeTimelinePaginationBloc;
  IStatusPaginationListBloc homeTimelinePaginationListBloc;

  IStatusCachedListService localTimelineService;
  IStatusCachedPaginationBloc localTimelinePaginationBloc;
  IStatusPaginationListBloc localTimelinePaginationListBloc;

  IStatusCachedListService publicTimelineService;
  IStatusCachedPaginationBloc publicTimelinePaginationBloc;
  IStatusPaginationListBloc publicTimelinePaginationListBloc;

  @override
  IStatusPaginationListBloc retrieveTimelineTabPaginationListBloc(
      TimelineTab tab) {
    switch (tab) {
      case TimelineTab.public:
        return publicTimelinePaginationListBloc;
        break;
      case TimelineTab.home:
        return homeTimelinePaginationListBloc;
        break;
      case TimelineTab.local:
        return localTimelinePaginationListBloc;
        break;
    }

    throw "retrieveTimelineTabPaginationListBloc unsupported tab = $tab";
  }

  static TimelinesHomeTabBloc createFromContext(
          BuildContext context) =>
      TimelinesHomeTabBloc(
          startTab: TimelineTab.home,
          pleromaTimelineService:
              IPleromaTimelineService.of(context, listen: false),
          pleromaAccountService:
              IPleromaAccountService.of(context, listen: false),
          statusRepository: IStatusRepository.of(context, listen: false),
          accountRepository: IAccountRepository.of(context, listen: false),
          myAccountBloc: IMyAccountBloc.of(context, listen: false),
          currentInstanceBloc:
              ICurrentAuthInstanceBloc.of(context, listen: false),
          timelineLocalPreferencesBloc:
              ITimelineLocalPreferencesBloc.of(context, listen: false));
}
