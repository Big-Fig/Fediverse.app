import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'pleroma_api_register_account_model.dart';

part 'pleroma_api_register_account_model_impl.freezed.dart';

part 'pleroma_api_register_account_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class PleromaApiRegisterAccount
    with _$PleromaApiRegisterAccount
    implements IPleromaApiRegisterAccount {
  const factory PleromaApiRegisterAccount({
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
    @JsonKey(name: 'fullname') @HiveField(10) required String? fullName,
    @HiveField(11) required String? bio,
    @JsonKey(name: 'token') @HiveField(12) required String? inviteToken,
  }) = _PleromaApiRegisterAccount;

  factory PleromaApiRegisterAccount.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiRegisterAccountFromJson(json);
}

extension IPleromaApiRegisterAccountInterfaceExtension
    on IPleromaApiRegisterAccount {
  PleromaApiRegisterAccount toPleromaApiRegisterAccount({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiRegisterAccount(
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

extension IPleromaApiRegisterAccountInterfaceListExtension
    on List<IPleromaApiRegisterAccount> {
  List<PleromaApiRegisterAccount> toPleromaApiRegisterAccountList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiRegisterAccount item) => item.toPleromaApiRegisterAccount(),
        forceNewObject: forceNewObject,
      );
}
