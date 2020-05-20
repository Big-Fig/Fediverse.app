import 'dart:convert';

import 'package:fedi/mastodon/account/public/mastodon_account_public_model.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_account_public_model.g.dart';

abstract class IPleromaAccountRegisterRequest extends IMastodonAccountRegister {
  Map<String, dynamic> toJson();
}

@JsonSerializable()
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

  PleromaAccountRegisterRequest(
      {@required this.agreement,
      @required this.email,
      @required this.locale,
      @required this.password,
      this.reason,
      @required this.username});

  @override
  String toString() {
    return 'PleromaAccountRegister{agreement: $agreement,'
        ' email: $email, locale: $locale,'
        ' password: $password, reason: $reason, username: $username}';
  }

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
