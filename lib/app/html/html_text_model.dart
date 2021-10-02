import 'package:flutter/widgets.dart';
import 'package:flutter_html/style.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'html_text_model.freezed.dart';

@freezed
class HtmlTextResultData with _$HtmlTextResultData {
  const factory HtmlTextResultData({
    required String? text,
    required bool isActuallyHaveHtmlInData,
  }) = _HtmlTextResultData;
}

@freezed
class HtmlTextInputData with _$HtmlTextInputData {
  bool get isHaveEmojis => emojis?.isNotEmpty == true;

  const HtmlTextInputData._();

  const factory HtmlTextInputData({
    required String? input,
    required List<IUnifediApiEmoji>? emojis,
  }) = _HtmlTextInputData;
}

@freezed
class HtmlTextSettings with _$HtmlTextSettings {
  const factory HtmlTextSettings({
    required double? fontSize,
    required FontWeight? fontWeight,
    required double? lineHeight,
    required Color? color,
    required Color linkColor,
    required int? textMaxLines,
    required TextOverflow? textOverflow,
    @Default(false) bool shrinkWrap,
    required bool drawNewLines,
    @Default(TextAlign.start) TextAlign textAlign,
    // ignore: no-magic-number
    @Default(20.0) double customEmojiImageSize,
    // ignore: no-magic-number
    @Default(20.0) double imageSize,
    @Default(Display.INLINE) Display paragraphDisplay,
    required double textScaleFactor,
  }) = _HtmlTextSettings;
}
