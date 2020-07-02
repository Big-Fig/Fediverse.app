import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/emoji/emoji_text_model.dart';
import 'package:fedi/app/emoji/emoji_text_widget.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountNoteWidget extends StatelessWidget {
  final Color color;


  const AccountNoteWidget({@required this.color});

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: false);
    return StreamBuilder<EmojiText>(
        stream: accountBloc.noteEmojiTextStream,
        initialData: accountBloc.noteEmojiText,
        builder: (context, snapshot) {

          var noteEmojiText = snapshot.data;

          if (noteEmojiText?.text?.isNotEmpty != true) {
            return SizedBox.shrink();
          }

          return EmojiTextWidget(
            textAlign: TextAlign.center,
            emojiText: noteEmojiText,
            textStyle: TextStyle(
              fontSize: 16.0,
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
            textOverflow: TextOverflow.visible,
          );
        });
  }

}
