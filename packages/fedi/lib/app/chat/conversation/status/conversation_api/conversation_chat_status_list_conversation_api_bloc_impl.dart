import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/status/list/cached/conversation_chat_status_list_bloc_impl.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger =
    Logger('conversation_chat_status_list_conversation_api_bloc_impl.dart');

class ConversationChatStatusListConversationApiBloc
    extends ConversationChatStatusListBloc {
  final IUnifediApiConversationService unifediConversationService;

  ConversationChatStatusListConversationApiBloc({
    required IConversationChat? conversation,
    required this.unifediConversationService,
    required IStatusRepository statusRepository,
  }) : super(conversation: conversation, statusRepository: statusRepository);

  @override
  IUnifediApiService get unifediApi => unifediConversationService;

  @override
  Future<void> refreshItemsFromRemoteForPage({
    required int? limit,
    required IStatus? newerThan,
    required IStatus? olderThan,
  }) async {
    _logger.fine(
      () => 'start refreshItemsFromRemoteForPage \n'
          '\t conversation = $conversation'
          '\t newerThan = $newerThan'
          '\t olderThan = $olderThan',
    );

    var remoteStatuses =
        await unifediConversationService.getConversationStatuses(
      conversationId: conversation!.remoteId,
      pagination: UnifediApiPagination(
        limit: limit,
        minId: newerThan?.remoteId,
        maxId: olderThan?.remoteId,
      ),
    );

    await statusRepository.upsertRemoteStatusesForConversation(
      remoteStatuses,
      conversationRemoteId: conversation!.remoteId,
      batchTransaction: null,
    );
  }

  static ConversationChatStatusListConversationApiBloc createFromContext(
    BuildContext context, {
    required IConversationChat? conversation,
  }) =>
      ConversationChatStatusListConversationApiBloc(
        conversation: conversation,
        unifediConversationService:
            Provider.of<IUnifediApiConversationService>(context, listen: false),
        statusRepository: IStatusRepository.of(
          context,
          listen: false,
        ),
      );

  @override
  Stream get settingsChangedStream => const Stream<dynamic>.empty();

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
