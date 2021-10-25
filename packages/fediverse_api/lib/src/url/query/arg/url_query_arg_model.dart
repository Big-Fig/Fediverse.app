import 'package:freezed_annotation/freezed_annotation.dart';

part 'url_query_arg_model.freezed.dart';

@freezed
class UrlQueryArg with _$UrlQueryArg {
  const factory UrlQueryArg({
    required String key,
    required String value,
  }) = _UrlQueryArg;

  static List<UrlQueryArg> listFromJson(Map<String, dynamic> json) {
    var queryArgs = <UrlQueryArg>[];

    for (final entry in json.entries) {
      dynamic value = entry.value;
      if (value != null) {
        if (value is Iterable) {
          var iterable = value;
          queryArgs.addAll(
            iterable.map(
              (dynamic item) => UrlQueryArg(
                key: entry.key,
                value: item.toString(),
              ),
            ),
          );
        } else {
          queryArgs.add(
            UrlQueryArg(
              key: entry.key,
              value: entry.value.toString(),
            ),
          );
        }
      }
    }

    return queryArgs;
  }
}

extension UrlQueryArgIterableExtension on Iterable<UrlQueryArg> {
  String toQueryPart() => map(
        (arg) => '${arg.key}=${arg.value}',
      ).join('&');
}
