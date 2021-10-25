import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/pagination/cached/account_cached_pagination_bloc_impl.dart';
import 'package:fedi_app/app/account/select/select_account_list_bloc_impl.dart';
import 'package:fedi_app/app/account/select/select_account_pagination_list_bloc.dart';
import 'package:fedi_app/app/account/select/single/single_select_account_widget.dart';
import 'package:fedi_app/app/chat/unifedi/unifedi_chat_helper.dart';
import 'package:fedi_app/app/search/input/search_input_widget.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi_app/app/ui/page/app_bar/fedi_page_custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnifediChatStartPage extends StatelessWidget {
  const UnifediChatStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: FediPageCustomAppBar(
          leading: FediBackIconButton(),
          child: SearchInputWidget(
            autofocus: true,
          ),
        ),
        body: SafeArea(
          child: SingleSelectAccountWidget(
            accountSelectedCallback: _accountSelectedCallback,
          ),
        ),
      );
}

Future<void> _accountSelectedCallback(
  BuildContext context,
  IAccount account,
) async {
  await goToUnifediChatWithAccount(
    context: context,
    account: account,
  );
}

void goToUnifediChatStartPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (context) => SelectAccountListBloc.provideToContext(
        context,
        excludeMyAccount: true,
        child: AccountCachedPaginationBloc.provideToContext(
          context,
          child: SelectAccountPaginationListBloc.provideToContext(
            context,
            child: const UnifediChatStartPage(),
          ),
        ),
        customLocalAccountListLoader: null,
        customRemoteAccountListLoader: null,
        followingsOnly: false,
      ),
    ),
  );
}
