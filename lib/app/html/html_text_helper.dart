import 'package:html/parser.dart';

extension RawStringFromHtmlStringExtension on String {
  String extractRawStringFromHtmlString() {
    var document = parse(this);

    var parsedString = parse(document.text.toString()).documentElement?.text ?? "";

    return parsedString;
  }
}
