import 'package:fedi/app/chat/message/repository/chat_message_repository.dart';
import 'package:fedi/app/chat/repository/chat_repository.dart';
import 'package:fedi/app/chat/share/chat_share_bloc.dart';
import 'package:fedi/app/chat/share/chat_share_bloc_impl.dart';
import 'package:fedi/app/chat/share/chat_share_bloc_proxy_provider.dart';
import 'package:fedi/app/share/status/share_status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:flutter/widgets.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:provider/provider.dart';

class ChatShareStatusBloc extends ChatShareBloc
    implements IChatShareBloc, IShareStatusBloc {
  @override
  final IStatus status;

  ChatShareStatusBloc({
    @required this.status,
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
    var link = status.url;
    var content = message == null ? link : "$message $link";
    var messageSendData = PleromaChatMessageSendData(
      content: content,
    );
    return messageSendData;
  }

  static Widget provideToContext(BuildContext context,
      {@required IStatus status, @required Widget child}) {
    return DisposableProvider<ChatShareStatusBloc>(
      create: (context) => createFromContext(context, status),
      child: ProxyProvider<ChatShareStatusBloc, IChatShareBloc>(
        update: (context, value, previous) => value,
        child: ProxyProvider<ChatShareStatusBloc, IShareStatusBloc>(
          update: (context, value, previous) => value,
          child: ChatShareBlocProxyProvider(child: child),
        ),
      ),
    );
  }

  static ChatShareStatusBloc createFromContext(
          BuildContext context, IStatus status) =>
      ChatShareStatusBloc(
          status: status,
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
  Stream<bool> get isPossibleToShareStream =>
      shareSelectAccountBloc.isTargetAccountsNotEmptyStream;
}
