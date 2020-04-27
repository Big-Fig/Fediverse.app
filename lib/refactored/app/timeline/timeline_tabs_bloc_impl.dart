import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/app/timeline/home/home_timeline_tab_bloc_impl.dart';
import 'package:fedi/refactored/app/timeline/local/local_timeline_tab_bloc_impl.dart';
import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/refactored/app/timeline/public/public_timeline_tab_bloc_impl.dart';
import 'package:fedi/refactored/app/timeline/tab/timeline_tab_bloc.dart';
import 'package:fedi/refactored/app/timeline/tab/timeline_tab_model.dart';
import 'package:fedi/refactored/app/timeline/timeline_tabs_bloc.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_service.dart';

import 'package:fedi/refactored/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/refactored/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("timeline_tabs_bloc_impl.dart");

class TimelineTabsBloc extends DisposableOwner implements ITimelineTabsBloc {
  static TimelineTabsBloc createFromContext(
          BuildContext context, TimelineTab startTab) =>
      TimelineTabsBloc(
          startTab: startTab,
          pleromaTimelineService:
              IPleromaTimelineService.of(context, listen: false),
          currentInstanceBloc:
              ICurrentAuthInstanceBloc.of(context, listen: false),
          timelineLocalPreferencesBloc:
              ITimelineLocalPreferencesBloc.of(context, listen: false),
          pleromaAccountService:
              IPleromaAccountService.of(context, listen: false),
          pleromaWebSocketsService:
              IPleromaWebSocketsService.of(context, listen: false),
          statusRepository: IStatusRepository.of(context, listen: false),
          myAccountBloc: IMyAccountBloc.of(context, listen: false),
          accountRepository: IAccountRepository.of(context, listen: false));

  final Map<TimelineTab, ITimelineTabBloc> tabsMap = Map();

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
  final IPleromaWebSocketsService
  pleromaWebSocketsService;

  TimelineTabsBloc({
    @required TimelineTab startTab,
    @required this.pleromaTimelineService,
    @required this.pleromaAccountService,
    @required this.statusRepository,
    @required this.accountRepository,
    @required this.myAccountBloc,
    @required this.currentInstanceBloc,
    @required this.timelineLocalPreferencesBloc,
    @required this.pleromaWebSocketsService,
  }) {
    selectedTabSubject = BehaviorSubject.seeded(startTab);

    addDisposable(subject: selectedTabSubject);

    _logger.finest(() => "constructor");
    tabsMap.addAll({
      TimelineTab.home: HomeTimelineTabBloc(
        currentInstanceBloc: currentInstanceBloc,
        pleromaAccountService: pleromaAccountService,
        statusRepository: statusRepository,
        accountRepository: accountRepository,
        myAccountBloc: myAccountBloc,
        pleromaWebSocketsService:
            pleromaWebSocketsService,
        pleromaTimelineService: pleromaTimelineService,
        timelineLocalPreferencesBloc: timelineLocalPreferencesBloc,
      ),
      TimelineTab.local: LocalTimelineTabBloc(
        currentInstanceBloc: currentInstanceBloc,
        statusRepository: statusRepository,
        pleromaWebSocketsService:
            pleromaWebSocketsService,
        pleromaTimelineService: pleromaTimelineService,
        timelineLocalPreferencesBloc: timelineLocalPreferencesBloc,
      ),
      TimelineTab.public: PublicTimelineTabBloc(
        currentInstanceBloc: currentInstanceBloc,
        statusRepository: statusRepository,
        pleromaWebSocketsService:
            pleromaWebSocketsService,
        pleromaTimelineService: pleromaTimelineService,
        timelineLocalPreferencesBloc: timelineLocalPreferencesBloc,
      )
    });

    addDisposable(disposable: CustomDisposable(() {
      tabsMap.values.forEach((bloc) => bloc.dispose());
    }));
  }

  @override
  IPaginationListWithNewItemsBloc<PaginationPage<IStatus>, IStatus>
      retrieveTimelineTabPaginationListBloc(TimelineTab tab) =>
          tabsMap[tab].paginationListWithNewItemsBloc;

  @override
  List<TimelineTab> get tabs => tabsMap.keys.toList();
}
