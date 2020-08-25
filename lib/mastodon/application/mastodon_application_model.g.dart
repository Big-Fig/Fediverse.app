// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MastodonApplicationRegistrationRequest
    _$MastodonApplicationRegistrationRequestFromJson(
        Map<String, dynamic> json) {
  return MastodonApplicationRegistrationRequest(
    clientName: json['client_name'] as String,
    redirectUris: json['redirect_uris'] as String,
    scopes: json['scopes'] as String,
    website: json['website'] as String,
  );
}

Map<String, dynamic> _$MastodonApplicationRegistrationRequestToJson(
        MastodonApplicationRegistrationRequest instance) =>
    <String, dynamic>{
      'client_name': instance.clientName,
      'redirect_uris': instance.redirectUris,
      'scopes': instance.scopes,
      'website': instance.website,
    };
