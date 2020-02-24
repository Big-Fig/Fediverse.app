import 'package:fedi/Pleroma/account/pleroma_account_service.dart';
import 'package:fedi/Pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/timeline/timeline_service_impl.dart';
import 'package:flutter/widgets.dart';

import 'home_timeline_service.dart';

class HomeTimelineService extends TimelineService
    implements IHomeTimelineService {
  final bool onlyLocal;
  final String localUrlHost;
  final IAccount homeAccount;
  final IAccountRepository accountRepository;
  final IPleromaAccountService pleromaAccountService;

  @override
  ITimelineSettings settings;

  HomeTimelineService({
    @required IPleromaTimelineService pleromaTimelineService,
    @required IStatusRepository statusRepository,
    @required TimelineLocalPreferences timelineLocalPreferences,
    @required this.onlyLocal,
    @required this.localUrlHost,
    @required this.homeAccount,
    @required this.accountRepository,
    @required this.pleromaAccountService,
  }) : super(
            pleromaTimelineService: pleromaTimelineService,
            timelineLocalPreferences: timelineLocalPreferences,
            statusRepository: statusRepository) {
    settings = TimelineSettings.home(
        localPreferences: null,
        excludeVisibilities: [
          PleromaVisibility.DIRECT,
          PleromaVisibility.LIST,
          PleromaVisibility.UNLISTED
        ],
        onlyLocal: onlyLocal,
        notMuted: true,
        localUrlHost: localUrlHost,
        homeAccount: homeAccount);
  }

  @override
  Future refresh() async {
    var followingAccounts = await pleromaAccountService.getAccountFollowings(
        accountRemoteId: homeAccount.remoteId);

    await accountRepository.updateAccountFollowings(homeAccount.remoteId,
        followingAccounts);
  }
}
