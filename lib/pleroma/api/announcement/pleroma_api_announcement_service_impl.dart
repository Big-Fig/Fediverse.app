import 'package:fedi/pleroma/api/announcement/pleroma_api_announcement_model.dart';
import 'package:fedi/pleroma/api/announcement/pleroma_api_announcement_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:path/path.dart' as path;

var _urlPath = path.Context(style: path.Style.url);

class PleromaApiAnnouncementService extends BasePleromaApiService
    implements IPleromaApiAnnouncementService {
  final announcementRelativeUrlPath = "/api/v1/announcements";
  @override
  final IPleromaApiRestService restService;

  PleromaApiAnnouncementService({
    required this.restService,
  }) : super(
          restService: restService,
        );

  @override
  Future<List<IPleromaApiAnnouncement>> getAnnouncements({
    bool withDismissed = false,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: announcementRelativeUrlPath,
        queryArgs: [
          RestRequestQueryArg(
            key: "with_dismissed",
            value: withDismissed.toString(),
          ),
        ],
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiAnnouncement.fromJson,
    );
  }

  @override
  Future dismissAnnouncement({
    required String announcementId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: _urlPath.join(
          announcementRelativeUrlPath,
          announcementId,
          "dismiss",
        ),
      ),
    );

    return restService.processEmptyResponse(
      httpResponse,
    );
  }

  @override
  Future addAnnouncementReaction({
    required String announcementId,
    required String name,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.put(
        relativePath: _urlPath.join(
          announcementRelativeUrlPath,
          announcementId,
          "reactions",
          name,
        ),
      ),
    );

    return restService.processEmptyResponse(
      httpResponse,
    );
  }

  @override
  Future removeAnnouncementReaction({
    required String announcementId,
    required String name,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.delete(
        relativePath: _urlPath.join(
          announcementRelativeUrlPath,
          announcementId,
          "reactions",
          name,
        ),
      ),
    );

    return restService.processEmptyResponse(
      httpResponse,
    );
  }
}
