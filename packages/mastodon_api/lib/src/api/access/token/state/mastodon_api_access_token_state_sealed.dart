import 'package:freezed_annotation/freezed_annotation.dart';

import '../mastodon_api_access_token_model.dart';

part 'mastodon_api_access_token_state_sealed.freezed.dart';

@freezed
class MastodonApiAccessTokenState<TToken extends IMastodonApiAccessToken>
    with _$MastodonApiAccessTokenState {
  const factory MastodonApiAccessTokenState.notExist() = _NotExist<TToken>;

  const factory MastodonApiAccessTokenState.valid({
    required TToken token,
  }) = _Valid<TToken>;

  const factory MastodonApiAccessTokenState.error() = _Error<TToken>;
}
