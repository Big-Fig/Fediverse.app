import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/announcement/pleroma_announcement_exception.dart';
import 'package:fedi/pleroma/announcement/pleroma_announcement_model.dart';
import 'package:fedi/pleroma/announcement/pleroma_announcement_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

class PleromaAnnouncementService extends DisposableOwner
    implements IPleromaAnnouncementService {
  final announcementRelativeUrlPath = "/api/v1/announcements";
  @override
  final IPleromaRestService restService;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState? get pleromaApiState => restService.pleromaApiState;

  @override
  Stream<bool> get isApiReadyToUseStream => restService.isApiReadyToUseStream;

  @override
  bool get isApiReadyToUse => restService.isApiReadyToUse;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaAnnouncementService({required this.restService});

  List<IPleromaAnnouncement> parseAnnouncementListResponse(
      Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaAnnouncement.listFromJsonString(httpResponse.body);
    } else {
      throw PleromaAnnouncementException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future<List<IPleromaAnnouncement>> getAnnouncements({
    bool withDismissed = false,
  }) async {
    var httpResponse = await restService.sendHttpRequest(RestRequest.get(
        relativePath: announcementRelativeUrlPath,
        queryArgs: [
          RestRequestQueryArg("with_dismissed", withDismissed.toString())
        ]))!;

    return parseAnnouncementListResponse(httpResponse);
  }

  @override
  Future dismissAnnouncement({
    required String announcementId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(RestRequest.post(
      relativePath:
          urlPath.join(announcementRelativeUrlPath, announcementId, "dismiss"),
    ))!;

    if (httpResponse.statusCode != 200) {
      throw PleromaAnnouncementException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future addAnnouncementReaction({
    required String announcementId,
    required String name,
  }) async {
    var httpResponse = await restService.sendHttpRequest(RestRequest.put(
      relativePath: urlPath.join(
          announcementRelativeUrlPath, announcementId, "reactions", name),
    ))!;

    if (httpResponse.statusCode != 200) {
      // todo: handle 422: Unprocessable Entity
      // {"error":"Validation failed: Name is not a recognized emoji"}
      throw PleromaAnnouncementException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future removeAnnouncementReaction({
    required String announcementId,
    required String name,
  }) async {
    var httpResponse = await restService.sendHttpRequest(RestRequest.delete(
      relativePath: urlPath.join(
          announcementRelativeUrlPath, announcementId, "reactions", name),
    ))!;

    if (httpResponse.statusCode != 200) {
      // todo: handle 422: Unprocessable Entity
      // {"error":"Validation failed: Name is not a recognized emoji"}
      throw PleromaAnnouncementException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future dispose() async {
    return await super.dispose();
  }
}
