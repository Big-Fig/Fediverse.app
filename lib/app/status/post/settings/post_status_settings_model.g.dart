// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_status_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostStatusSettingsAdapter extends TypeAdapter<PostStatusSettings> {
  @override
  final int typeId = 52;

  @override
  PostStatusSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostStatusSettings(
      markMediaAsNsfwOnAttach: fields[0] as bool,
      defaultVisibilityString: fields[1] as String,
      defaultStatusLocale: fields[2] as LocalizationLocale?,
      dontUploadMediaDuringEditing: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PostStatusSettings obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.markMediaAsNsfwOnAttach)
      ..writeByte(1)
      ..write(obj.defaultVisibilityString)
      ..writeByte(2)
      ..write(obj.defaultStatusLocale)
      ..writeByte(3)
      ..write(obj.dontUploadMediaDuringEditing);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostStatusSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostStatusSettings _$PostStatusSettingsFromJson(Map<String, dynamic> json) {
  return PostStatusSettings(
    markMediaAsNsfwOnAttach: json['mark_media_as_nsfw_on_attach'] as bool,
    defaultVisibilityString: json['default_visibility'] as String,
    defaultStatusLocale: json['default_status_locale'] == null
        ? null
        : LocalizationLocale.fromJson(
            json['default_status_locale'] as Map<String, dynamic>),
    dontUploadMediaDuringEditing:
        json['dont_upload_media_during_editing_on_attach'] as bool,
  );
}

Map<String, dynamic> _$PostStatusSettingsToJson(PostStatusSettings instance) =>
    <String, dynamic>{
      'mark_media_as_nsfw_on_attach': instance.markMediaAsNsfwOnAttach,
      'default_visibility': instance.defaultVisibilityString,
      'default_status_locale': instance.defaultStatusLocale?.toJson(),
      'dont_upload_media_during_editing_on_attach':
          instance.dontUploadMediaDuringEditing,
    };
