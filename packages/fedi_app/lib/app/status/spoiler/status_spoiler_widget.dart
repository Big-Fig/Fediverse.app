import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/emoji/text/emoji_text_model.dart';
import 'package:fedi_app/app/html/html_text_bloc.dart';
import 'package:fedi_app/app/html/html_text_bloc_impl.dart';
import 'package:fedi_app/app/html/html_text_model.dart';
import 'package:fedi_app/app/html/html_text_widget.dart';
import 'package:fedi_app/app/status/body/status_body_link_helper.dart';
import 'package:fedi_app/app/status/status_bloc.dart';
import 'package:fedi_app/app/ui/settings/font_size/ui_settings_font_size_model.dart';
import 'package:fedi_app/app/ui/settings/ui_settings_bloc.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusSpoilerWidget extends StatelessWidget {
  const StatusSpoilerWidget({Key? key}) : super(key: key);

  @override
  // todo: refactor
  // ignore: long-method, code-metrics
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);

    var fediUiColorTheme = IFediUiColorTheme.of(context);
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    var uiSettingsBloc = IUiSettingsBloc.of(context);
    var fediUiTextTheme = IFediUiTextTheme.of(context);

    return StreamBuilder<EmojiText?>(
      stream: statusBloc.spoilerTextWithEmojisStream,
      builder: (context, snapshot) {
        var spoilerEmojiText = snapshot.data;
        if (spoilerEmojiText?.text.isNotEmpty != true) {
          return const SizedBox.shrink();
        }

        return Provider<EmojiText?>.value(
          value: spoilerEmojiText,
          child: StreamBuilder<UiSettingsFontSize?>(
            stream: uiSettingsBloc.statusFontSizeStream,
            builder: (context, snapshot) {
              var statusFontSize = snapshot.data;

              if (statusFontSize == null) {
                return const SizedBox.shrink();
              }

              var textStyle = _mapToTextStyle(fediUiTextTheme, statusFontSize);

              return DisposableProxyProvider<EmojiText?, IHtmlTextBloc>(
                update: (context, spoilerWithEmojis, previous) {
                  var htmlTextInputData = HtmlTextInputData(
                    input: spoilerWithEmojis?.text ?? '',
                    emojis: spoilerWithEmojis?.emojis,
                  );
                  if (previous?.inputData == htmlTextInputData) {
                    return previous!;
                  }

                  var htmlTextBloc = HtmlTextBloc(
                    inputData: htmlTextInputData,
                    settings: HtmlTextSettings(
                      color: textStyle.color,
                      lineHeight: textStyle.height,
                      fontSize: textStyle.fontSize,
                      // todo: 1000 is hack, actually it should be null, but dont
                      //  work as expected
                      // ignore: no-magic-number
                      textMaxLines: 1000,
                      textOverflow: TextOverflow.ellipsis,
                      linkColor: fediUiColorTheme.primary,
                      textScaleFactor: textScaleFactor,
                      fontWeight: FontWeight.normal,
                      drawNewLines: false,
                    ),
                  );
                  htmlTextBloc.linkClickedStream.listen(
                    (url) {
                      _handleLinkTap(context, url);
                    },
                  ).disposeWith(htmlTextBloc);

                  return htmlTextBloc;
                },
                child: const HtmlTextWidget(),
              );
            },
          ),
        );
      },
    );
  }

  TextStyle _mapToTextStyle(
    IFediUiTextTheme fediUiTextTheme,
    UiSettingsFontSize statusFontSize,
  ) {
    var textStyle = fediUiTextTheme.bigTallDarkGrey;

    switch (statusFontSize) {
      case UiSettingsFontSize.smallest:
        textStyle = fediUiTextTheme.smallTallDarkGrey;
        break;
      case UiSettingsFontSize.small:
        textStyle = fediUiTextTheme.mediumTallDarkGrey;
        break;
      case UiSettingsFontSize.medium:
        textStyle = fediUiTextTheme.bigTallDarkGrey;
        break;
      case UiSettingsFontSize.large:
        textStyle = fediUiTextTheme.subHeaderTallDarkGrey;
        break;
      case UiSettingsFontSize.largest:
        textStyle = fediUiTextTheme.headerDarkGrey;
        break;
    }

    return textStyle;
  }
}

Future<void> _handleLinkTap(BuildContext context, String url) async {
  await handleStatusBodyLinkClick(
    statusBloc: IStatusBloc.of(
      context,
      listen: false,
    ),
    url: url,
    context: context,
  );
}
