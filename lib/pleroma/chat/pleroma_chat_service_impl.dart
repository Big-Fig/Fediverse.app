import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_exception.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:fedi/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

class PleromaChatService extends DisposableOwner
    implements IPleromaChatService {
  final chatRelativeUrlPath = "/api/v1/pleroma/chats";
  @override
  final IPleromaAuthRestService restService;

  @override
  bool get isPleromaInstance => restService.isPleromaInstance;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  Stream<bool> get isApiReadyToUseStream => restService.isApiReadyToUseStream;

  @override
  bool get isApiReadyToUse => restService.isApiReadyToUse;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaChatService({@required this.restService});

  List<IPleromaChat> parseChatListResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaChat.listFromJsonString(httpResponse.body);
    } else {
      throw PleromaChatException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  IPleromaChat parseChatResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaChat.fromJsonString(httpResponse.body);
    } else {
      throw PleromaChatException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  List<IPleromaChatMessage> parseChatMessageListResponse(
      Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaChatMessage.listFromJsonString(httpResponse.body);
    } else {
      throw PleromaChatException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  IPleromaChatMessage parseChatMessageResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaChatMessage.fromJsonString(httpResponse.body);
    } else {
      throw PleromaChatException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future<List<IPleromaChat>> getChats({
    String sinceId,
    String minId,
    String maxId,
    int limit = 20,
  }) async {
    var httpResponse = await restService
        .sendHttpRequest(RestRequest.get(relativePath: chatRelativeUrlPath));

    return parseChatListResponse(httpResponse);
  }

  @override
  Future<List<IPleromaChatMessage>> getChatMessages({
    @required String chatId,
    String sinceId,
    String minId,
    String maxId,
    int limit = 20,
  }) async {
    assert(chatId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.get(
        relativePath: urlPath.join(chatRelativeUrlPath, chatId, "messages"),
        queryArgs: [
          RestRequestQueryArg("since_id", sinceId),
          RestRequestQueryArg("min_id", minId),
          RestRequestQueryArg("max_id", maxId),
          RestRequestQueryArg("limit", limit?.toString()),
        ]));

    return parseChatMessageListResponse(httpResponse);
  }

  @override
  Future<IPleromaChat> markChatAsRead({
    @required String chatId,
    @required String lastReadChatMessageId,
  }) async {
    assert(chatId?.isNotEmpty == true);
    assert(lastReadChatMessageId != null);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
          relativePath: urlPath.join(chatRelativeUrlPath, chatId, "read"),
          bodyJson: {
            "last_read_id": lastReadChatMessageId,
          }),
    );

    return parseChatResponse(httpResponse);
  }

  @override
  Future<IPleromaChat> getOrCreateChatByAccountId(
      {@required String accountId}) async {
    assert(accountId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.post(
        relativePath:
            urlPath.join(chatRelativeUrlPath, "by-account-id", accountId)));

    return parseChatResponse(httpResponse);
  }

  @override
  Future<IPleromaChat> getChat({@required String id}) async {
    assert(id?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(
        RestRequest.get(relativePath: urlPath.join(chatRelativeUrlPath, id)));

    return parseChatResponse(httpResponse);
  }

  @override
  Future<IPleromaChatMessage> sendMessage(
      {@required String chatId,
      @required IPleromaChatMessageSendData data}) async {
    assert(chatId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(RestRequest.post(
        relativePath: urlPath.join(chatRelativeUrlPath, chatId, "messages"),
        bodyJson: data.toJson()));

    return parseChatMessageResponse(httpResponse);
  }

  @override
  Future dispose() async {
    return await super.dispose();
  }
}
