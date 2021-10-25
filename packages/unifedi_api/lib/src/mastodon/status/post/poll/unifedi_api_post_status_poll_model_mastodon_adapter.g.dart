// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_post_status_poll_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiPostStatusPollMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiPostStatusPollMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiPostStatusPollMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiPostStatusPollMastodonAdapter(
      fields[0] as MastodonApiPostStatusPoll,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiPostStatusPollMastodonAdapter obj) {
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
      other is UnifediApiPostStatusPollMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiPostStatusPollMastodonAdapter
    _$$_UnifediApiPostStatusPollMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiPostStatusPollMastodonAdapter(
          MastodonApiPostStatusPoll.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiPostStatusPollMastodonAdapterToJson(
        _$_UnifediApiPostStatusPollMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
