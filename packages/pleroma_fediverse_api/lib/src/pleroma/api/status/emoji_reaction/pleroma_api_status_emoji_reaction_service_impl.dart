import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/status/emoji_reaction/pleroma_api_status_emoji_reaction_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:path/path.dart' as path;

var _urlPath = path.Context(style: path.Style.url);

class PleromaApiStatusEmojiReactionService extends BasePleromaApiService
    with PleromaApiAuthMixinService
    implements IPleromaApiStatusEmojiReactionService {
  final pleromaStatusesRelativeUrlPath = '/api/v1/pleroma/statuses/';
  final reactionsRelativeUrlPath = 'reactions';
  final IPleromaApiAuthRestService authRestService;

  @override
  IPleromaApiAuthRestService get restApiAuthService => authRestService;

  PleromaApiStatusEmojiReactionService({required this.authRestService})
      : super(
          restService: authRestService,
        );

  @override
  Future<IPleromaApiStatus> addReaction({
    required String? statusRemoteId,
    required String? emoji,
  }) async {
    var request = RestRequest.put(
      relativePath: _urlPath.join(
        pleromaStatusesRelativeUrlPath,
        statusRemoteId,
        reactionsRelativeUrlPath,
        emoji,
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiStatus.fromJson,
    );
  }

  @override
  Future<IPleromaApiStatusEmojiReaction> getReaction({
    required String statusRemoteId,
    required String emoji,
  }) async {
    var request = RestRequest.get(
      relativePath: _urlPath.join(
        pleromaStatusesRelativeUrlPath,
        statusRemoteId,
        reactionsRelativeUrlPath,
        emoji,
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    // pleroma returns array even when we specify emoji
    // todo: check implementation
    var listResponse = await restService.processJsonListResponse(
      httpResponse,
      PleromaApiStatusEmojiReaction.fromJson,
    );

    return listResponse.first;
  }

  @override
  Future<List<IPleromaApiStatusEmojiReaction>> getReactions({
    required String statusRemoteId,
  }) async {
    var request = RestRequest.get(
      relativePath: _urlPath.join(
        pleromaStatusesRelativeUrlPath,
        statusRemoteId,
        reactionsRelativeUrlPath,
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiStatusEmojiReaction.fromJson,
    );
  }

  @override
  Future<IPleromaApiStatus> removeReaction({
    required String statusRemoteId,
    required String emoji,
  }) async {
    var request = RestRequest.delete(
      relativePath: _urlPath.join(
        pleromaStatusesRelativeUrlPath,
        statusRemoteId,
        reactionsRelativeUrlPath,
        emoji,
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiStatus.fromJson,
    );
  }
}
