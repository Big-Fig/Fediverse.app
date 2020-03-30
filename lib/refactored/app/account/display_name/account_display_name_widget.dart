import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/emoji/emoji_text_model.dart';
import 'package:fedi/refactored/app/emoji/emoji_text_widget.dart';
import 'package:flutter/cupertino.dart';

class AccountDisplayNameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);
    return StreamBuilder<EmojiText>(
        stream: accountBloc.displayNameEmojiTextStream,
        initialData: accountBloc.displayNameEmojiText,
        builder: (context, snapshot) {
          var accountDisplayNameEmojiText = snapshot.data;

          if(accountDisplayNameEmojiText == null) {
            return SizedBox.shrink();
          }

          return EmojiTextWidget(emojiText: accountDisplayNameEmojiText);
        });
  }

}
