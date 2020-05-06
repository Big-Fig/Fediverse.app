import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/refactored/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_bloc_impl.dart';
import 'package:fedi/refactored/app/timeline/timeline_model.dart';
import 'package:fedi/refactored/app/timeline/timeline_status_cached_list_bloc_impl.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/refactored/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';

class HomeTimelineStatusCachedListBloc extends TimelineStatusCachedListBloc
    implements IStatusCachedListBloc {
  final IAccount homeAccount;
  final IAccountRepository accountRepository;
  final IPleromaAccountService pleromaAccountService;

  DateTime lastPreRefreshAllTime;

  @override
  ITimelineSettings retrieveTimelineSettings() =>
      TimelineSettings.home(excludeVisibilities: [
        PleromaVisibility.DIRECT,
      ], onlyLocal: null, onlyNotMuted: true, homeAccount: homeAccount);

  HomeTimelineStatusCachedListBloc({
    @required IPleromaTimelineService pleromaTimelineService,
    @required IStatusRepository statusRepository,
    @required TimelineLocalPreferencesBloc timelineLocalPreferencesBloc,
    @required ICurrentAuthInstanceBloc currentInstanceBloc,
    @required this.homeAccount,
    @required this.accountRepository,
    @required this.pleromaAccountService,
  }) : super(
            currentInstanceBloc: currentInstanceBloc,
            pleromaTimelineService: pleromaTimelineService,
            timelineLocalPreferencesBloc: timelineLocalPreferencesBloc,
            statusRepository: statusRepository);

  @override
  Future preRefreshAllAction() async {
    await super.preRefreshAllAction();
    if (lastPreRefreshAllTime == null ||
        lastPreRefreshAllTime.difference(DateTime.now()) >
            Duration(minutes: 1)) {
      var followingAccounts = await pleromaAccountService.getAccountFollowings(
          accountRemoteId: homeAccount.remoteId);

      await accountRepository.updateAccountFollowings(
          homeAccount.remoteId, followingAccounts);
    }
  }
}
