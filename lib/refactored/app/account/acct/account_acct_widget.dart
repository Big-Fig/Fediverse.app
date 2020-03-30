import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:flutter/cupertino.dart';

class AccountAcctWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);
    return StreamBuilder<String>(
        stream: accountBloc.acctStream,
        initialData: accountBloc.acct,
        builder: (context, snapshot) {
          var acct = snapshot.data;

          if (acct == null) {
            return SizedBox.shrink();
          }

          return Text(acct);
        });
  }
}
