import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_exception.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

class PleromaApiChatService extends DisposableOwner
    implements IPleromaApiChatService {
  final chatRelativeUrlPath = "/api/v1/pleroma/chats";
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

  PleromaApiChatService({required this.restService});

  List<IPleromaApiChat> parseChatListResponse(Response httpResponse) {
    if (httpResponse.statusCode == RestResponse.successResponseStatusCode) {
      return PleromaApiChat.listFromJsonString(
        httpResponse.body,
      );
    } else {
      throw PleromaApiChatException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  IPleromaApiChat parseChatResponse(Response httpResponse) {
    if (httpResponse.statusCode == RestResponse.successResponseStatusCode) {
      return PleromaApiChat.fromJsonString(
        httpResponse.body,
      );
    } else {
      throw PleromaApiChatException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  List<IPleromaApiChatMessage> parseChatMessageListResponse(
    Response httpResponse,
  ) {
    if (httpResponse.statusCode == RestResponse.successResponseStatusCode) {
      return PleromaApiChatMessage.listFromJsonString(
        httpResponse.body,
      );
    } else {
      throw PleromaApiChatException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  IPleromaApiChatMessage parseChatMessageResponse(Response httpResponse) {
    if (httpResponse.statusCode == RestResponse.successResponseStatusCode) {
      return PleromaApiChatMessage.fromJsonString(
        httpResponse.body,
      );
    } else {
      throw PleromaApiChatException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  @override
  Future<List<IPleromaApiChat>> getChats({
    IPleromaApiPaginationRequest? pagination,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: chatRelativeUrlPath,
        // todo: pagination not supported yet and API send error if pagination args exist
        // https://git.pleroma.social/pleroma/pleroma/-/issues/2140
        // queryArgs: pagination?.toQueryArgs(),
      ),
    );

    return parseChatListResponse(httpResponse);
  }

  @override
  Future<List<IPleromaApiChatMessage>> getChatMessages({
    required String? chatId,
    IPleromaApiPaginationRequest? pagination,
  }) async {
    assert(chatId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: urlPath.join(
          chatRelativeUrlPath,
          chatId,
          "messages",
        ),
        queryArgs: [
          ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
        ],
      ),
    );

    return parseChatMessageListResponse(httpResponse);
  }

  @override
  Future<IPleromaApiChat> markChatAsRead({
    required String? chatId,
    required String? lastReadChatMessageId,
  }) async {
    assert(chatId?.isNotEmpty == true);
    assert(lastReadChatMessageId != null);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: urlPath.join(
          chatRelativeUrlPath,
          chatId,
          "read",
        ),
        bodyJson: {
          "last_read_id": lastReadChatMessageId,
        },
      ),
    );

    return parseChatResponse(httpResponse);
  }

  @override
  Future<IPleromaApiChat> getOrCreateChatByAccountId({
    required String? accountId,
  }) async {
    assert(accountId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: urlPath.join(
          chatRelativeUrlPath,
          "by-account-id",
          accountId,
        ),
      ),
    );

    return parseChatResponse(httpResponse);
  }

  @override
  Future<IPleromaApiChat> getChat({
    required String? id,
  }) async {
    assert(id?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: urlPath.join(
          chatRelativeUrlPath,
          id,
        ),
      ),
    );

    return parseChatResponse(httpResponse);
  }

  @override
  Future<IPleromaApiChatMessage> sendMessage({
    required String? chatId,
    required IPleromaApiChatMessageSendData data,
  }) async {
    assert(chatId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: urlPath.join(
          chatRelativeUrlPath,
          chatId,
          "messages",
        ),
        headers: {
          if (data.idempotencyKey?.isNotEmpty == true)
            "Idempotency-Key": data.idempotencyKey!,
        },
        bodyJson: data.toJson(),
      ),
    );

    return parseChatMessageResponse(httpResponse);
  }

  @override
  Future deleteChatMessage({
    required String? chatMessageRemoteId,
    required String? chatId,
  }) async {
    await restService.sendHttpRequest(
      RestRequest.delete(
        relativePath: urlPath.join(
          chatRelativeUrlPath,
          chatId,
          "messages",
          chatMessageRemoteId,
        ),
      ),
    );
  }

  @override
  bool get isMastodon => restService.isMastodon;

  @override
  bool get isPleroma => restService.isPleroma;
}
