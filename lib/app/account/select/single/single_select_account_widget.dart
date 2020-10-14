import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleSelectAccountWidget extends StatelessWidget {
  final AccountCallback accountSelectedCallback;

  const SingleSelectAccountWidget({@required this.accountSelectedCallback});

  @override
  Widget build(BuildContext context) {
    return AccountPaginationListWidget(
      accountSelectedCallback: accountSelectedCallback,
      key: PageStorageKey("SingleSelectAccountWidget"),
    );
  }
}
