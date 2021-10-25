import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../api/oauth/unifedi_api_oauth_model.dart';

part 'unifedi_api_oauth_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_oauth_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiOAuthTokenMastodonAdapter
    with _$UnifediApiOAuthTokenMastodonAdapter
    implements IUnifediApiOAuthToken {
  const UnifediApiOAuthTokenMastodonAdapter._();
  const factory UnifediApiOAuthTokenMastodonAdapter(
    @HiveField(0) MastodonApiOAuthToken value,
  ) = _UnifediApiOAuthTokenMastodonAdapter;

  @override
  String get accessToken => value.accessToken;

  @override
  String get tokenType => value.tokenType;

  @override
  String? get id => null;

  @override
  String? get me => null;
  factory UnifediApiOAuthTokenMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiOAuthTokenMastodonAdapterFromJson(json);
}

extension MastodonApiOAuthTokenUnifediExtension on IMastodonApiOAuthToken {
  UnifediApiOAuthTokenMastodonAdapter toUnifediApiOAuthTokenMastodonAdapter() =>
      UnifediApiOAuthTokenMastodonAdapter(
        toMastodonApiOAuthToken(),
      );
}

extension MastodonApiOAuthTokenUnifediListExtension
    on List<IMastodonApiOAuthToken> {
  List<UnifediApiOAuthTokenMastodonAdapter>
      toUnifediApiOAuthTokenMastodonAdapterList() => map(
            (item) => item.toUnifediApiOAuthTokenMastodonAdapter(),
          ).toList();
}

extension UnifediApiOAuthTokenMastodonExtension on IUnifediApiOAuthToken {
  MastodonApiOAuthToken toMastodonApiOAuthToken() => MastodonApiOAuthToken(
        accessToken: accessToken,
        tokenType: tokenType,
      );
}
