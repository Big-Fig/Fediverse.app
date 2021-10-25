// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_edit_my_account_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiEditMyAccountAdapter
    extends TypeAdapter<MastodonApiEditMyAccount> {
  @override
  final int typeId = 0;

  @override
  MastodonApiEditMyAccount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiEditMyAccount(
      fieldsAttributes: (fields[1] as List?)?.cast<MastodonApiField>(),
      discoverable: fields[2] as bool?,
      bot: fields[3] as bool?,
      displayName: fields[4] as String?,
      note: fields[5] as String?,
      locked: fields[6] as bool?,
      privacy: fields[7] as String?,
      sensitive: fields[8] as bool?,
      language: fields[9] as String?,
      avatarLocalFilePath: fields[10] as String?,
      deleteAvatar: fields[11] as bool?,
      headerLocalFilePath: fields[12] as String?,
      deleteHeader: fields[13] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiEditMyAccount obj) {
    writer
      ..writeByte(13)
      ..writeByte(1)
      ..write(obj.fieldsAttributes)
      ..writeByte(2)
      ..write(obj.discoverable)
      ..writeByte(3)
      ..write(obj.bot)
      ..writeByte(4)
      ..write(obj.displayName)
      ..writeByte(5)
      ..write(obj.note)
      ..writeByte(6)
      ..write(obj.locked)
      ..writeByte(7)
      ..write(obj.privacy)
      ..writeByte(8)
      ..write(obj.sensitive)
      ..writeByte(9)
      ..write(obj.language)
      ..writeByte(10)
      ..write(obj.avatarLocalFilePath)
      ..writeByte(11)
      ..write(obj.deleteAvatar)
      ..writeByte(12)
      ..write(obj.headerLocalFilePath)
      ..writeByte(13)
      ..write(obj.deleteHeader);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiEditMyAccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiEditMyAccount _$$_MastodonApiEditMyAccountFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiEditMyAccount(
      fieldsAttributes: (json['fields_attributes'] as List<dynamic>?)
          ?.map((e) => MastodonApiField.fromJson(e as Map<String, dynamic>))
          .toList(),
      discoverable: json['discoverable'] as bool?,
      bot: json['bot'] as bool?,
      displayName: json['display_name'] as String?,
      note: json['note'] as String?,
      locked: json['locked'] as bool?,
      privacy: json['privacy'] as String?,
      sensitive: json['sensitive'] as bool?,
      language: json['language'] as String?,
      avatarLocalFilePath: json['avatar_local_file_path'] as String?,
      deleteAvatar: json['delete_avatar'] as bool?,
      headerLocalFilePath: json['header_local_file_path'] as String?,
      deleteHeader: json['delete_header'] as bool?,
    );

Map<String, dynamic> _$$_MastodonApiEditMyAccountToJson(
    _$_MastodonApiEditMyAccount instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fields_attributes',
      instance.fieldsAttributes?.map((e) => e.toJson()).toList());
  writeNotNull('discoverable', instance.discoverable);
  writeNotNull('bot', instance.bot);
  writeNotNull('display_name', instance.displayName);
  writeNotNull('note', instance.note);
  writeNotNull('locked', instance.locked);
  writeNotNull('privacy', instance.privacy);
  writeNotNull('sensitive', instance.sensitive);
  writeNotNull('language', instance.language);
  writeNotNull('avatar_local_file_path', instance.avatarLocalFilePath);
  writeNotNull('delete_avatar', instance.deleteAvatar);
  writeNotNull('header_local_file_path', instance.headerLocalFilePath);
  writeNotNull('delete_header', instance.deleteHeader);
  return val;
}
