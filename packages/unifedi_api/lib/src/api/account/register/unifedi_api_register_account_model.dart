import '../../unifedi_api_model.dart';

abstract class IUnifediApiRegisterAccount implements IUnifediApiObject {
  String get username;

  String get email;

  String get password;

  bool get agreement;

  String get locale;

  String? get reason;

  String? get captchaToken;

  String? get captchaAnswerData;

  String? get captchaSolution;

  String? get fullName;

  String? get bio;

  String? get inviteToken;
}
