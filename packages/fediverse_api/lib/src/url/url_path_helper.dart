import 'package:path/path.dart' as path;

var _urlPath = path.Context(style: path.Style.url);

abstract class UrlPathHelper {
  static String join(Iterable<String> parts) => _urlPath.joinAll(parts);
}
