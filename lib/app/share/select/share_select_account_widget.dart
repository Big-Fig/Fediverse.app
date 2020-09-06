import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_bloc_impl.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/list/account_list_item_widget.dart';
import 'package:fedi/app/account/select/multi/multi_select_account_page.dart';
import 'package:fedi/app/account/select/select_account_list_bloc_impl.dart';
import 'package:fedi/app/share/select/share_select_account_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/header/fedi_sub_header_text.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ShareSelectAccountWidget extends StatelessWidget {
  final PleromaAccountListLoader customRemoteAccountListLoader;
  final AccountListLoader customLocalAccountListLoader;

  ShareSelectAccountWidget({
    @required this.customRemoteAccountListLoader,
    @required this.customLocalAccountListLoader,
  });

  @override
  Widget build(BuildContext context) {
    var shareSelectAccountBloc =
        IShareSelectAccountBloc.of(context, listen: false);
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: FediPadding.horizontalSmallPadding,
              child: FediSubHeaderText("Accounts to share"),
            ),
            FediIconButton(
              icon: Icon(
                FediIcons.plus,
                color: FediColors.darkGrey,
              ),
              onPressed: () {
                goToMultiSelectAccountPage(
                  context,
                  accountsListSelectedCallback: (context, accounts) {
                    shareSelectAccountBloc.addAccountsToShare(accounts);
                    Navigator.of(context).pop();
                  },
                  excludeMyAccount: true,
                  customLocalAccountListLoader: customLocalAccountListLoader,
                  customRemoteAccountListLoader: customRemoteAccountListLoader,
                );
              },
            ),
          ],
        ),
        StreamBuilder<List<IAccount>>(
            stream: shareSelectAccountBloc.targetAccountsStream,
            initialData: shareSelectAccountBloc.targetAccounts,
            builder: (context, snapshot) {
              var accounts = snapshot.data;
              if (accounts?.isNotEmpty != true) {
                return Text("Nothing selected");
              }
              return Column(
                  children: accounts
                      .map(
                        (account) => Provider.value(
                          value: account,
                          child:
                              DisposableProxyProvider<IAccount, IAccountBloc>(
                            update: (context, value, previous) =>
                                AccountBloc.createFromContext(context,
                                    account: account,
                                    isNeedPreFetchRelationship: false,
                                    isNeedRefreshFromNetworkOnInit: false,
                                    isNeedWatchLocalRepositoryForUpdates: false,
                                    isNeedWatchWebSocketsEvents: false),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: AccountListItemWidget(
                                    accountSelectedCallback:
                                        (context, account) {
                                      shareSelectAccountBloc
                                          .removeAccountsToShare([account]);
                                    },
                                  ),
                                ),
                                FediIconButton(
                                  icon: Icon(FediIcons.remove),
                                  color: FediColors.darkGrey,
                                  onPressed: () {
                                    shareSelectAccountBloc
                                        .removeAccountsToShare([account]);
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList());
            })
      ],
    );
  }
}
