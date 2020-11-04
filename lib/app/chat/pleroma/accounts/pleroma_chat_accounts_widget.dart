import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_bloc_impl.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/account/list/account_list_item_widget.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_bloc.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PleromaChatAccountsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var chatBloc = IPleromaChatBloc.of(context, listen: false);

    return StreamBuilder<List<IAccount>>(
        stream: chatBloc.accountsStream,
        builder: (context, snapshot) {
          var items = snapshot.data;

          if (items == null) {
            return const Center(child: FediCircularProgressIndicator());
          }

          return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => DisposableProvider<IAccountBloc>(
                  create: (context) => AccountBloc.createFromContext(context,
                      isNeedWatchLocalRepositoryForUpdates: false,
                      account: items[index],
                      isNeedRefreshFromNetworkOnInit: false,
                      isNeedWatchWebSocketsEvents: false,
                      isNeedPreFetchRelationship: false),
                  child: Column(
                    children: [
                      const AccountListItemWidget(
                        accountSelectedCallback: _accountSelectedCallback,
                      ),
                      const FediUltraLightGreyDivider()
                    ],
                  )));
        });
  }

  const PleromaChatAccountsWidget();
}

void _accountSelectedCallback(BuildContext context, IAccount account) {
  goToAccountDetailsPage(context, account);
}
