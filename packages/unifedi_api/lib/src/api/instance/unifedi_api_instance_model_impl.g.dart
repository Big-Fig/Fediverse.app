// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceAdapter extends TypeAdapter<UnifediApiInstance> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstance read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstance(
      type: fields[0] as String,
      versionString: fields[1] as String,
      limits: fields[2] as UnifediApiInstanceLimits?,
      vapidPublicKey: fields[3] as String?,
      backgroundImage: fields[4] as String?,
      contactAccount: fields[5] as UnifediApiAccount?,
      features: (fields[6] as List?)?.cast<String>(),
      postFormats: (fields[7] as List?)?.cast<String>(),
      accountActivationRequired: fields[8] as bool?,
      federation: fields[9] as UnifediApiInstanceFederation?,
      urls: fields[10] as UnifediApiInstanceUrls?,
      stats: fields[11] as UnifediApiInstanceStats?,
      uri: fields[12] as String,
      title: fields[13] as String?,
      shortDescription: fields[14] as String?,
      description: fields[15] as String?,
      email: fields[16] as String?,
      thumbnail: fields[17] as String?,
      languages: (fields[18] as List?)?.cast<String>(),
      registrations: fields[19] as bool?,
      approvalRequired: fields[20] as bool?,
      invitesEnabled: fields[21] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiInstance obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.limits)
      ..writeByte(3)
      ..write(obj.vapidPublicKey)
      ..writeByte(4)
      ..write(obj.backgroundImage)
      ..writeByte(5)
      ..write(obj.contactAccount)
      ..writeByte(6)
      ..write(obj.features)
      ..writeByte(7)
      ..write(obj.postFormats)
      ..writeByte(20)
      ..write(obj.approvalRequired)
      ..writeByte(8)
      ..write(obj.accountActivationRequired)
      ..writeByte(9)
      ..write(obj.federation)
      ..writeByte(10)
      ..write(obj.urls)
      ..writeByte(11)
      ..write(obj.stats)
      ..writeByte(13)
      ..write(obj.title)
      ..writeByte(14)
      ..write(obj.shortDescription)
      ..writeByte(15)
      ..write(obj.description)
      ..writeByte(16)
      ..write(obj.email)
      ..writeByte(17)
      ..write(obj.thumbnail)
      ..writeByte(18)
      ..write(obj.languages)
      ..writeByte(19)
      ..write(obj.registrations)
      ..writeByte(21)
      ..write(obj.invitesEnabled)
      ..writeByte(12)
      ..write(obj.uri)
      ..writeByte(1)
      ..write(obj.versionString);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiInstanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstance _$$_UnifediApiInstanceFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiInstance(
      type: json['type'] as String,
      versionString: json['version'] as String,
      limits: json['limits'] == null
          ? null
          : UnifediApiInstanceLimits.fromJson(
              json['limits'] as Map<String, dynamic>),
      vapidPublicKey: json['vapid_public_key'] as String?,
      backgroundImage: json['background_image'] as String?,
      contactAccount: json['contact_account'] == null
          ? null
          : UnifediApiAccount.fromJson(
              json['contact_account'] as Map<String, dynamic>),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      postFormats: (json['post_formats'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      accountActivationRequired: json['account_activation'] as bool?,
      federation: json['federation'] == null
          ? null
          : UnifediApiInstanceFederation.fromJson(
              json['federation'] as Map<String, dynamic>),
      urls: json['urls'] == null
          ? null
          : UnifediApiInstanceUrls.fromJson(
              json['urls'] as Map<String, dynamic>),
      stats: json['stats'] == null
          ? null
          : UnifediApiInstanceStats.fromJson(
              json['stats'] as Map<String, dynamic>),
      uri: json['uri'] as String,
      title: json['title'] as String?,
      shortDescription: json['short_description'] as String?,
      description: json['description'] as String?,
      email: json['email'] as String?,
      thumbnail: json['thumbnail'] as String?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      registrations: json['registrations'] as bool?,
      approvalRequired: json['approval_required'] as bool?,
      invitesEnabled: json['invites_enabled'] as bool?,
    );

Map<String, dynamic> _$$_UnifediApiInstanceToJson(
    _$_UnifediApiInstance instance) {
  final val = <String, dynamic>{
    'type': instance.type,
    'version': instance.versionString,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('limits', instance.limits?.toJson());
  writeNotNull('vapid_public_key', instance.vapidPublicKey);
  writeNotNull('background_image', instance.backgroundImage);
  writeNotNull('contact_account', instance.contactAccount?.toJson());
  writeNotNull('features', instance.features);
  writeNotNull('post_formats', instance.postFormats);
  writeNotNull('account_activation', instance.accountActivationRequired);
  writeNotNull('federation', instance.federation?.toJson());
  writeNotNull('urls', instance.urls?.toJson());
  writeNotNull('stats', instance.stats?.toJson());
  val['uri'] = instance.uri;
  writeNotNull('title', instance.title);
  writeNotNull('short_description', instance.shortDescription);
  writeNotNull('description', instance.description);
  writeNotNull('email', instance.email);
  writeNotNull('thumbnail', instance.thumbnail);
  writeNotNull('languages', instance.languages);
  writeNotNull('registrations', instance.registrations);
  writeNotNull('approval_required', instance.approvalRequired);
  writeNotNull('invites_enabled', instance.invitesEnabled);
  return val;
}
