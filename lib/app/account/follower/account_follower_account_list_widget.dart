import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/local_account_details_page.dart';
import 'package:fedi/app/account/list/account_list_bloc.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/ui/empty/fedi_empty_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountFollowerAccountListWidget extends StatelessWidget {
  const AccountFollowerAccountListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var account = Provider.of<IAccount>(context);
    if (account.pleromaHideFollowers == true) {
      return const _AccountFollowerAccountListEmptyWidget();
    } else {
      return const _AccountFollowerAccountListBodyWidget();
    }
  }
}

class _AccountFollowerAccountListEmptyWidget extends StatelessWidget {
  const _AccountFollowerAccountListEmptyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FediEmptyWidget(
        title: S.of(context).app_account_info_value_hidden,
      ),
    );
  }
}

class _AccountFollowerAccountListBodyWidget extends StatelessWidget {
  const _AccountFollowerAccountListBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: FediPadding.allBigPadding,
          child: Text(
            S.of(context).app_account_list_privacy,
            textAlign: TextAlign.center,
            style: IFediUiTextTheme.of(context).mediumShortBoldGrey,
          ),
        ),
        const Expanded(
          child: AccountPaginationListWidget(
            accountSelectedCallback: _goToAccountDetailsPage,
            key: PageStorageKey("AccountFollowerAccountListPage"),
          ),
        ),
      ],
    );
  }
}

void _goToAccountDetailsPage(BuildContext context, IAccount account) {
  var accountListBloc = IAccountListBloc.of(context, listen: false);
  var instanceLocation = accountListBloc.instanceLocation;
  var isLocal = instanceLocation == InstanceLocation.local;
  if (isLocal) {
    goToLocalAccountDetailsPage(
      context,
      account: account,
    );
  } else {
    throw UnsupportedError(
      "Account following list supported only for local accounts",
    );
  }
}
