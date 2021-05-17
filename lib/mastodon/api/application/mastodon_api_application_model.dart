import 'package:fedi/json/json_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mastodon_api_application_model.g.dart';

@JsonSerializable()
class MastodonApiApplicationRegistrationRequest implements IJsonObject {
  /// A name for your application
  @JsonKey(name: 'client_name')
  final String? clientName;

  /// Where the user should be redirected after authorization.
  /// To display the authorization code to the
  /// user instead of redirecting to a web page,
  /// use urn:ietf:wg:oauth:2.0:oob in this parameter.
  @JsonKey(name: 'redirect_uris')
  final String? redirectUris;

  /// Space separated list of scopes. If none is provided, defaults to read.
  final String? scopes;

  /// A URL to the homepage of your app
  final String? website;

  MastodonApiApplicationRegistrationRequest({
    required this.clientName,
    required this.redirectUris,
    required this.scopes,
    required this.website,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiApplicationRegistrationRequest &&
          runtimeType == other.runtimeType &&
          clientName == other.clientName &&
          redirectUris == other.redirectUris &&
          scopes == other.scopes &&
          website == other.website;

  @override
  int get hashCode =>
      clientName.hashCode ^
      redirectUris.hashCode ^
      scopes.hashCode ^
      website.hashCode;

  @override
  String toString() {
    return 'MastodonApiApplicationRegistrationRequest{'
        'clientName: $clientName, '
        'redirectUris: $redirectUris, '
        'scopes: $scopes, '
        'website: $website'
        '}';
  }

  static MastodonApiApplicationRegistrationRequest fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiApplicationRegistrationRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$MastodonApiApplicationRegistrationRequestToJson(this);
}

abstract class IMastodonApiApplication {
  String? get name;

  String? get website;

  String? get vapidKey;
}

abstract class IMastodonApiClientApplication extends IMastodonApiApplication {
  String? get clientId;

  String? get clientSecret;
}
