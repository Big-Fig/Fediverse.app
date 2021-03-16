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

class AccountDisplayNameWidget extends StatelessWidget {
  final TextOverflow textOverflow;
  final TextStyle? textStyle;
  final TextAlign textAlign;

  const AccountDisplayNameWidget({
    this.textOverflow = TextOverflow.ellipsis,
    this.textStyle,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    var fediUiTextTheme = IFediUiTextTheme.of(context);
    var textStyle =
        this.textStyle ?? fediUiTextTheme.bigShortBoldDarkGrey;

    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return StreamProvider<EmojiText?>.value(
      value: accountBloc.displayNameEmojiTextStream,
      initialData: accountBloc.displayNameEmojiText,
      child: DisposableProxyProvider<EmojiText?, IHtmlTextBloc>(
        update: (context, emojiText, _) {
          var input = emojiText?.text;

          if(input?.isNotEmpty != true) {
            input = accountBloc.acct;
          }
          return HtmlTextBloc(
            inputData: HtmlTextInputData(
              input: input,
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
