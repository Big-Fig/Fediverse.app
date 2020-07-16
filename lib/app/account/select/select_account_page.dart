import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/cached/account_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/account/select/select_account_list_bloc_impl.dart';
import 'package:fedi/app/account/select/select_account_pagination_list_bloc.dart';
import 'package:fedi/app/account/select/select_account_widget.dart';
import 'package:fedi/app/search/input/search_input_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectAccountPage extends StatelessWidget {
  final AccountCallback accountSelectedCallback;

  const SelectAccountPage({@required this.accountSelectedCallback});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediSubPageCustomAppBar(
          leading: FediBackIconButton(),
          child: SearchInputWidget(),
        ),
        body: SafeArea(
          child: SelectAccountWidget(
            accountSelectedCallback: accountSelectedCallback,
          ),
        ),
      );
}

void goToSelectAccountPage(BuildContext context,
    {@required AccountCallback accountSelectedCallback,
    @required bool excludeMyAccount}) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) {
      return SelectAccountListBloc.provideToContext(
        context,
        excludeMyAccount: excludeMyAccount,
        child: AccountCachedPaginationBloc.provideToContext(
          context,
          child: SelectAccountPaginationListBloc.provideToContext(
            context,
            child: SelectAccountPage(
                accountSelectedCallback: accountSelectedCallback),
          ),
        ),
      );
    }),
  );
}
