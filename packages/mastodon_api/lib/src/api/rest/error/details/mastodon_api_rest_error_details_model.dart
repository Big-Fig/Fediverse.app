import '../type/mastodon_api_rest_error_type_sealed.dart';

abstract class IMastodonApiRestErrorDetails {
  String get error;

  String? get description;

  Map<String, List<IMastodonApiRestErrorDetails>>? get details;
}

extension MastodonApiRestErrorDetailsExtension on IMastodonApiRestErrorDetails {
  MastodonApiRestErrorType get errorAsMastodonApi =>
      MastodonApiRestErrorType.fromStringValue(
        error,
      );
}
