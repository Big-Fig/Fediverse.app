import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mastodon_application_model.g.dart';

@JsonSerializable()
class MastodonApplicationRegistrationRequest {
  /// A name for your application
  @JsonKey(name: "client_name")
  final String clientName;

  /// Where the user should be redirected after authorization.
  /// To display the authorization code to the
  /// user instead of redirecting to a web page,
  /// use urn:ietf:wg:oauth:2.0:oob in this parameter.
  @JsonKey(name: "redirect_uris")
  final String redirectUris;

  /// Space separated list of scopes. If none is provided, defaults to read.
  final String scopes;

  /// A URL to the homepage of your app
  final String website;
  MastodonApplicationRegistrationRequest(
      {@required this.clientName,
      @required this.redirectUris,
      this.scopes,
      this.website});

  factory MastodonApplicationRegistrationRequest.fromJson(Map<String, dynamic> json) =>
      _$MastodonApplicationRegistrationRequestFromJson(json);

  factory MastodonApplicationRegistrationRequest.fromJsonString(String jsonString) =>
      _$MastodonApplicationRegistrationRequestFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$MastodonApplicationRegistrationRequestToJson(this);

  String toJsonString() => jsonEncode(_$MastodonApplicationRegistrationRequestToJson(this));
}

abstract class IMastodonApplication {
  String get name;

  String get website;

  String get vapidKey;
}

abstract class IMastodonClientApplication {
  String get clientId;

  String get clientSecret;
}
