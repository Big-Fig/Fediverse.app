import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/conversation/share/conversation_chat_share_bloc.dart';
import 'package:fedi/app/chat/conversation/share/conversation_chat_share_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/share/conversation_chat_share_bloc_proxy_provider.dart';
import 'package:fedi/app/share/media/share_media_bloc.dart';
import 'package:fedi/app/share/to_account/share_to_account_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ConversationChatShareMediaBloc extends ConversationChatShareBloc
    implements IConversationChatShareBloc, IShareMediaBloc {
  @override
  final IPleromaMediaAttachment mediaAttachment;

  ConversationChatShareMediaBloc({
    @required this.mediaAttachment,
    @required IConversationChatRepository conversationRepository,
    @required IStatusRepository statusRepository,
    @required IPleromaConversationService pleromaConversationService,
    @required IPleromaStatusService pleromaStatusService,
    @required IMyAccountBloc myAccountBloc,
    @required IAccountRepository accountRepository,
    @required IPleromaAccountService pleromaAccountService,
  }) : super(
          conversationRepository: conversationRepository,
          statusRepository: statusRepository,
          pleromaConversationService: pleromaConversationService,
          pleromaStatusService: pleromaStatusService,
          accountRepository: accountRepository,
          myAccountBloc: myAccountBloc,
          pleromaAccountService: pleromaAccountService,
        );

  @override
  IPleromaPostStatus createSendData({
    @required String to,
    @required PleromaVisibility visibility,
  }) {
    var messageSendData = PleromaPostStatus(
      status: "${mediaAttachment.url} ${message ?? ""} ${to ?? ""}"?.trim(),
      visibility: visibility.toJsonValue(),
    );
    return messageSendData;
  }

  static Widget provideToContext(BuildContext context,
      {@required IPleromaMediaAttachment mediaAttachment,
      @required Widget child}) {
    return DisposableProvider<ConversationChatShareMediaBloc>(
      create: (context) => createFromContext(context, mediaAttachment),
      child: ProxyProvider<ConversationChatShareMediaBloc, IConversationChatShareBloc>(
        update: (context, value, previous) => value,
        child: ProxyProvider<ConversationChatShareMediaBloc, IShareMediaBloc>(
          update: (context, value, previous) => value,
          child: ProxyProvider<ConversationChatShareMediaBloc, IShareToAccountBloc>(
            update: (context, value, previous) => value,
            child: ConversationChatShareBlocProxyProvider(
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  static ConversationChatShareMediaBloc createFromContext(
          BuildContext context, IPleromaMediaAttachment mediaAttachment) =>
      ConversationChatShareMediaBloc(
        mediaAttachment: mediaAttachment,
        conversationRepository: IConversationChatRepository.of(
          context,
          listen: false,
        ),
        pleromaStatusService: IPleromaStatusService.of(context, listen: false),
        pleromaConversationService:
            IPleromaConversationService.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        accountRepository: IAccountRepository.of(context, listen: false),
        myAccountBloc: IMyAccountBloc.of(context, listen: false),
        pleromaAccountService: IPleromaAccountService.of(
          context,
          listen: false,
        ),
      );

  @override
  bool get isPossibleToShare => shareSelectAccountBloc.isTargetAccountsNotEmpty;

  @override
  Stream<bool> get isPossibleToShareStream =>
      shareSelectAccountBloc.isTargetAccountsNotEmptyStream;
}
