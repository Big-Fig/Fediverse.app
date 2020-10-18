import 'package:fedi/app/html/html_text_model.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("html_text_widget.dart");

typedef HtmlTextOnLinkClick<T> = Function(
  BuildContext context,
  HtmlTextData<T> htmlTextData,
  String url,
);

class HtmlTextWidget<T> extends StatelessWidget {
  final HtmlTextOnLinkClick<T> onLinkTap;
  final double fontSize;
  final FontWeight fontWeight;
  final double lineHeight;
  final Color color;
  final Color linkColor;
  final int textMaxLines;
  final TextOverflow textOverflow;
  final bool shrinkWrap;
  final bool drawNewLines;
  final TextAlign textAlign;
  final double imageSize;
  final Display paragraphDisplay;

  const HtmlTextWidget({
    @required this.onLinkTap,
    this.fontSize = 18.0,
    this.lineHeight = 1.0,
    this.imageSize = 20.0,
    this.fontWeight = FontWeight.normal,
    this.linkColor,
    this.color,
    this.textMaxLines,
    this.paragraphDisplay = Display.INLINE,
    this.textOverflow,
    this.shrinkWrap = false,
    this.drawNewLines = true,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    var linkColor = this.linkColor ?? IFediUiColorTheme.of(context).primaryDark;

    String htmlData;

    var htmlTextData = Provider.of<HtmlTextData>(context, listen: true);
    var currentData = htmlTextData.htmlData;
    if (drawNewLines) {
      // draw both new line types
      htmlData = currentData?.replaceAll("\n", "</br>");
    } else {
      htmlData = currentData?.replaceAll("\n", "");
      htmlData = currentData?.replaceAll("<(/)*br>", "");
    }

    _logger.finest(() => "htmlData $htmlData");

    var textScaleFactor = MediaQuery.textScaleFactorOf(context);

    // todo: remove hack
    // textScaleFactor used for font size accessibility feature on iOS/Android
    // html lib handle it in wrong way. I think it is use / instead of *
    // so to compensate this calculations font size divided by
    // textScaleFactor twice
    // Usually textScaleFactor is 1.0 and this don't have any effect
    var fontSizeValue = fontSize / textScaleFactor / textScaleFactor;
    // _logger.finest(() => "textScaleFactor $textScaleFactor "
    //     " fontSize $fontSize "
    //     " fontSizeValue $fontSizeValue");

    var fontSizeObject = FontSize(fontSizeValue);
    return Html(
      shrinkWrap: shrinkWrap,
      onImageTap: (String source) {
        _logger.finest(() => "onImageTap $source");
      },
      style: {
        "html": Style(
          display: shrinkWrap ? Display.INLINE : Display.BLOCK,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          textOverflow: textOverflow,
          textMaxLines: textMaxLines,
          fontSize: fontSizeObject,
          fontWeight: fontWeight,
          color: color,
          textAlign: textAlign,
        ),
        "body": Style(
          display: shrinkWrap ? Display.INLINE : Display.BLOCK,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          textOverflow: textOverflow,
          textMaxLines: textMaxLines,
          textAlign: textAlign,
        ),
        "img": Style(
          display: Display.INLINE,
          width: imageSize,
          height: imageSize,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          textAlign: textAlign,
        ),
        "p": Style(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          lineHeight: lineHeight,
          display: paragraphDisplay,
          fontSize: fontSizeObject,
          fontWeight: fontWeight,
          color: color,
          textOverflow: textOverflow,
          textMaxLines: textMaxLines,
          textAlign: textAlign,
        ),
        "a": Style(
          color: linkColor,
        ),
        "text": Style(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          lineHeight: lineHeight,
          display: Display.INLINE,
          fontSize: fontSizeObject,
          fontWeight: fontWeight,
          color: color,
          textOverflow: textOverflow,
          textMaxLines: textMaxLines,
          textAlign: textAlign,
        ),
      },
      onImageError: (exception, stackTrace) {
        _logger.warning(() => "onImageError", exception, stackTrace);
      },
      data: htmlData ?? "",
      onLinkTap: (url) {
        onLinkTap(context, htmlTextData, url);
      },
    );
  }
}
