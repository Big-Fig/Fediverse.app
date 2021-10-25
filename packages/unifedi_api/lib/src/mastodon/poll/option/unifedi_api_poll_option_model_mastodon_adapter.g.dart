// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_poll_option_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiPollOptionMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiPollOptionMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiPollOptionMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiPollOptionMastodonAdapter(
      fields[0] as MastodonApiPollOption,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiPollOptionMastodonAdapter obj) {
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
      other is UnifediApiPollOptionMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiPollOptionMastodonAdapter
    _$$_UnifediApiPollOptionMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiPollOptionMastodonAdapter(
          MastodonApiPollOption.fromJson(json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiPollOptionMastodonAdapterToJson(
        _$_UnifediApiPollOptionMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
