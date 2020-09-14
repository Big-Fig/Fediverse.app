import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/cupertino.dart';

class AccountAcctWidget extends StatelessWidget {
  final TextStyle textStyle;
  final bool displayBotIconIfNecessary;

  const AccountAcctWidget({
    this.textStyle = FediTextStyles.mediumShortDarkGrey,
    this.displayBotIconIfNecessary = true,
  });

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);
    return StreamBuilder<String>(
        stream: accountBloc.acctStream,
        initialData: accountBloc.acct,
        builder: (context, snapshot) {
          var acct = snapshot.data;
          String text;
          if (displayBotIconIfNecessary && accountBloc.isBot == true) {
            text = "🤖 $acct";
          } else {
            text = acct;
          }

          return Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: textStyle,
          );
        });
  }
}
