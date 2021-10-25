import 'package:fedi_app/app/account/my/suggestion/account_list/my_account_suggestion_account_list_widget.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAccountSuggestionWidget extends StatelessWidget {
  const MyAccountSuggestionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Padding(
        padding: FediPadding.horizontalBigPadding,
        child: MyAccountSuggestionAccountListWidget(),
      );
}
