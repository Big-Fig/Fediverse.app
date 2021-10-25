import 'rest_header_model.dart';

abstract class RestHeaderHelper {
  static Map<String, String> toMap(List<RestHeader> headers) =>
      headers.asMap().map(
            (_, value) => MapEntry(value.key, value.value),
          );
}
