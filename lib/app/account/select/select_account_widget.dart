import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectAccountWidget extends StatelessWidget {
  final AccountSelectedCallback accountSelectedCallback;

  const SelectAccountWidget({@required this.accountSelectedCallback});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
