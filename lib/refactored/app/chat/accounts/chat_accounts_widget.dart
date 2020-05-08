import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/account_bloc_impl.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/details/account_details_page.dart';
import 'package:fedi/refactored/app/account/list/account_list_item_widget.dart';
import 'package:fedi/refactored/app/chat/chat_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatAccountsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var chatBloc = IChatBloc.of(context, listen: false);

    return StreamBuilder<List<IAccount>>(
        stream: chatBloc.accountsStream,
        initialData: chatBloc.accounts,
        builder: (context, snapshot) {
          var items = snapshot.data;

          if (items == null) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => DisposableProvider<IAccountBloc>(
                  create: (context) => AccountBloc.createFromContext(context,
                      isNeedWatchLocalRepositoryForUpdates: false,
                      account: items[index],
                      isNeedRefreshFromNetworkOnInit: false,
                      isNeedWatchWebSocketsEvents: false),
                  child: AccountListItemWidget(
                    accountSelectedCallback: (IAccount account) {
                      goToAccountDetailsPage(context, account);
                    },
                  )));
        });
  }
}
