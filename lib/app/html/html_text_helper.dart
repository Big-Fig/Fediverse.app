//import 'package:html/parser.dart';

import 'package:html/parser.dart';

class HtmlTextHelper {
  static String extractRawStringFromHtmlString(String htmlText) {
    var document = parse(htmlText);

    String parsedString = parse(document.body.text).documentElement.text;

    return parsedString;
  }
}
