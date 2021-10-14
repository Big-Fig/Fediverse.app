import 'package:flutter_html/html_parser.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger = Logger('unifedi_api_field_extension.dart');

extension IUnifediApiFieldExtension on IUnifediApiField {
  String? get valueAsRawUrl {
    if (value?.isNotEmpty == true) {
      try {
        var parsed = HtmlParser.parseHTML(value!);
        var allLinkElements = parsed.getElementsByTagName('a');
        if (allLinkElements.isNotEmpty) {
          return allLinkElements.first.attributes['href'];
        } else {
          return value;
        }
        // ignore: avoid_catches_without_on_clauses
      } catch (e, stackTrace) {
        _logger.warning(() => 'failed to parse URL from $value', e, stackTrace);

        return value;
      }
    } else {
      return value;
    }
  }

  String? get valueAsRawUrlWithoutSchema {
    var rawUrl = valueAsRawUrl;
    if (rawUrl == null) {
      return rawUrl;
    }
    try {
      var uri = Uri.parse(rawUrl);

      return '${uri.host}${uri.path}';
      // ignore: avoid_catches_without_on_clauses
    } catch (e, stackTrace) {
      _logger.warning(
        () => 'valueAsRawUrlWithoutSchema parse $rawUrl',
        e,
        stackTrace,
      );

      return rawUrl;
    }
  }
}
