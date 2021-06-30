import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_model.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;

var _urlPath = path.Context(style: path.Style.url);
final _logger = Logger('pleroma_api_chat_service_impl.dart');

class PleromaApiChatService extends BasePleromaApiService
    with PleromaApiAuthMixinService
    implements IPleromaApiChatService {
  final v1ChatRelativeUrlPath = '/api/v1/pleroma/chats';
  final v2ChatRelativeUrlPath = '/api/v2/pleroma/chats';

  @override
  final IPleromaApiAuthRestService restApiAuthService;

  PleromaApiChatService({
    required this.restApiAuthService,
  }) : super(
          restService: restApiAuthService,
        );

  @override
  Future<List<IPleromaApiChat>> getChats({
    IPleromaApiPaginationRequest? pagination,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: v2ChatRelativeUrlPath,
        // todo: pagination not supported yet and API send error if pagination args exist
        // https://git.pleroma.social/pleroma/pleroma/-/issues/2140
        queryArgs: pagination?.toQueryArgs(),
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiChat.fromJson,
    );
  }

  @override
  Future<List<IPleromaApiChatMessage>> getChatMessages({
    required String? chatId,
    IPleromaApiPaginationRequest? pagination,
  }) async {
    assert(chatId?.isNotEmpty == true);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join(
          v1ChatRelativeUrlPath,
          chatId,
          'messages',
        ),
        queryArgs: [
          ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
        ],
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiChatMessage.fromJson,
    );
  }

  @override
  Future<IPleromaApiChat> markChatAsRead({
    required String chatId,
    required String lastReadChatMessageId,
  }) async {
    assert(chatId.isNotEmpty);
    assert(lastReadChatMessageId.isNotEmpty);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: _urlPath.join(
          v1ChatRelativeUrlPath,
          chatId,
          'read',
        ),
        bodyJson: {
          'last_read_id': lastReadChatMessageId,
        },
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiChat.fromJson,
    );
  }

  @override
  Future<IPleromaApiChat> getOrCreateChatByAccountId({
    required String accountId,
  }) async {
    assert(accountId.isNotEmpty);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: _urlPath.join(
          v1ChatRelativeUrlPath,
          'by-account-id',
          accountId,
        ),
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiChat.fromJson,
    );
  }

  @override
  Future<IPleromaApiChat> getChat({
    required String id,
  }) async {
    assert(id.isNotEmpty);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join(
          v1ChatRelativeUrlPath,
          id,
        ),
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiChat.fromJson,
    );
  }

  @override
  Future<IPleromaApiChatMessage> sendMessage({
    required String chatId,
    required IPleromaApiChatMessageSendData data,
  }) async {
    assert(chatId.isNotEmpty);
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: _urlPath.join(
          v1ChatRelativeUrlPath,
          chatId,
          'messages',
        ),
        headers: {
          if (data.idempotencyKey?.isNotEmpty == true)
            'Idempotency-Key': data.idempotencyKey!,
        },
        bodyJson: data.toJson(),
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiChatMessage.fromJson,
    );
  }

  @override
  Future deleteChatMessage({
    required String chatMessageRemoteId,
    required String chatId,
  }) async {
    assert(chatMessageRemoteId.isNotEmpty);
    assert(chatId.isNotEmpty);

    var httpResponse = await restService.sendHttpRequest(
      RestRequest.delete(
        relativePath: _urlPath.join(
          v1ChatRelativeUrlPath,
          chatId,
          'messages',
          chatMessageRemoteId,
        ),
      ),
    );

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
}
