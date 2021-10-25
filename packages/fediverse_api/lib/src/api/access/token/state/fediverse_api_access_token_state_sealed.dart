import 'package:freezed_annotation/freezed_annotation.dart';

import '../fediverse_api_access_token_model.dart';

part 'fediverse_api_access_token_state_sealed.freezed.dart';

@freezed
class FediverseApiAccessTokenState<TToken extends IFediverseApiAccessToken>
    with _$FediverseApiAccessTokenState {
  const factory FediverseApiAccessTokenState.notExist() = _NotExist<TToken>;

  const factory FediverseApiAccessTokenState.valid({
    required TToken token,
  }) = _Valid<TToken>;

  const factory FediverseApiAccessTokenState.error() = _Error<TToken>;
}
