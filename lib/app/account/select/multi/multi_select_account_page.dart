import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/cached/account_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/account/select/multi/multi_select_account_bloc.dart';
import 'package:fedi/app/account/select/multi/multi_select_account_bloc_impl.dart';
import 'package:fedi/app/account/select/multi/multi_select_account_widget.dart';
import 'package:fedi/app/account/select/select_account_list_bloc_impl.dart';
import 'package:fedi/app/account/select/select_account_pagination_list_bloc.dart';
import 'package:fedi/app/search/input/search_input_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MultiSelectAccountPage extends StatelessWidget {
  final AccountsListCallback accountsListSelectedCallback;

  const MultiSelectAccountPage({@required this.accountsListSelectedCallback});

  @override
  Widget build(BuildContext context) {
    var multiSelectAccountBloc =
        IMultiSelectAccountBloc.of(context, listen: false);
    return Scaffold(
      appBar: FediSubPageCustomAppBar(
        leading: FediBackIconButton(),
        child: SearchInputWidget(),
        actions: [
          StreamBuilder<bool>(
              stream: multiSelectAccountBloc.isSomethingSelectedStream,
              initialData: multiSelectAccountBloc.isSomethingSelected,
              builder: (context, snapshot) {
                var isSomethingSelected = snapshot.data;
                return FediIconButton(
                  icon: Icon(FediIcons.check),
                  onPressed: isSomethingSelected
                      ? () {
                          var selectedAccounts =
                              multiSelectAccountBloc.selectedAccounts;
                          accountsListSelectedCallback(
                              context, selectedAccounts);
                        }
                      : null,
                );
              })
        ],
      ),
      body: SafeArea(
        child: MultiSelectAccountWidget(),
      ),
    );
  }
}

void goToMultiSelectAccountPage(
  BuildContext context, {
  @required AccountsListCallback accountsListSelectedCallback,
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
        excludeMyAccount: excludeMyAccount,
        child: AccountCachedPaginationBloc.provideToContext(
          context,
          child: SelectAccountPaginationListBloc.provideToContext(
            context,
            child: MultiSelectAccountBloc.provideToContext(
              context,
              child: MultiSelectAccountPage(
                accountsListSelectedCallback: accountsListSelectedCallback,
              ),
            ),
          ),
        ),
        customLocalAccountListLoader: customLocalAccountListLoader,
        customRemoteAccountListLoader: customRemoteAccountListLoader,
        followingsOnly: followingsOnly,
      );
    }),
  );
}
