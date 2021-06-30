import 'package:fedi/pleroma/api/conversation/pleroma_api_conversation_model.dart';
import 'package:fedi/pleroma/api/conversation/pleroma_api_conversation_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart';

final _logger = Logger('pleroma_api_conversation_service_impl.dart');

class PleromaApiConversationService extends BasePleromaApiService
    with PleromaApiAuthMixinService
    implements IPleromaApiConversationService {
  final conversationRelativeUrlPath = '/api/v1/conversations/';
  final pleromaConversationRelativeUrlPath = '/api/v1/pleroma/conversations/';
  final conversationStatusesRelativeUrlPath = 'statuses';

  @override
  final IPleromaApiAuthRestService restApiAuthService;

  PleromaApiConversationService({
    required this.restApiAuthService,
  }) : super(restService: restApiAuthService);

  @override
  Future<List<IPleromaApiStatus>> getConversationStatuses({
    required String? conversationRemoteId,
    IPleromaApiPaginationRequest? pagination,
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

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiStatus.fromJson,
    );
  }

  @override
  Future<IPleromaApiConversation> getConversation({
    required String conversationRemoteId,
  }) async {
    var request = RestRequest.get(
      relativePath: join(
        pleromaConversationRelativeUrlPath,
        conversationRemoteId,
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiConversation.fromJson,
    );
  }

  @override
  Future<List<IPleromaApiConversation>> getConversations({
    IPleromaApiPaginationRequest? pagination,
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
            key: 'recipients[]',
            value: id,
          ),
        ),
      );
    }

    var request = RestRequest.get(
      relativePath: join(conversationRelativeUrlPath),
      queryArgs: queryArgs,
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiConversation.fromJson,
    );
  }

  @override
  Future deleteConversation({
    required String conversationRemoteId,
  }) async {
    var request = RestRequest.delete(
      relativePath: join(
        conversationRelativeUrlPath,
        conversationRemoteId,
      ),
    );

    var httpResponse = await restService.sendHttpRequest(request);

    try {
      restService.processEmptyResponse(httpResponse);
    } catch (e) {
      if (e is PleromaApiRecordNotFoundRestException) {
        // nothing because already deleted on backend
        _logger.finest(() => 'already deleted');
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<IPleromaApiConversation> markConversationAsRead({
    required String conversationRemoteId,
  }) async {
    var request = RestRequest.post(
      relativePath: join(
        conversationRelativeUrlPath,
        conversationRemoteId,
        'read',
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiConversation.fromJson,
    );
  }
}
