import 'package:freezed_annotation/freezed_annotation.dart';

import '../pleroma_api_access_token_model.dart';

part 'pleroma_api_access_token_state_sealed.freezed.dart';

@freezed
class PleromaApiAccessTokenState<TToken extends IPleromaApiAccessToken>
    with _$PleromaApiAccessTokenState {
  const factory PleromaApiAccessTokenState.notExist() = _NotExist<TToken>;

  const factory PleromaApiAccessTokenState.valid({
    required TToken token,
  }) = _Valid<TToken>;

  const factory PleromaApiAccessTokenState.error() = _Error<TToken>;
}
