import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/status/list/cached/conversation_chat_status_list_bloc_impl.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger =
    Logger('conversation_chat_status_list_context_api_bloc_impl.dart');

class ConversationChatStatusListContextApiBloc
    extends ConversationChatStatusListBloc {
  final IPleromaApiStatusService pleromaStatusService;
  final IStatus? statusToFetchContext;

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  ConversationChatStatusListContextApiBloc({
    required this.pleromaStatusService,
    required IConversationChat? conversation,
    required this.statusToFetchContext,
    required IStatusRepository statusRepository,
  }) : super(
          conversation: conversation,
          statusRepository: statusRepository,
        );

  @override
  IPleromaApi get pleromaApi => pleromaStatusService;

  @override
  Future refreshItemsFromRemoteForPage({
    required int? limit,
    required IStatus? newerThan,
    required IStatus? olderThan,
  }) async {
    _logger.fine(() => 'start refreshItemsFromRemoteForPage \n'
        '\t conversation = $conversation'
        '\t newerThan = $newerThan'
        '\t olderThan = $olderThan');
    // newer pagination not supported
    assert(newerThan == null);

    if (olderThan != null) {
      // context dont support load more pagination
      return false;
    }
    var remoteContext = await pleromaStatusService.getStatusContext(
      statusRemoteId: statusToFetchContext!.remoteId!,
    );

    var remoteStatuses = <IPleromaApiStatus>[
      ...remoteContext.descendants,
      ...remoteContext.ancestors,
    ];

    await statusRepository.upsertRemoteStatusesForConversation(
      remoteStatuses,
      conversationRemoteId: conversation!.remoteId,
      batchTransaction: null,
    );
  }

  static ConversationChatStatusListContextApiBloc createFromContext(
    BuildContext context, {
    required IConversationChat? conversation,
    required IStatus? statusToFetchContext,
  }) =>
      ConversationChatStatusListContextApiBloc(
        conversation: conversation,
        pleromaStatusService:
            IPleromaApiStatusService.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        statusToFetchContext: statusToFetchContext,
      );

  @override
  Stream<bool> get settingsChangedStream => Stream.empty();

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
