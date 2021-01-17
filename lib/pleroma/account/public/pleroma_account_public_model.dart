import 'dart:convert';

import 'package:fedi/mastodon/account/public/mastodon_account_public_model.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_account_public_model.g.dart';

abstract class IPleromaAccountRegisterRequest extends IMastodonAccountRegister {
  Map<String, dynamic> toJson();

  String get captchaToken;

  String get captchaAnswerData;

  String get captchaSolution;
}

@JsonSerializable(
  includeIfNull: false,
)
class PleromaAccountRegisterRequest extends IPleromaAccountRegisterRequest {
  @override
  final bool agreement;

  @override
  final String email;

  @override
  final String locale;

  @override
  final String password;

  @override
  final String reason;

  @override
  final String username;

  @override
  @JsonKey(name: "captcha_token")
  final String captchaToken;
  @override
  @JsonKey(name: "captcha_answer_data")
  final String captchaAnswerData;
  @override
  @JsonKey(name: "captcha_solution")
  final String captchaSolution;

  PleromaAccountRegisterRequest({
    @required this.agreement,
    @required this.email,
    @required this.locale,
    @required this.password,
    this.reason,
    @required this.username,
    @required this.captchaToken,
    @required this.captchaAnswerData,
    @required this.captchaSolution,
  });

  @override
  String toString() {
    return 'PleromaAccountRegisterRequest{agreement: $agreement, '
        'email: $email, locale: $locale, password: $password, '
        'reason: $reason, username: $username, captchaToken: $captchaToken, '
        'captchaAnswerData: $captchaAnswerData, '
        'captchaSolution: $captchaSolution}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaAccountRegisterRequest &&
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

  factory PleromaAccountRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$PleromaAccountRegisterRequestFromJson(json);

  factory PleromaAccountRegisterRequest.fromJsonString(String jsonString) =>
      _$PleromaAccountRegisterRequestFromJson(jsonDecode(jsonString));

  static List<PleromaAccountRegisterRequest> listFromJsonString(String str) =>
      List<PleromaAccountRegisterRequest>.from(json
          .decode(str)
          .map((x) => PleromaAccountRegisterRequest.fromJson(x)));

  @override
  Map<String, dynamic> toJson() => _$PleromaAccountRegisterRequestToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaAccountRegisterRequestToJson(this));
}
