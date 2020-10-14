import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/cached/account_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/account/select/select_account_list_bloc_impl.dart';
import 'package:fedi/app/account/select/select_account_pagination_list_bloc.dart';
import 'package:fedi/app/account/select/single/single_select_account_widget.dart';
import 'package:fedi/app/search/input/search_input_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleSelectAccountPage extends StatelessWidget {
  final AccountCallback accountSelectedCallback;

  const SingleSelectAccountPage({@required this.accountSelectedCallback});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediSubPageCustomAppBar(
          leading: FediBackIconButton(),
          child: SearchInputWidget(),
        ),
        body: SafeArea(
          child: SingleSelectAccountWidget(
            accountSelectedCallback: accountSelectedCallback,
          ),
        ),
      );
}

void goToSingleSelectAccountPage(
  BuildContext context, {
  @required AccountCallback accountSelectedCallback,
  @required bool excludeMyAccount,
  @required bool followingsOnly,
  @required PleromaAccountListLoader customRemoteAccountListLoader,
  @required AccountListLoader customLocalAccountListLoader,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) {
      return SelectAccountListBloc.provideToContext(
        context,
        followingsOnly: followingsOnly,
        excludeMyAccount: excludeMyAccount,
        child: AccountCachedPaginationBloc.provideToContext(
          context,
          child: SelectAccountPaginationListBloc.provideToContext(
            context,
            child: SingleSelectAccountPage(
                accountSelectedCallback: accountSelectedCallback),
          ),
        ),
        customLocalAccountListLoader: customLocalAccountListLoader,
        customRemoteAccountListLoader: customRemoteAccountListLoader,
      );
    }),
  );
}
