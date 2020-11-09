import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/html/html_text_bloc.dart';
import 'package:fedi/app/html/html_text_bloc_impl.dart';
import 'package:fedi/app/html/html_text_model.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

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
    var accountBloc = IAccountBloc.of(context);
    var textStyle =
        this.textStyle ?? IFediUiTextTheme.of(context).bigShortBoldDarkGrey;

    var fediUiColorTheme = IFediUiColorTheme.of(context);
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return StreamProvider.value(
      value: accountBloc.displayNameEmojiTextStream,
      child: DisposableProxyProvider<EmojiText, IHtmlTextBloc>(
        update: (context, emojiText, _) {
          String text;
          if (emojiText != null) {
            text = "${emojiText.text} (${accountBloc.acct})";
          }
          return HtmlTextBloc(
            inputData: HtmlTextInputData(
              input: text,
              emojis: emojiText?.emojis,
            ),
            settings: HtmlTextSettings(
              textOverflow: textOverflow,
              linkColor: fediUiColorTheme.primary,
              color: textStyle.color,
              textMaxLines: null,
              textScaleFactor: textScaleFactor,
              fontSize: textStyle.fontSize,
              lineHeight: null,
              fontWeight: textStyle.fontWeight,
              drawNewLines: false,
            ),
          );
        },
        child: const HtmlTextWidget(),
      ),
    );
  }
}
