import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/account_bloc_impl.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/details/account_details_page.dart';
import 'package:fedi/refactored/app/account/list/account_list_item_widget.dart';
import 'package:fedi/refactored/app/conversation/conversation_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConversationAccountsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var conversationBloc = IConversationBloc.of(context, listen: false);

    return StreamBuilder<List<IAccount>>(
        stream: conversationBloc.accountsStream,
        initialData: conversationBloc.accounts,
        builder: (context, snapshot) {
          var items = snapshot.data;

          if (items == null) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => DisposableProvider<IAccountBloc>(
                  create: (context) => AccountBloc.createFromContext(context,
                      needWatchLocalRepositoryForUpdates: false,
                      account: items[index],
                      needRefreshFromNetworkOnInit: false),
                  child: AccountListItemWidget(
                    accountSelectedCallback: (IAccount account) {
                      goToAccountDetailsPage(context, account);
                    },
                  )));
        });
  }
}
