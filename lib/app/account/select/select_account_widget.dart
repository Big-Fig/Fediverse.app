import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi/app/search/input/search_input_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectAccountWidget extends StatelessWidget {
  final AccountCallback accountSelectedCallback;

  const SelectAccountWidget({@required this.accountSelectedCallback});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: FediPadding.allBigPadding,
          child: SearchInputWidget(),
        ),
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
