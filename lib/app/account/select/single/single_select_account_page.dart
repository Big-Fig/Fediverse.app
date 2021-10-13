import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/cached/account_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/account/select/select_account_list_bloc_impl.dart';
import 'package:fedi/app/account/select/select_account_pagination_list_bloc.dart';
import 'package:fedi/app/account/select/single/single_select_account_widget.dart';
import 'package:fedi/app/search/input/search_input_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleSelectAccountPage extends StatelessWidget {
  final AccountCallback accountSelectedCallback;
  final List<Widget>? accountActions;
  final bool isNeedPreFetchRelationship;

  const SingleSelectAccountPage({
    required this.accountSelectedCallback,
    this.accountActions,
    this.isNeedPreFetchRelationship = false,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediPageCustomAppBar(
          leading: const FediBackIconButton(),
          child: const SearchInputWidget(),
        ),
        body: SafeArea(
          child: SingleSelectAccountWidget(
            accountSelectedCallback: accountSelectedCallback,
            accountActions: accountActions,
            isNeedPreFetchRelationship: isNeedPreFetchRelationship,
          ),
        ),
      );
}

// todo: refactor long-parameter-list
// ignore: long-parameter-list
void goToSingleSelectAccountPage(
  BuildContext context, {
  required AccountCallback accountSelectedCallback,
  required bool excludeMyAccount,
  required bool followingsOnly,
  required UnifediApiAccountListLoader? customRemoteAccountListLoader,
  required AccountListLoader? customLocalAccountListLoader,
  List<Widget>? accountActions,
  bool isNeedPreFetchRelationship = false,
}) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (context) => SelectAccountListBloc.provideToContext(
        context,
        followingsOnly: followingsOnly,
        excludeMyAccount: excludeMyAccount,
        child: AccountCachedPaginationBloc.provideToContext(
          context,
          child: SelectAccountPaginationListBloc.provideToContext(
            context,
            child: SingleSelectAccountPage(
              accountSelectedCallback: accountSelectedCallback,
              accountActions: accountActions,
              isNeedPreFetchRelationship: isNeedPreFetchRelationship,
            ),
          ),
        ),
        customLocalAccountListLoader: customLocalAccountListLoader,
        customRemoteAccountListLoader: customRemoteAccountListLoader,
      ),
    ),
  );
}
