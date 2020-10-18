import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';

class AccountAcctWidget extends StatelessWidget {
  final TextStyle textStyle;

  const AccountAcctWidget({this.textStyle});

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);
    var textStyle = this.textStyle ?? IFediUiTextTheme.of(context).mediumShortDarkGrey;
    return StreamBuilder<String>(
        stream: accountBloc.acctStream,
        initialData: accountBloc.acct,
        builder: (context, snapshot) {
          var acct = snapshot.data;

          return Text(
            acct,
            overflow: TextOverflow.ellipsis,
            style: textStyle,
          );
        });
  }
}
