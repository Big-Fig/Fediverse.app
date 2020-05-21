import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/cached/account_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/app/account/select/select_account_list_bloc.dart';
import 'package:fedi/app/account/select/select_account_list_bloc_impl.dart';
import 'package:fedi/app/account/select/select_account_widget.dart';
import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/chat/chat_page.dart';
import 'package:fedi/app/chat/repository/chat_repository.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/dialog/alert/simple_alert_dialog.dart';
import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context).tr("app.chat.start.title"))),
      body: SafeArea(
        child: SelectAccountWidget(
          accountSelectedCallback: (account) async {
            var dialogResult = await doAsyncOperationWithDialog<IChat>(
                context: context,
                asyncCode: () async {
                  var chatRepository =
                      IChatRepository.of(context, listen: false);

                  var chat =
                      await chatRepository.findByAccount(account: account);

                  if (chat == null) {
                    var pleromaChatService =
                        IPleromaChatService.of(context, listen: false);

                    var remoteChat =
                        await pleromaChatService.getOrCreateChatByAccountId(
                            accountId: account.remoteId);

                    if (remoteChat != null) {
                      await chatRepository.upsertRemoteChat(remoteChat);
                      chat = await chatRepository.findByRemoteId(remoteChat.id);
                    }
                  }

                  return chat;
                });

            var chat = dialogResult.result;
            if (chat != null) {
              goToChatPage(context, chat: chat);
            } else {
              await SimpleAlertDialog(context: null).show(context);
            }
          },
        ),
      ),
    );
  }
}

void goToStartChatPage(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              DisposableProvider<ISelectAccountCachedListBloc>(
                create: (context) =>
                    SelectAccountCachedListBloc.createFromContext(context,
                        excludeMyAccount: true),
                child: Provider<IPleromaCachedListBloc<IAccount>>(
                  create: (context) =>
                      ISelectAccountCachedListBloc.of(context, listen: false),
                  child: Provider<ISearchInputBloc>(
                    create: (context) =>
                        ISelectAccountCachedListBloc.of(context, listen: false)
                            .searchInputBloc,
                    child: DisposableProvider<
                            IPaginationBloc<PaginationPage<IAccount>,
                                IAccount>>(
                        create: (context) =>
                            AccountCachedPaginationBloc.createFromContext(
                                context),
                        child: DisposableProvider<IAccountPaginationListBloc>(
                            create: (context) =>
                                AccountPaginationListBloc.createFromContext(
                                    context),
                            child: StartChatPage())),
                  ),
                ),
              )));
}
