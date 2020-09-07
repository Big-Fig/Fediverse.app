import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi/app/account/select/single/single_select_account_page.dart';
import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/custom_list/accounts/custom_list_account_network_only_list_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CustomListAccountListWidget extends StatelessWidget {
  CustomListAccountListWidget();

  @override
  Widget build(BuildContext context) {
    var customListAccountNetworkOnlyListBloc =
        ICustomListAccountNetworkOnlyListBloc.of(context, listen: false);
    var paginationListBloc = IPaginationListBloc.of(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: FediPadding.horizontalBigPadding,
          child: Text(
            "app.custom_list.accounts.label".tr(),
          ),
        ),
        Expanded(
          child: AccountPaginationListWidget(
            accountActions: <Widget>[
              Builder(
                builder: (context) => FediIconButton(
                  icon: Icon(FediIcons.remove),
                  onPressed: () async {
                    var account = Provider.of<IAccount>(context, listen: false);
                    await PleromaAsyncOperationHelper
                        .performPleromaAsyncOperation(
                            context: context,
                            asyncCode: () async {
                              await customListAccountNetworkOnlyListBloc
                                  .removeAccounts([account]);
                            });

                    paginationListBloc.refreshWithController();
                  },
                ),
              )
            ],
            alwaysShowFooter: true,
            footer: Padding(
              padding: FediPadding.allSmallPadding,
              child: FediPrimaryFilledTextButton(
                "app.custom_list.accounts.action.add".tr(),
                expanded: false,
                onPressed: () {
                  goToSingleSelectAccountPage(
                    context,
                    accountSelectedCallback: (context, account) async {
                      await PleromaAsyncOperationHelper
                          .performPleromaAsyncOperation(
                              context: context,
                              asyncCode: () async {
                                await customListAccountNetworkOnlyListBloc
                                    .addAccounts([account]);
                              });

                      paginationListBloc.refreshWithController();
                      Navigator.of(context).pop();
                    },
                    excludeMyAccount: true,
                    customRemoteAccountListLoader: null,
                    customLocalAccountListLoader: null,
                    followingsOnly: true,
                  );
                },
              ),
            ),
            accountSelectedCallback: (context, account) =>
                goToAccountDetailsPage(context, account),
            key: PageStorageKey("AccountFollowerAccountListPage"),
          ),
        ),
      ],
    );
  }
}
