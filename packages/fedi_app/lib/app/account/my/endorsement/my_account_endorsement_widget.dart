import 'package:fedi_app/app/account/my/endorsement/account_list/my_account_endorsement_account_list_widget.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAccountEndorsementWidget extends StatelessWidget {
  const MyAccountEndorsementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Padding(
        padding: FediPadding.horizontalBigPadding,
        child: MyAccountEndorsementAccountListWidget(),
      );
}
