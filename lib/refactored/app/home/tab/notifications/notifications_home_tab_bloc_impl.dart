import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/app/auth/instance/current/current_instance_bloc.dart';
import 'package:fedi/refactored/app/home/tab/notifications/notifications_home_tab_bloc.dart';
import 'package:fedi/refactored/app/home/tab/notifications/notifications_home_tab_model.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/refactored/pleroma/notification/pleroma_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("notifications_home_tab_page_bloc_impl.dart");

class NotificationsHomeTabBloc extends DisposableOwner
    implements INotificationsHomeTabBloc {
  @override
  void selectTab(NotificationTab tab) {
    selectedTabSubject.add(tab);
  }

  // ignore: close_sinks
  BehaviorSubject<NotificationTab> selectedTabSubject;

  @override
  NotificationTab get selectedTab => selectedTabSubject.value;

  @override
  Stream<NotificationTab> get selectedTabStream => selectedTabSubject.stream;

  final IPleromaNotificationService pleromaNotificationService;
  final IPleromaAccountService pleromaAccountService;
  final IStatusRepository statusRepository;
  final IAccountRepository accountRepository;
  final IMyAccountBloc myAccountBloc;
  final ICurrentInstanceBloc currentInstanceBloc;

  NotificationsHomeTabBloc({
    @required NotificationTab startTab,
    @required this.pleromaNotificationService,
    @required this.pleromaAccountService,
    @required this.statusRepository,
    @required this.accountRepository,
    @required this.myAccountBloc,
    @required this.currentInstanceBloc,
  }) {
    selectedTabSubject = BehaviorSubject.seeded(startTab);

    addDisposable(subject: selectedTabSubject);

    _logger.finest(() => "constructor");
  }

  static NotificationsHomeTabBloc createFromContext(BuildContext context) =>
      NotificationsHomeTabBloc(
        startTab: NotificationTab.all,
        pleromaNotificationService:
            IPleromaNotificationService.of(context, listen: false),
        pleromaAccountService:
            IPleromaAccountService.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        accountRepository: IAccountRepository.of(context, listen: false),
        myAccountBloc: IMyAccountBloc.of(context, listen: false),
        currentInstanceBloc: ICurrentInstanceBloc.of(context, listen: false),
      );
//
//
//  @override
//  IStatusPaginationListBloc retrieveNotificationTabPaginationListBloc(
//      NotificationTab tab) {
//    switch (tab) {
//      case NotificationTab.public:
//        return publicNotificationPaginationListBloc;
//        break;
//      case NotificationTab.home:
//        return homeNotificationPaginationListBloc;
//        break;
//      case NotificationTab.local:
//        return localNotificationPaginationListBloc;
//        break;
//    }
//
//    throw "retrieveNotificationTabPaginationListBloc unsupported tab = $tab";
//  }
}
