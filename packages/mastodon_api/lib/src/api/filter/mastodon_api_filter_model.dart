import '../mastodon_api_model.dart';
import 'context_type/mastodon_api_filter_context_type_model.dart';

abstract class IMastodonApiFilter implements IMastodonApiResponse {
  /// The ID of the filter in the database.
  String get id;

  /// When the filter should no longer be applied
  DateTime? get expiresAt;

  ///  The text to be filtered.
  String get phrase;

  ///  The contexts in which the filter should be applied.
  List<String> get context;

  /// Should matching entities in home and
  /// notifications be dropped by the server?
  bool get irreversible;

  /// Should the filter consider word boundaries?
  bool get wholeWord;
}

extension IMastodonApiFilterTypeExtension on IMastodonApiFilter {
  List<MastodonApiFilterContextType> get contextAsMastodonApiType =>
      context.toMastodonApiFilterContextTypeList();
}
