// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_mention_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiMentionMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiMentionMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiMentionMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiMentionMastodonAdapter(
      fields[0] as MastodonApiMention,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiMentionMastodonAdapter obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiMentionMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiMentionMastodonAdapter
    _$$_UnifediApiMentionMastodonAdapterFromJson(Map<String, dynamic> json) =>
        _$_UnifediApiMentionMastodonAdapter(
          MastodonApiMention.fromJson(json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiMentionMastodonAdapterToJson(
        _$_UnifediApiMentionMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
