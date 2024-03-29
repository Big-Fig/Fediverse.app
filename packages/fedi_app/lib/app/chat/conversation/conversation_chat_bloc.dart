import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/chat/chat_bloc.dart';
import 'package:fedi_app/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi_app/app/chat/conversation/message/conversation_chat_message_model.dart';
import 'package:fedi_app/app/status/post/post_status_model.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationChatBloc
    implements IChatBloc, IAsyncInitLoadingBloc {
  static IConversationChatBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IConversationChatBloc>(context, listen: listen);

  List<IAccount> get accountsWithoutMe;

  Stream<List<IAccount>> get accountsWithoutMeStream;

  @override
  IConversationChat get chat;

  @override
  Stream<IConversationChat> get chatStream;

  @override
  IConversationChatMessage? get lastChatMessage;

  @override
  IConversationChatMessage? get lastPublishedChatMessage;

  @override
  Stream<IConversationChatMessage?> get lastChatMessageStream;

  Stream<IConversationChatMessage> get onMessageLocallyHiddenStream;

  Future<void> postMessage({
    required IPostStatusData postStatusData,
    required IConversationChatMessage? oldPendingFailedConversationChatMessage,
  });

  Future<void> deleteMessage({
    required IConversationChatMessage conversationChatMessage,
  });
}

extension IConversationChatBlocExtension on IConversationChatBloc {
  IConversationChat get conversation => chat;

  Stream<IConversationChat> get conversationStream => chatStream;

  IStatus? get lastStatus => lastChatMessage?.status;

  Stream<IStatus?> get lastStatusStream => lastChatMessageStream.map(
        (lastChatMessage) => lastChatMessage?.status,
      );
}
