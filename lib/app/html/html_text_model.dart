import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/style.dart';

class HtmlTextResultData {
  final String? text;
  final bool isActuallyHaveHtmlInData;
  HtmlTextResultData({
    required this.text,
    required this.isActuallyHaveHtmlInData,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HtmlTextResultData &&
          runtimeType == other.runtimeType &&
          text == other.text &&
          isActuallyHaveHtmlInData == other.isActuallyHaveHtmlInData;
  @override
  int get hashCode => text.hashCode ^ isActuallyHaveHtmlInData.hashCode;
  @override
  String toString() {
    return 'HtmlTextResultData{text: $text,'
        ' isActuallyHaveHtmlInData: $isActuallyHaveHtmlInData}';
  }
}

class HtmlTextInputData {
  final String? input;

  final List<IPleromaApiEmoji>? emojis;

  bool get isHaveEmojis => emojis?.isNotEmpty == true;

  HtmlTextInputData({
    required this.input,
    required this.emojis,
  });

  @override
  String toString() {
    return 'HtmlTextInputData{input: $input, emojis: $emojis}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HtmlTextInputData &&
          runtimeType == other.runtimeType &&
          input == other.input &&
          emojis == other.emojis;
  @override
  int get hashCode => input.hashCode ^ emojis.hashCode;
}

class HtmlTextSettings {
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? lineHeight;
  final Color? color;
  final Color linkColor;
  final int? textMaxLines;
  final TextOverflow? textOverflow;
  final bool shrinkWrap;
  final bool drawNewLines;
  final TextAlign textAlign;
  final double customEmojiImageSize;
  final double imageSize;
  final Display paragraphDisplay;
  final double textScaleFactor;

  HtmlTextSettings({
    required this.fontSize,
    required this.lineHeight,
    required this.fontWeight,
    // ignore: no-magic-number
    this.customEmojiImageSize = 20.0,
    // ignore: no-magic-number
    this.imageSize = 20.0,
    required this.linkColor,
    required this.color,
    required this.textMaxLines,
    this.paragraphDisplay = Display.INLINE,
    required this.textOverflow,
    required this.textScaleFactor,
    this.shrinkWrap = false,
    required this.drawNewLines,
    this.textAlign = TextAlign.start,
  });

  @override
  String toString() {
    return 'HtmlTextSettings{fontSize: $fontSize, fontWeight: $fontWeight,'
        ' lineHeight: $lineHeight, color: $color, linkColor: $linkColor,'
        ' textMaxLines: $textMaxLines, textOverflow: $textOverflow,'
        ' shrinkWrap: $shrinkWrap, drawNewLines: $drawNewLines,'
        ' textAlign: $textAlign,'
        ' customEmojiImageSize: $customEmojiImageSize,'
        ' imageSize: $imageSize,'
        ' textScaleFactor: $textScaleFactor,'
        ' paragraphDisplay: $paragraphDisplay}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HtmlTextSettings &&
          runtimeType == other.runtimeType &&
          fontSize == other.fontSize &&
          fontWeight == other.fontWeight &&
          lineHeight == other.lineHeight &&
          color == other.color &&
          linkColor == other.linkColor &&
          textMaxLines == other.textMaxLines &&
          textOverflow == other.textOverflow &&
          shrinkWrap == other.shrinkWrap &&
          drawNewLines == other.drawNewLines &&
          textAlign == other.textAlign &&
          customEmojiImageSize == other.customEmojiImageSize &&
          imageSize == other.imageSize &&
          paragraphDisplay == other.paragraphDisplay &&
          textScaleFactor == other.textScaleFactor;
  @override
  int get hashCode =>
      fontSize.hashCode ^
      fontWeight.hashCode ^
      lineHeight.hashCode ^
      color.hashCode ^
      linkColor.hashCode ^
      textMaxLines.hashCode ^
      textOverflow.hashCode ^
      shrinkWrap.hashCode ^
      drawNewLines.hashCode ^
      textAlign.hashCode ^
      customEmojiImageSize.hashCode ^
      imageSize.hashCode ^
      paragraphDisplay.hashCode ^
      textScaleFactor.hashCode;
}
