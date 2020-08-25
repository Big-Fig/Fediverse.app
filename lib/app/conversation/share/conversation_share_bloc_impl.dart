import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/app/conversation/repository/conversation_repository_model.dart';
import 'package:fedi/app/conversation/share/conversation_share_bloc.dart';
import 'package:fedi/app/share/message_input/share_message_input_bloc.dart';
import 'package:fedi/app/share/message_input/share_message_input_bloc_impl.dart';
import 'package:fedi/app/share/select/share_select_account_bloc.dart';
import 'package:fedi/app/share/select/share_select_account_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:moor_flutter/moor_flutter.dart';

abstract class ConversationShareBloc extends DisposableOwner
    implements IConversationShareBloc {
  final IConversationRepository conversationRepository;
  final IStatusRepository statusRepository;
  final IPleromaConversationService pleromaConversationService;
  final IPleromaStatusService pleromaStatusService;
  final IMyAccountBloc myAccountBloc;
  final IAccountRepository accountRepository;

  String get message {
    var message = shareMessageInputBloc.messageField.currentValue;

    if (message?.isNotEmpty != true) {
      message = null;
    }

    return message;
  }

  @override
  IShareMessageInputBloc shareMessageInputBloc = ShareMessageInputBloc();

  @override
  IShareSelectAccountBloc shareSelectAccountBloc = ShareSelectAccountBloc();

  ConversationShareBloc({
    @required this.conversationRepository,
    @required this.statusRepository,
    @required this.pleromaConversationService,
    @required this.pleromaStatusService,
    @required this.myAccountBloc,
    @required this.accountRepository,
  }) {
    addDisposable(disposable: shareMessageInputBloc);
    addDisposable(disposable: shareSelectAccountBloc);
  }

  @override
  Future share() async {
    final pleromaVisibility = PleromaVisibility.DIRECT;

    var accountsPleromaStatus = await pleromaStatusService.postStatus(
        data: createSendData(
      to: "${shareSelectAccountBloc.targetAccounts.map((account) => "@${account.acct}").join(", ")}",
      visibility: pleromaVisibility,
    ));

    await statusRepository.upsertRemoteStatus(accountsPleromaStatus,
        listRemoteId: null, conversationRemoteId: null);
  }

  IPleromaPostStatus createSendData({
    @required String to,
    @required PleromaVisibility visibility,
  });

  @override
  Future<List<IAccount>> customDefaultLocalAccountListLoader({
    @required int limit,
    @required IAccount newerThan,
    @required IAccount olderThan,
  }) async {
    // default exist only for first page
    if (newerThan != null || olderThan != null) {
      return [];
    }

    var conversations = await conversationRepository.getConversations(
      olderThan: null,
      newerThan: null,
      limit: limit,
      offset: null,
      orderingTermData: ConversationOrderingTermData(
          orderingMode: OrderingMode.desc,
          orderByType: ConversationOrderByType.remoteId),
    );

    var accounts = <IAccount>[];

    for (var conversation in conversations) {
      var conversationAccounts = await accountRepository
          .getConversationAccounts(conversation: conversation);

      accounts.addAll(
        conversationAccounts.where(
          (account) {
            var notOwn = account.remoteId != myAccountBloc.account.remoteId;
            var alreadyExist = accounts.firstWhere(
                    (accountsItem) => accountsItem.remoteId == account.remoteId,
                    orElse: () => null) !=
                null;
            return notOwn && !alreadyExist;
          },
        ),
      );
    }

    return accounts;
  }

  @override
  Future<List<IPleromaAccount>> customDefaultRemoteAccountListLoader({
    @required int limit,
    @required IAccount newerThan,
    @required IAccount olderThan,
  }) async {
    // default exist only for first page
    if (newerThan != null || olderThan != null) {
      return [];
    }
    var pleromaConversations =
        await pleromaConversationService.getConversations(limit: limit);

    await conversationRepository.upsertRemoteConversations
      (pleromaConversations);

    var pleromaAccounts = <IPleromaAccount>[];

    for (var pleromaConversation in pleromaConversations) {
      var pleromaConversationAccounts = pleromaConversation.accounts;
      pleromaAccounts.addAll(
        pleromaConversationAccounts.where(
          (pleromaAccount) {
            var notOwn = pleromaAccount.id != myAccountBloc.account.remoteId;
            var alreadyAdded = pleromaAccounts.firstWhere(
                    (pleromaAccountsItem) =>
                        pleromaAccountsItem.id == pleromaAccount.id,
                    orElse: () => null) !=
                null;
            return notOwn && !alreadyAdded;
          },
        ),
      );
    }

    return pleromaAccounts;
  }
}
