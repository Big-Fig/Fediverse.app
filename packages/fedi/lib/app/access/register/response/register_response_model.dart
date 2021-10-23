import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'register_response_model.freezed.dart';

@freezed
class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    required IUnifediApiAccess? access,
    required IUnifediApiRegisterAccountResponse response,
    required IUnifediApiMyAccount? myAccount,
  }) = _RegisterResponse;
}
