import 'dart:async';

import 'package:fedi/app/html/html_text_bloc.dart';
import 'package:fedi/app/html/html_text_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/style.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:logging/logging.dart';

final _logger = Logger('html_text_bloc_impl.dart');

class HtmlTextBloc extends DisposableOwner implements IHtmlTextBloc {
  @override
  Stream<String> get linkClickedStream => linkClickedStreamController.stream;
  StreamController<String> linkClickedStreamController =
      StreamController.broadcast();

  @override
  final HtmlTextInputData inputData;

  @override
  final HtmlTextSettings settings;

  HtmlTextBloc({
    required this.inputData,
    required this.settings,
  })   : htmlData = _calculateHtmlData(
          inputData: inputData,
          settings: settings,
        ),
        htmlStyles = _calculateHtmlStyles(
          inputData: inputData,
          settings: settings,
        ) {
    addDisposable(streamController: linkClickedStreamController);
  }

  @override
  final Map<String, Style> htmlStyles;

  @override
  final HtmlTextResultData htmlData;

  @override
  void onLinkClicked({required String url}) {
    linkClickedStreamController.add(url);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HtmlTextBloc &&
          runtimeType == other.runtimeType &&
          inputData == other.inputData &&
          settings == other.settings;

  @override
  int get hashCode => inputData.hashCode ^ settings.hashCode;
}

final RegExp findHtmlFragmentsRegex = RegExp(r'</?\s*[a-z-][^>]*\s*>');
final HtmlUnescape _unescape = HtmlUnescape();

HtmlTextResultData _calculateHtmlData({
  required HtmlTextInputData inputData,
  required HtmlTextSettings settings,
}) {
  HtmlTextResultData resultData;
  var input = inputData.input;

  if (input != null) {
    var text = input.trim();

    var alreadyHaveHtmlInText = false;
    if (inputData.isHaveEmojis) {
      for (var i = 0; i < inputData.emojis!.length; i++) {
        var emoji = inputData.emojis![i];
        var shortcode = emoji.shortcode;
        var url = emoji.url;

        text = text.replaceAll(
          ':$shortcode:',
          '<img src="$url" '
              'width="${settings.customEmojiImageSize}"'
              'height="${settings.customEmojiImageSize}"'
              '>',
        );
        alreadyHaveHtmlInText = true;
      }
    }

    var hasHtmlMatch = findHtmlFragmentsRegex.hasMatch(text);
    var isActuallyHaveHtmlInData = alreadyHaveHtmlInText || hasHtmlMatch;

    if (settings.drawNewLines) {
      if (isActuallyHaveHtmlInData) {
        text = text.replaceAll('\n', '</br>');
      }
    } else {
      text = text.replaceAll('\n', '');
      text = text.replaceAll('<(/)*br>', '');
    }

    if (!isActuallyHaveHtmlInData) {
      text = _unescape.convert(text);
    }

    resultData = HtmlTextResultData(
      text: text,
      isActuallyHaveHtmlInData: isActuallyHaveHtmlInData,
    );
  } else {
    resultData = HtmlTextResultData(
      text: null,
      isActuallyHaveHtmlInData: false,
    );
  }

  _logger.finest(() => '_calculateHtmlData \n'
      'inputData $inputData \n'
      'resultData $resultData');

  return resultData;
}

Map<String, Style> _calculateHtmlStyles({
  required HtmlTextInputData inputData,
  required HtmlTextSettings settings,
}) {
  var fontSizeValue = settings.fontSize;

  var fontSizeObject = FontSize(fontSizeValue);

  return {
    'html': Style(
      display: settings.shrinkWrap ? Display.INLINE : Display.BLOCK,
      padding: EdgeInsets.zero,
      // ignore: no-equal-arguments
      margin: EdgeInsets.zero,
      // textOverflow: settings.textOverflow,
      // textMaxLines: settings.textMaxLines,
      fontSize: fontSizeObject,
      fontWeight: settings.fontWeight,
      color: settings.color,
      textAlign: settings.textAlign,
    ),
    'body': Style(
      display: settings.shrinkWrap ? Display.INLINE : Display.BLOCK,
      padding: EdgeInsets.zero,
      // ignore: no-equal-arguments
      margin: EdgeInsets.zero,
      // textOverflow: settings.textOverflow,
      // textMaxLines: settings.textMaxLines,
      textAlign: settings.textAlign,
    ),
    'img': Style(
      display: Display.INLINE,
      width: settings.imageSize,
      // ignore: no-equal-arguments
      height: settings.imageSize,
      padding: EdgeInsets.zero,
      // ignore: no-equal-arguments
      margin: EdgeInsets.zero,
      textAlign: settings.textAlign,
    ),
    'p': Style(
      padding: EdgeInsets.zero,
      // ignore: no-equal-arguments
      margin: EdgeInsets.zero,
      // lineHeight: settings.lineHeight,
      display: settings.paragraphDisplay,
      fontSize: fontSizeObject,
      fontWeight: settings.fontWeight,
      color: settings.color,
      textOverflow: settings.textOverflow,
      textMaxLines: settings.textMaxLines,
      textAlign: settings.textAlign,
    ),
    'a': Style(
      color: settings.linkColor,
    ),
    'text': Style(
      padding: EdgeInsets.zero,
      // ignore: no-equal-arguments
      margin: EdgeInsets.zero,
      // lineHeight: settings.lineHeight,
      display: Display.INLINE,
      fontSize: fontSizeObject,
      fontWeight: settings.fontWeight,
      color: settings.color,
      textOverflow: settings.textOverflow,
      textMaxLines: settings.textMaxLines,
      textAlign: settings.textAlign,
    ),
  };
}
