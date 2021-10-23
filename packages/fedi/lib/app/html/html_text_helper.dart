import 'package:html/parser.dart';

extension RawStringFromHtmlStringExtension on String {
  String extractRawStringFromHtmlString() {
    var document = parse(this);

    var parsedString = document.body?.text ?? document.text ?? this;

    return parsedString;
  }
}
