import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaAuthStatusService
    extends IPleromaAuthApi implements IPleromaStatusService {
  static IPleromaAuthStatusService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaAuthStatusService>(
        context,
        listen: listen,
      );

  Future<IPleromaStatus> postStatus({
    required IPleromaPostStatus data,
  });

  Future<IPleromaScheduledStatus> scheduleStatus({
    required IPleromaScheduleStatus data,
  });

  Future deleteStatus({
    required String statusRemoteId,
  });

  Future<IPleromaStatus> muteStatus({
    required String statusRemoteId,
    required int? expireDurationInSeconds,
  });

  Future<IPleromaStatus> unMuteStatus({
    required String statusRemoteId,
  });

  Future<IPleromaStatus> pinStatus({
    required String statusRemoteId,
  });

  Future<IPleromaStatus> unPinStatus({
    required String statusRemoteId,
  });

  Future<IPleromaStatus> favouriteStatus({
    required String statusRemoteId,
  });

  Future<IPleromaStatus> unFavouriteStatus({
    required String statusRemoteId,
  });

  Future<IPleromaStatus> bookmarkStatus({
    required String statusRemoteId,
  });

  Future<IPleromaStatus> unBookmarkStatus({
    required String statusRemoteId,
  });

  Future<IPleromaStatus> reblogStatus({
    required String statusRemoteId,
  });

  Future<IPleromaStatus> unReblogStatus({
    required String statusRemoteId,
  });

  Future<List<IPleromaAccount>> favouritedBy({
    required String statusRemoteId,
    IPleromaPaginationRequest? pagination,
  });

  Future<List<IPleromaAccount>> rebloggedBy({
    required String statusRemoteId,
    IPleromaPaginationRequest? pagination,
  });
}
