import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/pleroma/conversation/pleroma_conversation_exception.dart';
import 'package:fedi/refactored/pleroma/conversation/pleroma_conversation_model.dart';
import 'package:fedi/refactored/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:fedi/refactored/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/refactored/rest/rest_request_model.dart';
import 'package:fedi/refactored/rest/rest_response_model.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

class PleromaConversationService implements IPleromaConversationService {
  final conversationRelativeUrlPath = "/api/v1/conversations/";
  final pleromaConversationRelativeUrlPath = "/api/v1/pleroma/conversations/";
  final conversationStatusesRelativeUrlPath = "statuses";
  final IPleromaAuthRestService restService;

  @override
  Stream<PleromaApiState> get pleromaStateStream =>
      restService.pleromaStateStream;

  @override
  PleromaApiState get pleromaState => restService.pleromaState;

  @override
  Stream<bool> get isApiReadyToUseStream => restService.isApiReadyToUseStream;

  @override
  bool get isApiReadyToUse => restService.isApiReadyToUse;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaConversationService({@required this.restService});

  @override
  void dispose() {
    // nothing
  }

  @override
  Future<List<IPleromaStatus>> getConversationStatuses(
      {@required String conversationRemoteId,
      @required int limit,
      @required String maxId,
      @required String sinceId}) async {
    var request = RestRequest.get(
        relativePath: join(pleromaConversationRelativeUrlPath, conversationRemoteId,
            conversationStatusesRelativeUrlPath),
        queryArgs: [
          RestRequestQueryArg("since_id", sinceId),
          RestRequestQueryArg("max_id", maxId),
          RestRequestQueryArg("limit", limit?.toString()),
        ]);
    var httpResponse = await restService.sendHttpRequest(request);

    RestResponse<List<IPleromaStatus>> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) =>
          PleromaStatus.listFromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw new PleromaConversationException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future<IPleromaConversation> getConversation(
      {@required String conversationRemoteId}) async {
    var request = RestRequest.get(
        relativePath: join(conversationRelativeUrlPath, conversationRemoteId));
    var httpResponse = await restService.sendHttpRequest(request);

    RestResponse<PleromaConversation> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) =>
          PleromaConversation.fromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw new PleromaConversationException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future<List<IPleromaConversation>> getConversations(
      {String maxId,
      String sinceId,
      String minId,

      /// Pleroma only
      /// Only return conversations with the given recipients
      List<String> recipientsIds,
      int limit}) async {
    var queryArgs = [
      RestRequestQueryArg("since_id", sinceId),
      RestRequestQueryArg("max_id", maxId),
      RestRequestQueryArg("min_id", minId),
      RestRequestQueryArg("limit", limit?.toString()),
    ];

    if (recipientsIds?.isNotEmpty == true) {
      // array
      queryArgs.addAll(recipientsIds?.map((id) {
        return RestRequestQueryArg("recipients", id);
      }));
    }

    var request = RestRequest.get(
      relativePath: join(conversationRelativeUrlPath),
      queryArgs: queryArgs,
    );
    var httpResponse = await restService.sendHttpRequest(request);

    RestResponse<List<IPleromaConversation>> restResponse =
        RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) =>
          PleromaConversation.listFromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw new PleromaConversationException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future<bool> deleteConversation(
      {@required String conversationRemoteId}) async {
    var request = RestRequest.get(
        relativePath: join(conversationRelativeUrlPath, conversationRemoteId));
    var httpResponse = await restService.sendHttpRequest(request);

    RestResponse<PleromaConversation> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) =>
          PleromaConversation.fromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return true;
    } else {
      throw new PleromaConversationException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future<IPleromaConversation> markConversationAsRead(
      {@required String conversationRemoteId}) async {
    var request = RestRequest.post(
        relativePath:
            join(conversationRelativeUrlPath, conversationRemoteId, "read"));
    var httpResponse = await restService.sendHttpRequest(request);

    RestResponse<PleromaConversation> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) =>
          PleromaConversation.fromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw new PleromaConversationException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }
}
