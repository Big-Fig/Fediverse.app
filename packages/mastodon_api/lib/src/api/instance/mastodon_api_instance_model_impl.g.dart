// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_instance_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiInstanceAdapter extends TypeAdapter<MastodonApiInstance> {
  @override
  final int typeId = 0;

  @override
  MastodonApiInstance read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiInstance(
      uri: fields[0] as String,
      title: fields[1] as String?,
      shortDescription: fields[2] as String?,
      description: fields[3] as String?,
      email: fields[4] as String?,
      versionString: fields[5] as String,
      urls: fields[6] as MastodonApiInstanceUrls?,
      stats: fields[7] as MastodonApiInstanceStats?,
      thumbnail: fields[8] as String?,
      languages: (fields[9] as List?)?.cast<String>(),
      registrations: fields[10] as bool?,
      approvalRequired: fields[11] as bool?,
      invitesEnabled: fields[12] as bool?,
      contactAccount: fields[13] as MastodonApiAccount?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiInstance obj) {
    writer
      ..writeByte(14)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.shortDescription)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.urls)
      ..writeByte(7)
      ..write(obj.stats)
      ..writeByte(8)
      ..write(obj.thumbnail)
      ..writeByte(9)
      ..write(obj.languages)
      ..writeByte(10)
      ..write(obj.registrations)
      ..writeByte(11)
      ..write(obj.approvalRequired)
      ..writeByte(12)
      ..write(obj.invitesEnabled)
      ..writeByte(13)
      ..write(obj.contactAccount)
      ..writeByte(0)
      ..write(obj.uri)
      ..writeByte(5)
      ..write(obj.versionString);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiInstanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiInstance _$$_MastodonApiInstanceFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiInstance(
      uri: json['uri'] as String,
      title: json['title'] as String?,
      shortDescription: json['short_description'] as String?,
      description: json['description'] as String?,
      email: json['email'] as String?,
      versionString: json['version'] as String,
      urls: json['urls'] == null
          ? null
          : MastodonApiInstanceUrls.fromJson(
              json['urls'] as Map<String, dynamic>),
      stats: json['stats'] == null
          ? null
          : MastodonApiInstanceStats.fromJson(
              json['stats'] as Map<String, dynamic>),
      thumbnail: json['thumbnail'] as String?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      registrations: json['registrations'] as bool?,
      approvalRequired: json['approvalRequired'] as bool?,
      invitesEnabled: json['invitesEnabled'] as bool?,
      contactAccount: json['contact_account'] == null
          ? null
          : MastodonApiAccount.fromJson(
              json['contact_account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MastodonApiInstanceToJson(
    _$_MastodonApiInstance instance) {
  final val = <String, dynamic>{
    'uri': instance.uri,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('short_description', instance.shortDescription);
  writeNotNull('description', instance.description);
  writeNotNull('email', instance.email);
  val['version'] = instance.versionString;
  writeNotNull('urls', instance.urls?.toJson());
  writeNotNull('stats', instance.stats?.toJson());
  writeNotNull('thumbnail', instance.thumbnail);
  writeNotNull('languages', instance.languages);
  writeNotNull('registrations', instance.registrations);
  writeNotNull('approvalRequired', instance.approvalRequired);
  writeNotNull('invitesEnabled', instance.invitesEnabled);
  writeNotNull('contact_account', instance.contactAccount?.toJson());
  return val;
}
