import 'package:html/parser.dart';

class HtmlTextHelper {
  static String extractRawStringFromHtmlString(String htmlText) {
    if(htmlText == null) {
      return null;
    }
    var document = parse(htmlText);

    String parsedString = parse(document.body.text).documentElement.text;

    return parsedString;
  }
}
