import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/emoji/text/emoji_text_widget.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/cupertino.dart';

class AccountDisplayNameAndAcctWidget extends StatelessWidget {
  final TextOverflow textOverflow;
  final TextStyle textStyle;
  final TextAlign textAlign;

  AccountDisplayNameAndAcctWidget({
    this.textOverflow = TextOverflow.ellipsis,
    this.textStyle = FediTextStyles.bigShortBoldDarkGrey,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: false);
    return StreamBuilder<EmojiText>(
        stream: accountBloc.displayNameEmojiTextStream,
        initialData: accountBloc.displayNameEmojiText,
        builder: (context, snapshot) {
          var accountDisplayNameEmojiText = snapshot.data;

          if (accountDisplayNameEmojiText == null) {
            return SizedBox.shrink();
          }

          return EmojiTextWidget(
            textAlign: textAlign,
            emojiText: EmojiText(
              text: "${accountDisplayNameEmojiText.text} (${accountBloc.acct})",
              emojis: accountDisplayNameEmojiText.emojis,
            ),
            textStyle: textStyle,
            textOverflow: textOverflow,
          );
        });
  }
}
