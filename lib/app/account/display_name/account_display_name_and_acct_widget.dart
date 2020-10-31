import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/emoji/text/emoji_text_widget.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';

class AccountDisplayNameAndAcctWidget extends StatelessWidget {
  final TextOverflow textOverflow;
  final TextStyle textStyle;
  final TextAlign textAlign;

  const AccountDisplayNameAndAcctWidget({
    this.textOverflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.start,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: false);
    var textStyle =
        this.textStyle ?? IFediUiTextTheme.of(context).bigShortBoldDarkGrey;
    return StreamBuilder<EmojiText>(
        stream: accountBloc.displayNameEmojiTextStream,
        builder: (context, snapshot) {
          var accountDisplayNameEmojiText = snapshot.data;

          if (accountDisplayNameEmojiText == null) {
            return const SizedBox.shrink();
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
