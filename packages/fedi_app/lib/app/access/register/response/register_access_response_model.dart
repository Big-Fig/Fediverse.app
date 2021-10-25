import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'register_access_response_model.freezed.dart';

@freezed
class RegisterAccessResponse with _$RegisterAccessResponse {
  const factory RegisterAccessResponse({
    required IUnifediApiAccess? access,
    required IUnifediApiRegisterAccountResponse response,
    required IUnifediApiMyAccount? myAccount,
  }) = _RegisterAccessResponse;
}
