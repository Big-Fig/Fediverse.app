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
    Logger('conversation_chat_status_list_context_api_bloc_impl.dart');

class ConversationChatStatusListContextApiBloc
    extends ConversationChatStatusListBloc {
  final IUnifediApiStatusService unifediApiStatusService;
  final IStatus? statusToFetchContext;

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  ConversationChatStatusListContextApiBloc({
    required this.unifediApiStatusService,
    required IConversationChat? conversation,
    required this.statusToFetchContext,
    required IStatusRepository statusRepository,
  }) : super(
          conversation: conversation,
          statusRepository: statusRepository,
        );

  @override
  IUnifediApiService get unifediApi => unifediApiStatusService;

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
    assert(newerThan == null, 'newerThan pagination not supported');

    if (olderThan != null) {
      // context dont support load more pagination
      return;
    }
    var remoteContext = await unifediApiStatusService.getStatusContext(
      statusId: statusToFetchContext!.remoteId!,
    );

    var remoteStatuses = <IUnifediApiStatus>[
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
        unifediApiStatusService:
            Provider.of<IUnifediApiStatusService>(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        statusToFetchContext: statusToFetchContext,
      );

  @override
  Stream<bool> get settingsChangedStream => const Stream.empty();

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
