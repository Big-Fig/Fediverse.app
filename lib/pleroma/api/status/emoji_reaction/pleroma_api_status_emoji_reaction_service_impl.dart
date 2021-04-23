import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/pleroma/api/status/emoji_reaction/pleroma_api_status_emoji_reaction_exception.dart';
import 'package:fedi/pleroma/api/status/emoji_reaction/pleroma_api_status_emoji_reaction_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

class PleromaApiStatusEmojiReactionService extends DisposableOwner
    implements IPleromaApiStatusEmojiReactionService {
  final pleromaStatusesRelativeUrlPath = "/api/v1/pleroma/statuses/";
  final reactionsRelativeUrlPath = "reactions";
  @override
  final IPleromaApiAuthRestService restService;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaApiStatusEmojiReactionService({required this.restService});

  @override
  Future<IPleromaApiStatus> addReaction({
    required String? statusRemoteId,
    required String? emoji,
  }) async {
    var request = RestRequest.put(
      relativePath: urlPath.join(
        pleromaStatusesRelativeUrlPath,
        statusRemoteId,
        reactionsRelativeUrlPath,
        emoji,
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  @override
  Future<IPleromaApiStatusEmojiReaction> getReaction({
    required String statusRemoteId,
    required String emoji,
  }) async {
    var request = RestRequest.get(
      relativePath: urlPath.join(
        pleromaStatusesRelativeUrlPath,
        statusRemoteId,
        reactionsRelativeUrlPath,
        emoji,
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    // pleroma returns array even when we specify emoji
    return parseEmojiReactionListResponse(httpResponse).first;
  }

  @override
  Future<List<IPleromaApiStatusEmojiReaction>> getReactions({
    required String statusRemoteId,
  }) async {
    var request = RestRequest.get(
      relativePath: urlPath.join(
        pleromaStatusesRelativeUrlPath,
        statusRemoteId,
        reactionsRelativeUrlPath,
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return parseEmojiReactionListResponse(httpResponse);
  }

  @override
  Future<IPleromaApiStatus> removeReaction({
    required String? statusRemoteId,
    required String? emoji,
  }) async {
    var request = RestRequest.delete(
      relativePath: urlPath.join(
        pleromaStatusesRelativeUrlPath,
        statusRemoteId,
        reactionsRelativeUrlPath,
        emoji,
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return parseStatusResponse(httpResponse);
  }

  PleromaApiStatus parseStatusResponse(Response httpResponse) {
    RestResponse<PleromaApiStatus> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaApiStatus.fromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body!;
    } else {
      throw PleromaApiStatusEmojiReactionException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  PleromaApiStatusEmojiReaction parseEmojiReactionResponse(Response httpResponse) {
    RestResponse<PleromaApiStatusEmojiReaction> restResponse =
        RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaApiStatusEmojiReaction.fromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body!;
    } else {
      throw PleromaApiStatusEmojiReactionException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  List<PleromaApiStatusEmojiReaction> parseEmojiReactionListResponse(
    Response httpResponse,
  ) {
    RestResponse<List<PleromaApiStatusEmojiReaction>> restResponse =
        RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaApiStatusEmojiReaction.listFromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body!;
    } else {
      throw PleromaApiStatusEmojiReactionException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }
}
