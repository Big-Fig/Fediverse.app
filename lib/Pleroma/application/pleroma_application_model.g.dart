// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApplication _$PleromaApplicationFromJson(Map<String, dynamic> json) {
  return PleromaApplication(
    name: const MastodonApplicationNameTypeConverter()
        .fromJson(json['name'] as String),
    website: json['website'],
    vapidKey: json['vapid_key'] as String,
  );
}

Map<String, dynamic> _$PleromaApplicationToJson(PleromaApplication instance) =>
    <String, dynamic>{
      'name':
          const MastodonApplicationNameTypeConverter().toJson(instance.name),
      'website': instance.website,
      'vapid_key': instance.vapidKey,
    };
