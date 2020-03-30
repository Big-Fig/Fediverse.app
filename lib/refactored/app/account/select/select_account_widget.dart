import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi/refactored/app/account/select/select_account_list_service.dart';
import 'package:fedi/refactored/app/search/input/search_input_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectAccountWidget extends StatelessWidget {
  final AccountSelectedCallback accountSelectedCallback;

  SelectAccountWidget({@required this.accountSelectedCallback});

  @override
  Widget build(BuildContext context) {
    var selectAccountListService =
        ISelectAccountListService.of(context, listen: true);

    return Column(
      children: <Widget>[
        Provider<ISearchInputBloc>.value(
            value: selectAccountListService.searchInputBloc),
        Expanded(
          child: AccountPaginationListWidget(
            accountSelectedCallback: accountSelectedCallback,
            key: PageStorageKey("SelectAccountWidget"),
          ),
        ),
      ],
    );
  }
}
