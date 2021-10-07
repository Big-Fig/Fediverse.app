import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/html/html_text_bloc.dart';
import 'package:fedi/app/html/html_text_bloc_impl.dart';
import 'package:fedi/app/html/html_text_model.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:provider/provider.dart';

class AccountNoteWidget extends StatelessWidget {
  final TextStyle textStyle;

  AccountNoteWidget({required this.textStyle});

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);

    var fediUiColorTheme = IFediUiColorTheme.of(context);
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Padding(
      padding: const EdgeInsets.only(
        bottom: FediSizes.smallPadding,
        left: FediSizes.bigPadding,
        // ignore: no-equal-arguments
        right: FediSizes.bigPadding,
      ),
      child: StreamProvider<EmojiText?>.value(
        value: accountBloc.noteEmojiTextStream,
        initialData: accountBloc.noteEmojiText,
        child: DisposableProxyProvider<EmojiText?, IHtmlTextBloc>(
          update: (context, noteEmojiText, previous) {
            var htmlTextInputData = HtmlTextInputData(
              input: noteEmojiText?.text,
              emojis: noteEmojiText?.emojis,
            );
            if (previous?.inputData == htmlTextInputData) {
              return previous!;
            }

            var htmlTextBloc = HtmlTextBloc(
              inputData: htmlTextInputData,
              settings: HtmlTextSettings(
                paragraphDisplay: Display.BLOCK,
                fontSize: textStyle.fontSize,
                color: textStyle.color,
                lineHeight: textStyle.height,
                fontWeight: textStyle.fontWeight,
                textAlign: TextAlign.center,
                linkColor: fediUiColorTheme.primary,
                textMaxLines: null,
                textScaleFactor: textScaleFactor,
                drawNewLines: true,
                textOverflow: null,
              ),
            );
            htmlTextBloc.linkClickedStream.listen(
              (url) {
                _onLinkClick(
                  url: url,
                  noteEmojiText: noteEmojiText!,
                  context: context,
                );
              },
            ).disposeWith(htmlTextBloc);

            return htmlTextBloc;
          },
          child: const HtmlTextWidget(),
        ),
      ),
    );
  }

  void _onLinkClick({
    required BuildContext context,
    required String url,
    required EmojiText noteEmojiText,
  }) {
    var accountBloc = IAccountBloc.of(context, listen: false);

    UrlHelper.handleUrlClickWithInstanceLocation(
      context: context,
      url: url,
      instanceLocationBloc: accountBloc,
    );
  }
}
