// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MastodonApiApplicationRegistrationRequest
    _$MastodonApiApplicationRegistrationRequestFromJson(
        Map<String, dynamic> json) {
  return MastodonApiApplicationRegistrationRequest(
    clientName: json['client_name'] as String?,
    redirectUris: json['redirect_uris'] as String?,
    scopes: json['scopes'] as String?,
    website: json['website'] as String?,
  );
}

Map<String, dynamic> _$MastodonApiApplicationRegistrationRequestToJson(
        MastodonApiApplicationRegistrationRequest instance) =>
    <String, dynamic>{
      'client_name': instance.clientName,
      'redirect_uris': instance.redirectUris,
      'scopes': instance.scopes,
      'website': instance.website,
    };
