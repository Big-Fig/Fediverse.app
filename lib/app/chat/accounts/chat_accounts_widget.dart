import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/local_account_details_page.dart';
import 'package:fedi/app/account/list/account_list_item_widget.dart';
import 'package:fedi/app/account/local_account_bloc_impl.dart';
import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatAccountsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var chatBloc = IChatBloc.of(context);

    return StreamBuilder<List<IAccount>>(
      stream: chatBloc.accountsStream,
      builder: (context, snapshot) {
        var items = snapshot.data;

        if (items == null) {
          return const _ChatAccountsLoadingWidget();
        }

        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) => DisposableProvider<IAccountBloc>(
            create: (context) => LocalAccountBloc.createFromContext(
              context,
              isNeedWatchLocalRepositoryForUpdates: false,
              account: items[index],
              isNeedRefreshFromNetworkOnInit: false,
              isNeedWatchWebSocketsEvents: false,
              isNeedPreFetchRelationship: false,
            ),
            child: Column(
              children: [
                const AccountListItemWidget(
                  accountSelectedCallback: _accountSelectedCallback,
                ),
                const FediUltraLightGreyDivider(),
              ],
            ),
          ),
        );
      },
    );
  }

  const ChatAccountsWidget();
}

class _ChatAccountsLoadingWidget extends StatelessWidget {
  const _ChatAccountsLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: FediCircularProgressIndicator());
  }
}

void _accountSelectedCallback(BuildContext context, IAccount account) {
  goToLocalAccountDetailsPage(context, account: account);
}
