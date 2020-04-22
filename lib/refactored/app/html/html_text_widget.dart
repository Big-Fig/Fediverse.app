import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/rich_text_parser.dart';
import 'package:html/dom.dart' as dom;

class HtmlTextWidget extends StatelessWidget {
  final String data;
  final OnLinkTap onLinkTap;

  HtmlTextWidget({@required this.data, @required this.onLinkTap});

  @override
  Widget build(BuildContext context) => Html(
        onImageTap: (String source) {
          print("source $source");
        },
        customTextStyle: (dom.Node node, TextStyle baseStyle) {
          if (node is dom.Element) {
            switch (node.localName) {
              case "p":
                return baseStyle.merge(TextStyle(fontSize: 18));
            }
          }
          return baseStyle.merge(TextStyle(fontSize: 18));
        },
        onImageError: (dynamic exception, StackTrace stackTrace) {
          print("Image error!!!");
          print(exception);
          print(stackTrace);
        },
        data: data,
        onLinkTap: onLinkTap,
      );
}
