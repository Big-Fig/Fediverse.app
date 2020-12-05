import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleSelectAccountWidget extends StatelessWidget {
  final AccountCallback accountSelectedCallback;
  final List<Widget> accountActions;
  final bool isNeedPreFetchRelationship;
  final EdgeInsets itemPadding;

  const SingleSelectAccountWidget({
    @required this.accountSelectedCallback,
    this.accountActions,
    this.isNeedPreFetchRelationship = false,
    this.itemPadding = FediPadding.allMediumPadding,
  });

  @override
  Widget build(BuildContext context) {
    return AccountPaginationListWidget(
      accountActions: accountActions,
      accountSelectedCallback: accountSelectedCallback,
      itemPadding: itemPadding,
      key: PageStorageKey("SingleSelectAccountWidget"),
      isNeedPreFetchRelationship: isNeedPreFetchRelationship,
    );
  }
}
