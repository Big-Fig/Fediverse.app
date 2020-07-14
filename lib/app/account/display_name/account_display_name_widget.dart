import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/emoji/emoji_text_model.dart';
import 'package:fedi/app/emoji/emoji_text_widget.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/cupertino.dart';

class AccountDisplayNameWidget extends StatelessWidget {
  final TextOverflow textOverflow;
  final TextStyle textStyle;
  final TextAlign textAlign;

  AccountDisplayNameWidget({
    this.textOverflow = TextOverflow.ellipsis,
    this.textStyle = FediTextStyles.bigShortBoldDarkGrey,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);
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
            emojiText: accountDisplayNameEmojiText,
            textStyle: textStyle,
            textOverflow: textOverflow,
          );
        });
  }
}
