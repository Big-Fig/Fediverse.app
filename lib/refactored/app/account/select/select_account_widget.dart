import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/refactored/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi/refactored/app/account/select/select_account_list_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectAccountWidget extends StatelessWidget {
  final AccountSelectedCallback accountSelectedCallback;

  SelectAccountWidget({@required this.accountSelectedCallback});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildSearch(context),
        Expanded(
          child: AccountPaginationListWidget(
            accountSelectedCallback: accountSelectedCallback,
            key: PageStorageKey("SelectAccountWidget"),
          ),
        ),
      ],
    );
  }

  Widget buildSearch(BuildContext context) {
    var selectAccountListService =
        ISelectAccountListService.of(context, listen: true);

    return TextField(
      autocorrect: false,
      controller: selectAccountListService.searchTextEditingController,
      onChanged: (newValue) {
        var accountPaginationListBloc =
            IAccountPaginationListBloc.of(context, listen: false);
        accountPaginationListBloc.refreshController.requestRefresh();
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.blue.withAlpha(150),
        // TODO: localization
        hintText: 'Search',
        border: InputBorder.none,
        helperStyle: TextStyle(color: Colors.white),
        suffixIcon: IconButton(
          onPressed: () {
            selectAccountListService.clearSearch();
          },
          icon: Icon(Icons.clear),
        ),
      ),
    );
  }
}
