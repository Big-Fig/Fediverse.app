import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/conversation/pleroma_conversation_exception.dart';
import 'package:fedi/pleroma/api/conversation/pleroma_conversation_model.dart';
import 'package:fedi/pleroma/api/conversation/pleroma_conversation_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_pagination_model.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_status_model.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:path/path.dart';

class PleromaConversationService extends DisposableOwner
    implements IPleromaConversationService {
  final conversationRelativeUrlPath = "/api/v1/conversations/";
  final pleromaConversationRelativeUrlPath = "/api/v1/pleroma/conversations/";
  final conversationStatusesRelativeUrlPath = "statuses";
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

  PleromaConversationService({required this.restService});

  @override
  Future<List<IPleromaStatus>> getConversationStatuses({
    required String? conversationRemoteId,
    IPleromaPaginationRequest? pagination,
  }) async {
    var request = RestRequest.get(
      relativePath: join(
        pleromaConversationRelativeUrlPath,
        conversationRemoteId,
        conversationStatusesRelativeUrlPath,
      ),
      queryArgs: [
        ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
      ],
    );
    var httpResponse = await restService.sendHttpRequest(request);

    RestResponse<List<IPleromaStatus>> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaStatus.listFromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body!;
    } else {
      throw PleromaConversationException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  @override
  Future<IPleromaConversation> getConversation({
    required String? conversationRemoteId,
  }) async {
    var request = RestRequest.get(
      relativePath: join(
        conversationRelativeUrlPath,
        conversationRemoteId,
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    RestResponse<PleromaConversation> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaConversation.fromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body!;
    } else {
      throw PleromaConversationException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  @override
  Future<List<IPleromaConversation>> getConversations({
    IPleromaPaginationRequest? pagination,
    // pleroma only recipients
    List<String>? recipientsIds,
  }) async {
    var queryArgs = [
      ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
    ];

    if (recipientsIds?.isNotEmpty == true) {
      // array
      // todo: pleroma only
      queryArgs.addAll(
        recipientsIds!.map(
          (id) => RestRequestQueryArg(
            "recipients[]",
            id,
          ),
        ),
      );
    }

    var request = RestRequest.get(
      relativePath: join(conversationRelativeUrlPath),
      queryArgs: queryArgs,
    );
    var httpResponse = await restService.sendHttpRequest(request);

    RestResponse<List<IPleromaConversation>> restResponse =
        RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaConversation.listFromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body!;
    } else {
      throw PleromaConversationException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  @override
  Future<bool> deleteConversation({
    required String? conversationRemoteId,
  }) async {
    var request = RestRequest.delete(
      relativePath: join(
        conversationRelativeUrlPath,
        conversationRemoteId,
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    RestResponse<PleromaConversation> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaConversation.fromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return true;
    } else {
      throw PleromaConversationException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  @override
  Future<IPleromaConversation> markConversationAsRead({
    required String conversationRemoteId,
  }) async {
    var request = RestRequest.post(
      relativePath: join(
        conversationRelativeUrlPath,
        conversationRemoteId,
        "read",
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    RestResponse<PleromaConversation> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaConversation.fromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body!;
    } else {
      throw PleromaConversationException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }
}
