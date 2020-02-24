import 'package:fedi/Pleroma/account/pleroma_account_service.dart';
import 'package:fedi/Pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/timeline/home/home_timeline_service_impl.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preferences_model.dart';
import 'package:fedi/app/timeline/timeline_service.dart';
import 'package:fedi/app/timeline/timeline_widget.dart';
import 'package:flutter/widgets.dart';

class HomeTimelineWidget extends TimelineWidget {
  final IAccount homeAccount;

  HomeTimelineWidget(
      {@required bool onlyLocal,
      @required String localUrlHost,
        @required Key key,
        @required this.homeAccount})
      : super(localUrlHost: localUrlHost, onlyLocal: onlyLocal, key:key);

  @override
  ITimelineService createTimelineService(
      {@required BuildContext context,
      @required TimelineLocalPreferences timelinePreferences,
      @required IStatusRepository statusRepository,
      @required IPleromaTimelineService pleromaTimelineService}) {
    return HomeTimelineService(
        pleromaTimelineService: pleromaTimelineService,
        timelineLocalPreferences: timelinePreferences,
        statusRepository: statusRepository,
        localUrlHost: localUrlHost,
        onlyLocal: onlyLocal,
        homeAccount: homeAccount,
        pleromaAccountService:
            IPleromaAccountService.of(context, listen: false),
        accountRepository: IAccountRepository.of(context, listen: false));
  }
}
