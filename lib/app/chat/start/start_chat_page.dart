import 'package:fedi/app/account/pagination/cached/account_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/account/select/select_account_list_bloc_impl.dart';
import 'package:fedi/app/account/select/select_account_pagination_list_bloc.dart';
import 'package:fedi/app/account/select/single/single_select_account_widget.dart';
import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/chat/chat_page.dart';
import 'package:fedi/app/chat/repository/chat_repository.dart';
import 'package:fedi/app/search/input/search_input_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_simple_alert_dialog.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_custom_app_bar.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageCustomAppBar(
        leading: FediBackIconButton(),
        child: SearchInputWidget(
          autofocus: true,
        ),
      ),
      body: SafeArea(
        child: SingleSelectAccountWidget(
          accountSelectedCallback: (context, account) async {
            var dialogResult = await PleromaAsyncOperationHelper
                .performPleromaAsyncOperation<IChat>(
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
                          chat = await chatRepository
                              .findByRemoteId(remoteChat.id);
                        }
                      }

                      return chat;
                    });

            var chat = dialogResult.result;
            if (chat != null) {
              goToChatPage(context, chat: chat);
            } else {
              await FediSimpleAlertDialog(context: null).show(context);
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
      builder: (context) {
        return SelectAccountListBloc.provideToContext(
          context,
          excludeMyAccount: true,
          child: AccountCachedPaginationBloc.provideToContext(
            context,
            child: SelectAccountPaginationListBloc.provideToContext(context,
                child: StartChatPage()),
          ),
          customLocalAccountListLoader: null,
          customRemoteAccountListLoader: null,
        );
      },
    ),
  );
}
