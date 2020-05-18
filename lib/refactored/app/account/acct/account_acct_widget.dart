import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';

class AccountAcctWidget extends StatelessWidget {
  final TextStyle textStyle;

  const AccountAcctWidget(
      {this.textStyle = const TextStyle(
        color: FediColors.darkGrey,
        fontSize: 14.0,
      )});

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);
    return StreamBuilder<String>(
        stream: accountBloc.acctStream,
        initialData: accountBloc.acct,
        builder: (context, snapshot) {
          var acct = snapshot.data;

          return Text(
            acct,
            style: textStyle,
          );
        });
  }
}
