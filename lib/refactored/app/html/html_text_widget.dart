import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'package:logging/logging.dart';

var _logger = Logger("html_text_widget.dart");

class HtmlTextWidget extends StatelessWidget {
  final String data;
  final OnTap onLinkTap;
  final double fontSize;

  HtmlTextWidget(
      {@required this.data, @required this.onLinkTap, this.fontSize = 18.0});

  @override
  Widget build(BuildContext context) => Html(
        onImageTap: (String source) {
          _logger.finest(() => "onImageTap $source");
        },
        style: {
          "img": Style(display: Display.INLINE, width: 20, height: 20),
          "p": Style(fontSize: FontSize(fontSize)),
        },
        onImageError: (exception, stackTrace) {
          _logger.warning(() => "onImageError", exception, stackTrace);
        },
        data: data,
        onLinkTap: onLinkTap,
      );
}
