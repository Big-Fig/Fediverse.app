import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_account_public_model.g.dart';

abstract class IPleromaApiAccountPublicRegisterRequest
    extends IMastodonApiAccountRegister {
  Map<String, dynamic> toJson();

  String? get captchaToken;

  String? get captchaAnswerData;

  String? get captchaSolution;
}

@JsonSerializable(
  includeIfNull: false,
)
class PleromaApiAccountPublicRegisterRequest
    extends IPleromaApiAccountPublicRegisterRequest implements IJsonObject {
  @override
  final bool? agreement;

  @override
  final String? email;

  @override
  final String? locale;

  @override
  final String? password;

  @override
  final String? reason;

  @override
  final String? username;

  @override
  @JsonKey(name: 'captcha_token')
  final String? captchaToken;
  @override
  @JsonKey(name: 'captcha_answer_data')
  final String? captchaAnswerData;
  @override
  @JsonKey(name: 'captcha_solution')
  final String? captchaSolution;

  PleromaApiAccountPublicRegisterRequest({
    required this.agreement,
    required this.email,
    required this.locale,
    required this.password,
    required this.reason,
    required this.username,
    required this.captchaToken,
    required this.captchaAnswerData,
    required this.captchaSolution,
  });

  @override
  String toString() {
    return 'PleromaApiAccountRegisterRequest{'
        'agreement: $agreement, '
        'email: $email, '
        'locale: $locale, '
        'password: $password, '
        'reason: $reason, '
        'username: $username, '
        'captchaToken: $captchaToken, '
        'captchaAnswerData: $captchaAnswerData, '
        'captchaSolution: $captchaSolution'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiAccountPublicRegisterRequest &&
          runtimeType == other.runtimeType &&
          agreement == other.agreement &&
          email == other.email &&
          locale == other.locale &&
          password == other.password &&
          reason == other.reason &&
          username == other.username &&
          captchaToken == other.captchaToken &&
          captchaAnswerData == other.captchaAnswerData &&
          captchaSolution == other.captchaSolution;

  @override
  int get hashCode =>
      agreement.hashCode ^
      email.hashCode ^
      locale.hashCode ^
      password.hashCode ^
      reason.hashCode ^
      username.hashCode ^
      captchaToken.hashCode ^
      captchaAnswerData.hashCode ^
      captchaSolution.hashCode;

  static PleromaApiAccountPublicRegisterRequest fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiAccountPublicRegisterRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$PleromaApiAccountPublicRegisterRequestToJson(this);
}
