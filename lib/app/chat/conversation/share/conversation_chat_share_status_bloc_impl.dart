import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/conversation/share/conversation_chat_share_bloc.dart';
import 'package:fedi/app/chat/conversation/share/conversation_chat_share_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/share/conversation_chat_share_bloc_proxy_provider.dart';
import 'package:fedi/app/share/status/share_status_bloc.dart';
import 'package:fedi/app/share/to_account/share_to_account_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/api/conversation/pleroma_conversation_service.dart';
import 'package:fedi/pleroma/api/status/auth/pleroma_auth_status_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ConversationChatShareStatusBloc extends ConversationChatShareBloc
    implements IConversationChatShareBloc, IShareStatusBloc {
  @override
  final IStatus? status;

  ConversationChatShareStatusBloc({
    required this.status,
    required IConversationChatRepository conversationRepository,
    required IStatusRepository statusRepository,
    required IPleromaConversationService pleromaConversationService,
    required IPleromaAuthStatusService pleromaAuthStatusService,
    required IMyAccountBloc myAccountBloc,
    required IAccountRepository accountRepository,
    required IPleromaAccountService pleromaAccountService,
  }) : super(
          conversationRepository: conversationRepository,
          statusRepository: statusRepository,
          pleromaConversationService: pleromaConversationService,
          pleromaAuthStatusService: pleromaAuthStatusService,
          accountRepository: accountRepository,
          myAccountBloc: myAccountBloc,
          pleromaAccountService: pleromaAccountService,
        );

  @override
  IPleromaPostStatus createSendData({
    required String to,
    required PleromaVisibility visibility,
  }) {
    var url = status!.url ?? "";
    var content = message == null ? url : "${message ?? ""} $url".trim();
    var messageSendData = PleromaPostStatus(
      status: "$content $to",
      visibility: visibility.toJsonValue(),
      contentType: null,
      expiresInSeconds: null,
      idempotencyKey: null,
      inReplyToConversationId: null,
      inReplyToId: null,
      language: null,
      mediaIds: null,
      poll: null,
      preview: null,
      sensitive: false,
      spoilerText: null,
      to: null,
    );
    return messageSendData;
  }

  static Widget provideToContext(
    BuildContext context, {
    required IStatus? status,
    required Widget child,
  }) {
    return DisposableProvider<ConversationChatShareStatusBloc>(
      create: (context) => createFromContext(context, status),
      child: ProxyProvider<ConversationChatShareStatusBloc,
          IConversationChatShareBloc>(
        update: (context, value, previous) => value,
        child: ProxyProvider<ConversationChatShareStatusBloc, IShareStatusBloc>(
          update: (context, value, previous) => value,
          child: ProxyProvider<ConversationChatShareStatusBloc,
              IShareToAccountBloc>(
            update: (context, value, previous) => value,
            child: ConversationChatShareBlocProxyProvider(
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  static ConversationChatShareStatusBloc createFromContext(
    BuildContext context,
    IStatus? status,
  ) =>
      ConversationChatShareStatusBloc(
        status: status,
        conversationRepository: IConversationChatRepository.of(
          context,
          listen: false,
        ),
        pleromaAuthStatusService: IPleromaAuthStatusService.of(
          context,
          listen: false,
        ),
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
}
