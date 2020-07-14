import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/emoji/emoji_text_helper.dart';
import 'package:fedi/app/emoji/emoji_text_model.dart';
import 'package:fedi/app/emoji/emoji_text_widget.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:html_unescape/html_unescape.dart';

class AccountNoteWidget extends StatelessWidget {
  final Color color;
  final HtmlUnescape _unescape = HtmlUnescape();

  AccountNoteWidget({@required this.color});

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

          var escapedText = noteEmojiText.text;
          var htmlContent = addEmojiToHtmlContent(
              _unescape.convert(escapedText), noteEmojiText.emojis,
              isNeedToddHtmlBodyWrapper: false);

          var textStyle = TextStyle(
            fontSize: 16.0,
            height: 1.5,
            color: color,
            fontWeight: FontWeight.w500,
          );

          return Padding(
            padding: const EdgeInsets.only(bottom: FediSizes.smallPadding),
            child: HtmlTextWidget(
              paragraphDisplay: Display.BLOCK,
              fontSize: textStyle.fontSize,
              color: textStyle.color,
              lineHeight: textStyle.height,
              fontWeight: textStyle.fontWeight,
              textAlign: TextAlign.center,
              data: htmlContent,
              onLinkTap: (String url) {
                UrlHelper.handleUrlClick(context, url);
              },
            ),
          );
        });
  }
}
