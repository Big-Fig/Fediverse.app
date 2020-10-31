import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/emoji/text/emoji_text_widget.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';

class AccountDisplayNameWidget extends StatelessWidget {
  final TextOverflow textOverflow;
  final TextStyle textStyle;
  final TextAlign textAlign;

  const AccountDisplayNameWidget({
    this.textOverflow = TextOverflow.ellipsis,
    this.textStyle,
    this.textAlign = TextAlign.start,
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
            emojiText: accountDisplayNameEmojiText,
            textStyle: textStyle,
            textOverflow: textOverflow,
            drawNewLines: false,
          );
        });
  }
}
