import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_bloc.dart';
import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_bloc_proxy_provider.dart';
import 'package:fedi/app/share/media/share_media_bloc.dart';
import 'package:fedi/app/share/to_account/share_to_account_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class PleromaChatShareMediaBloc extends PleromaChatShareBloc
    implements IPleromaChatShareBloc, IShareMediaBloc {
  @override
  final IPleromaMediaAttachment mediaAttachment;

  PleromaChatShareMediaBloc({
    @required this.mediaAttachment,
    @required IPleromaChatRepository chatRepository,
    @required IPleromaChatMessageRepository chatMessageRepository,
    @required IPleromaChatService pleromaChatService,
    @required IMyAccountBloc myAccountBloc,
    @required IAccountRepository accountRepository,
    @required IPleromaAccountService pleromaAccountService,
  }) : super(
          chatRepository: chatRepository,
          chatMessageRepository: chatMessageRepository,
          pleromaChatService: pleromaChatService,
          myAccountBloc: myAccountBloc,
          accountRepository: accountRepository,
          pleromaAccountService: pleromaAccountService,
        );



  @override
  PleromaChatMessageSendData createSendData() {
    var messageSendData = PleromaChatMessageSendData(
      content: "${mediaAttachment.url} ${message ?? ""}".trim(),
    );
    return messageSendData;
  }

  static Widget provideToContext(BuildContext context,
      {@required IPleromaMediaAttachment mediaAttachment,
      @required Widget child}) {
    return DisposableProvider<PleromaChatShareMediaBloc>(
      create: (context) => createFromContext(context, mediaAttachment),
      child: ProxyProvider<PleromaChatShareMediaBloc, IPleromaChatShareBloc>(
        update: (context, value, previous) => value,
        child: ProxyProvider<PleromaChatShareMediaBloc, IShareMediaBloc>(
          update: (context, value, previous) => value,
          child: ProxyProvider<PleromaChatShareMediaBloc, IShareToAccountBloc>(
            update: (context, value, previous) => value,
            child: PleromaChatShareBlocProxyProvider(child: child),
          ),
        ),
      ),
    );
  }

  static PleromaChatShareMediaBloc createFromContext(
          BuildContext context, IPleromaMediaAttachment mediaAttachment) =>
      PleromaChatShareMediaBloc(
        mediaAttachment: mediaAttachment,
        chatRepository: IPleromaChatRepository.of(
          context,
          listen: false,
        ),
        chatMessageRepository: IPleromaChatMessageRepository.of(
          context,
          listen: false,
        ),
        pleromaChatService: IPleromaChatService.of(
          context,
          listen: false,
        ),
        accountRepository: IAccountRepository.of(context, listen: false),
        pleromaAccountService: IPleromaAccountService.of(
          context,
          listen: false,
        ),
        myAccountBloc: IMyAccountBloc.of(
          context,
          listen: false,
        ),
      );


}
