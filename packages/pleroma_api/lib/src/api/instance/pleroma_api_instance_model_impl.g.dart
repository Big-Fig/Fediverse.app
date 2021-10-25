// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_instance_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiInstancePleromaPartAdapter
    extends TypeAdapter<PleromaApiInstancePleromaPart> {
  @override
  final int typeId = 0;

  @override
  PleromaApiInstancePleromaPart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiInstancePleromaPart(
      metadata: fields[0] as PleromaApiInstanceMetadata?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiInstancePleromaPart obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.metadata);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiInstancePleromaPartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaApiInstanceAdapter extends TypeAdapter<PleromaApiInstance> {
  @override
  final int typeId = 0;

  @override
  PleromaApiInstance read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiInstance(
      approvalRequired: fields[0] as bool?,
      avatarUploadLimit: fields[1] as int?,
      backgroundUploadLimit: fields[2] as int?,
      bannerUploadLimit: fields[3] as int?,
      contactAccount: fields[4] as PleromaApiAccount?,
      email: fields[5] as String?,
      languages: (fields[6] as List?)?.cast<String>(),
      maxTootChars: fields[7] as int?,
      pleroma: fields[8] as PleromaApiInstancePleromaPart?,
      pollLimits: fields[9] as PleromaApiInstancePollLimits?,
      registrations: fields[10] as bool?,
      shortDescription: fields[11] as String?,
      stats: fields[12] as PleromaApiInstanceStats?,
      thumbnail: fields[13] as String?,
      title: fields[14] as String?,
      uploadLimit: fields[15] as int?,
      uri: fields[16] as String,
      urls: fields[17] as PleromaApiInstanceUrls?,
      vapidPublicKey: fields[18] as String?,
      versionString: fields[19] as String,
      backgroundImage: fields[20] as String?,
      chatLimit: fields[21] as int?,
      description: fields[22] as String?,
      descriptionLimit: fields[23] as int?,
      invitesEnabled: fields[24] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiInstance obj) {
    writer
      ..writeByte(25)
      ..writeByte(7)
      ..write(obj.maxTootChars)
      ..writeByte(9)
      ..write(obj.pollLimits)
      ..writeByte(15)
      ..write(obj.uploadLimit)
      ..writeByte(1)
      ..write(obj.avatarUploadLimit)
      ..writeByte(2)
      ..write(obj.backgroundUploadLimit)
      ..writeByte(3)
      ..write(obj.bannerUploadLimit)
      ..writeByte(23)
      ..write(obj.descriptionLimit)
      ..writeByte(21)
      ..write(obj.chatLimit)
      ..writeByte(8)
      ..write(obj.pleroma)
      ..writeByte(18)
      ..write(obj.vapidPublicKey)
      ..writeByte(20)
      ..write(obj.backgroundImage)
      ..writeByte(4)
      ..write(obj.contactAccount)
      ..writeByte(17)
      ..write(obj.urls)
      ..writeByte(12)
      ..write(obj.stats)
      ..writeByte(14)
      ..write(obj.title)
      ..writeByte(11)
      ..write(obj.shortDescription)
      ..writeByte(22)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(13)
      ..write(obj.thumbnail)
      ..writeByte(6)
      ..write(obj.languages)
      ..writeByte(10)
      ..write(obj.registrations)
      ..writeByte(0)
      ..write(obj.approvalRequired)
      ..writeByte(24)
      ..write(obj.invitesEnabled)
      ..writeByte(16)
      ..write(obj.uri)
      ..writeByte(19)
      ..write(obj.versionString);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiInstanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiInstancePleromaPart _$$_PleromaApiInstancePleromaPartFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiInstancePleromaPart(
      metadata: json['metadata'] == null
          ? null
          : PleromaApiInstanceMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PleromaApiInstancePleromaPartToJson(
    _$_PleromaApiInstancePleromaPart instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('metadata', instance.metadata?.toJson());
  return val;
}

_$_PleromaApiInstance _$$_PleromaApiInstanceFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiInstance(
      approvalRequired: json['approval_required'] as bool?,
      avatarUploadLimit: json['avatar_upload_limit'] as int?,
      backgroundUploadLimit: json['background_upload_limit'] as int?,
      bannerUploadLimit: json['banner_upload_limit'] as int?,
      contactAccount: json['contact_account'] == null
          ? null
          : PleromaApiAccount.fromJson(
              json['contact_account'] as Map<String, dynamic>),
      email: json['email'] as String?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      maxTootChars:
          JsonParseHelper.intFromJsonOrNullOnError(json['max_toot_chars']),
      pleroma: json['pleroma'] == null
          ? null
          : PleromaApiInstancePleromaPart.fromJson(
              json['pleroma'] as Map<String, dynamic>),
      pollLimits: json['poll_limits'] == null
          ? null
          : PleromaApiInstancePollLimits.fromJson(
              json['poll_limits'] as Map<String, dynamic>),
      registrations: json['registrations'] as bool?,
      shortDescription: json['short_description'] as String?,
      stats: json['stats'] == null
          ? null
          : PleromaApiInstanceStats.fromJson(
              json['stats'] as Map<String, dynamic>),
      thumbnail: json['thumbnail'] as String?,
      title: json['title'] as String?,
      uploadLimit: json['upload_limit'] as int?,
      uri: json['uri'] as String,
      urls: json['urls'] == null
          ? null
          : PleromaApiInstanceUrls.fromJson(
              json['urls'] as Map<String, dynamic>),
      vapidPublicKey: json['vapid_public_key'] as String?,
      versionString: json['version'] as String,
      backgroundImage: json['background_image'] as String?,
      chatLimit: json['chat_limit'] as int?,
      description: json['description'] as String?,
      descriptionLimit: json['description_limit'] as int?,
      invitesEnabled: json['invites_enabled'] as bool?,
    );

Map<String, dynamic> _$$_PleromaApiInstanceToJson(
    _$_PleromaApiInstance instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('approval_required', instance.approvalRequired);
  writeNotNull('avatar_upload_limit', instance.avatarUploadLimit);
  writeNotNull('background_upload_limit', instance.backgroundUploadLimit);
  writeNotNull('banner_upload_limit', instance.bannerUploadLimit);
  writeNotNull('contact_account', instance.contactAccount?.toJson());
  writeNotNull('email', instance.email);
  writeNotNull('languages', instance.languages);
  writeNotNull('max_toot_chars', instance.maxTootChars);
  writeNotNull('pleroma', instance.pleroma?.toJson());
  writeNotNull('poll_limits', instance.pollLimits?.toJson());
  writeNotNull('registrations', instance.registrations);
  writeNotNull('short_description', instance.shortDescription);
  writeNotNull('stats', instance.stats?.toJson());
  writeNotNull('thumbnail', instance.thumbnail);
  writeNotNull('title', instance.title);
  writeNotNull('upload_limit', instance.uploadLimit);
  val['uri'] = instance.uri;
  writeNotNull('urls', instance.urls?.toJson());
  writeNotNull('vapid_public_key', instance.vapidPublicKey);
  val['version'] = instance.versionString;
  writeNotNull('background_image', instance.backgroundImage);
  writeNotNull('chat_limit', instance.chatLimit);
  writeNotNull('description', instance.description);
  writeNotNull('description_limit', instance.descriptionLimit);
  writeNotNull('invites_enabled', instance.invitesEnabled);
  return val;
}
