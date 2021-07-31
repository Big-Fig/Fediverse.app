import 'package:pleroma_fediverse_api/src/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/status/pleroma_api_status_service.dart';

abstract class IPleromaApiAuthStatusService extends IPleromaApiAuth
    implements IPleromaApiStatusService {
  static const maximumMediaAttachmentCount = 8;

  Future<IPleromaApiStatus> postStatus({
    required IPleromaApiPostStatus data,
  });

  Future<IPleromaApiScheduledStatus> scheduleStatus({
    required IPleromaApiScheduleStatus data,
  });

  Future deleteStatus({
    required String statusRemoteId,
  });

  Future<IPleromaApiStatus> muteStatus({
    required String statusRemoteId,
    required int? expireDurationInSeconds,
  });

  Future<IPleromaApiStatus> unMuteStatus({
    required String statusRemoteId,
  });

  Future<IPleromaApiStatus> pinStatus({
    required String statusRemoteId,
  });

  Future<IPleromaApiStatus> unPinStatus({
    required String statusRemoteId,
  });

  Future<IPleromaApiStatus> favouriteStatus({
    required String statusRemoteId,
  });

  Future<IPleromaApiStatus> unFavouriteStatus({
    required String statusRemoteId,
  });

  Future<IPleromaApiStatus> bookmarkStatus({
    required String statusRemoteId,
  });

  Future<IPleromaApiStatus> unBookmarkStatus({
    required String statusRemoteId,
  });

  Future<IPleromaApiStatus> reblogStatus({
    required String statusRemoteId,
  });

  Future<IPleromaApiStatus> unReblogStatus({
    required String statusRemoteId,
  });

  Future<List<IPleromaApiAccount>> favouritedBy({
    required String statusRemoteId,
    IPleromaApiPaginationRequest? pagination,
  });

  Future<List<IPleromaApiAccount>> rebloggedBy({
    required String statusRemoteId,
    IPleromaApiPaginationRequest? pagination,
  });
}
