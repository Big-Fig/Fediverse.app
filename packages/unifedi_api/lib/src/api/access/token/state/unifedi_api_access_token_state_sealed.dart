import 'package:freezed_annotation/freezed_annotation.dart';

import '../unifedi_api_access_token_model.dart';

part 'unifedi_api_access_token_state_sealed.freezed.dart';

@freezed
class UnifediApiAccessTokenState<TToken extends IUnifediApiAccessToken>
    with _$UnifediApiAccessTokenState {
  const factory UnifediApiAccessTokenState.notExist() = _NotExist<TToken>;

  const factory UnifediApiAccessTokenState.valid({
    required TToken token,
  }) = _Valid<TToken>;

  const factory UnifediApiAccessTokenState.error() = _Error<TToken>;
}
