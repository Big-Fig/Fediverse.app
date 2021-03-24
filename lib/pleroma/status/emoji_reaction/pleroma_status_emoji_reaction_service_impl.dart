import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/pleroma/status/emoji_reaction/pleroma_status_emoji_reaction_exception.dart';
import 'package:fedi/pleroma/status/emoji_reaction/pleroma_status_emoji_reaction_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

class PleromaStatusEmojiReactionService extends DisposableOwner
    implements IPleromaStatusEmojiReactionService {
  final pleromaStatusesRelativeUrlPath = "/api/v1/pleroma/statuses/";
  final reactionsRelativeUrlPath = "reactions";
  @override
  final IPleromaAuthRestService restService;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaStatusEmojiReactionService({required this.restService});

  @override
  Future<IPleromaStatus> addReaction({
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
  Future<IPleromaStatusEmojiReaction> getReaction({
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
  Future<List<IPleromaStatusEmojiReaction>> getReactions({
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
  Future<IPleromaStatus> removeReaction({
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

  PleromaStatus parseStatusResponse(Response httpResponse) {
    RestResponse<PleromaStatus> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaStatus.fromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body!;
    } else {
      throw PleromaStatusEmojiReactionException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  PleromaStatusEmojiReaction parseEmojiReactionResponse(Response httpResponse) {
    RestResponse<PleromaStatusEmojiReaction> restResponse =
        RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaStatusEmojiReaction.fromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body!;
    } else {
      throw PleromaStatusEmojiReactionException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  List<PleromaStatusEmojiReaction> parseEmojiReactionListResponse(
    Response httpResponse,
  ) {
    RestResponse<List<PleromaStatusEmojiReaction>> restResponse =
        RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaStatusEmojiReaction.listFromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body!;
    } else {
      throw PleromaStatusEmojiReactionException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }
}
