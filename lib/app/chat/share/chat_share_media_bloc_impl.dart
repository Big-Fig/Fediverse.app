import 'package:fedi/app/chat/message/repository/chat_message_repository.dart';
import 'package:fedi/app/chat/repository/chat_repository.dart';
import 'package:fedi/app/chat/share/chat_share_bloc.dart';
import 'package:fedi/app/chat/share/chat_share_bloc_impl.dart';
import 'package:fedi/app/chat/share/chat_share_bloc_proxy_provider.dart';
import 'package:fedi/app/share/media/share_media_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ChatShareMediaBloc extends ChatShareBloc
    implements IChatShareBloc, IShareMediaBloc {
  @override
  final IPleromaMediaAttachment mediaAttachment;

  ChatShareMediaBloc({
    @required this.mediaAttachment,
    @required IChatRepository chatRepository,
    @required IChatMessageRepository chatMessageRepository,
    @required IPleromaChatService pleromaChatService,
  }) : super(
          chatRepository: chatRepository,
          chatMessageRepository: chatMessageRepository,
          pleromaChatService: pleromaChatService,
        );

  @override
  PleromaChatMessageSendData createSendData() {
    var messageSendData = PleromaChatMessageSendData(
      content: "${mediaAttachment.url} $message".trim(),
    );
    return messageSendData;
  }

  static Widget provideToContext(BuildContext context,
      {@required IPleromaMediaAttachment mediaAttachment,
      @required Widget child}) {
    return DisposableProvider<ChatShareMediaBloc>(
      create: (context) => createFromContext(context, mediaAttachment),
      child: ProxyProvider<ChatShareMediaBloc, IChatShareBloc>(
        update: (context, value, previous) => value,
        child: ProxyProvider<ChatShareMediaBloc, IShareMediaBloc>(
          update: (context, value, previous) => value,
          child: ChatShareBlocProxyProvider(child: child),
        ),
      ),
    );
  }

  static ChatShareMediaBloc createFromContext(
          BuildContext context, IPleromaMediaAttachment mediaAttachment) =>
      ChatShareMediaBloc(
          mediaAttachment: mediaAttachment,
          chatRepository: IChatRepository.of(
            context,
            listen: false,
          ),
          chatMessageRepository: IChatMessageRepository.of(
            context,
            listen: false,
          ),
          pleromaChatService: IPleromaChatService.of(
            context,
            listen: false,
          ));

  @override
  bool get isPossibleToShare => shareSelectAccountBloc.isTargetAccountsNotEmpty;

  @override
  Stream<bool> get isPossibleToShareStream => shareSelectAccountBloc
      .isTargetAccountsNotEmptyStream;
}
