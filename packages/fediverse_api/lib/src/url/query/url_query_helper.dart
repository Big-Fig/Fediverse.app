abstract class UrlQueryHelper {
  static String combineQueryArguments(Map<String, dynamic> args) {
    var path = args.entries
        .where((entry) => entry.value.toString().isNotEmpty)
        .map((entry) => '${entry.key}=${entry.value}')
        .join('&');

    // ignore: cascade_invocations
    return path.replaceAll(' ', '%20');
  }
}
