import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/status/list/cached/conversation_chat_status_list_bloc_impl.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/conversation/pleroma_api_conversation_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger =
    Logger("conversation_chat_status_list_conversation_api_bloc_impl.dart");

class ConversationChatStatusListConversationApiBloc
    extends ConversationChatStatusListBloc {
  final IPleromaApiConversationService pleromaConversationService;

  ConversationChatStatusListConversationApiBloc({
    required IConversationChat? conversation,
    required this.pleromaConversationService,
    required IStatusRepository statusRepository,
  }) : super(conversation: conversation, statusRepository: statusRepository);

  @override
  IPleromaApi get pleromaApi => pleromaConversationService;

  @override
  Future refreshItemsFromRemoteForPage({
    required int? limit,
    required IStatus? newerThan,
    required IStatus? olderThan,
  }) async {
    _logger.fine(() => "start refreshItemsFromRemoteForPage \n"
        "\t conversation = $conversation"
        "\t newerThan = $newerThan"
        "\t olderThan = $olderThan");

    var remoteStatuses =
        await pleromaConversationService.getConversationStatuses(
      conversationRemoteId: conversation!.remoteId,
      pagination: PleromaApiPaginationRequest(
        limit: limit,
        sinceId: newerThan?.remoteId,
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
        pleromaConversationService:
            IPleromaApiConversationService.of(context, listen: false),
        statusRepository: IStatusRepository.of(
          context,
          listen: false,
        ),
      );

  @override
  Stream get settingsChangedStream => Stream.empty();

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
