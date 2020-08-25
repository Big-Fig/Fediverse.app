import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_bloc_impl.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/list/account_list_item_widget.dart';
import 'package:fedi/app/account/select/select_account_list_bloc_impl.dart';
import 'package:fedi/app/account/select/select_account_page.dart';
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
  final PleromaAccountListLoader customDefaultRemoteAccountListLoader;
  final AccountListLoader customDefaultLocalAccountListLoader;

  ShareSelectAccountWidget({
    @required this.customDefaultRemoteAccountListLoader,
    @required this.customDefaultLocalAccountListLoader,
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
                goToSelectAccountPage(
                  context,
                  accountSelectedCallback: (context, account) {
                    shareSelectAccountBloc.addAccountToShare(account);
                    Navigator.of(context).pop();
                  },
                  excludeMyAccount: true,
                  customDefaultLocalAccountListLoader:
                      customDefaultLocalAccountListLoader,
                  customDefaultRemoteAccountListLoader:
                      customDefaultRemoteAccountListLoader,
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
                                          .removeAccountToShare(account);
                                    },
                                  ),
                                ),
                                FediIconButton(
                                  icon: Icon(FediIcons.remove),
                                  color: FediColors.darkGrey,
                                  onPressed: () {
                                    shareSelectAccountBloc
                                        .removeAccountToShare(account);
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
