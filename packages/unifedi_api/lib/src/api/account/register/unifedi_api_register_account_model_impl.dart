import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'unifedi_api_register_account_model.dart';

part 'unifedi_api_register_account_model_impl.freezed.dart';

part 'unifedi_api_register_account_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class UnifediApiRegisterAccount
    with _$UnifediApiRegisterAccount
    implements IUnifediApiRegisterAccount {
  const factory UnifediApiRegisterAccount({
    @HiveField(1) required String username,
    @HiveField(2) required String email,
    @HiveField(3) required String password,
    @HiveField(4) required bool agreement,
    @HiveField(5) required String locale,
    @HiveField(6) required String? reason,
    @JsonKey(name: 'captcha_token') @HiveField(7) required String? captchaToken,
    @JsonKey(name: 'captcha_answer_data')
    @HiveField(8)
        required String? captchaAnswerData,
    @JsonKey(name: 'captcha_solution')
    @HiveField(9)
        required String? captchaSolution,
    @HiveField(10) required String? fullName,
    @HiveField(11) required String? bio,
    @JsonKey(name: 'token') @HiveField(12) required String? inviteToken,
  }) = _UnifediApiRegisterAccount;

  factory UnifediApiRegisterAccount.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiRegisterAccountFromJson(json);
}

extension IUnifediApiRegisterAccountInterfaceExtension
    on IUnifediApiRegisterAccount {
  UnifediApiRegisterAccount toUnifediApiRegisterAccount({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiRegisterAccount(
          username: username,
          email: email,
          password: password,
          agreement: agreement,
          locale: locale,
          reason: reason,
          captchaToken: captchaToken,
          captchaAnswerData: captchaAnswerData,
          captchaSolution: captchaSolution,
          fullName: fullName,
          bio: bio,
          inviteToken: inviteToken,
        ),
        forceNewObject: forceNewObject,
      );
}

extension IUnifediApiRegisterAccountInterfaceListExtension
    on List<IUnifediApiRegisterAccount> {
  List<UnifediApiRegisterAccount> toUnifediApiRegisterAccountList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiRegisterAccount item) => item.toUnifediApiRegisterAccount(),
        forceNewObject: forceNewObject,
      );
}
