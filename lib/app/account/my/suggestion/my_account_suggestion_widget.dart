import 'package:fedi/app/account/my/suggestion/account_list/my_account_suggestion_account_list_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAccountSuggestionWidget extends StatelessWidget {
  const MyAccountSuggestionWidget();

  @override
  Widget build(BuildContext context) => const Padding(
        padding: FediPadding.horizontalBigPadding,
        child: MyAccountSuggestionAccountListWidget(),
      );
}
