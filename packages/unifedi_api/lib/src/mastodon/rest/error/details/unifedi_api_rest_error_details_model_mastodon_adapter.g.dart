// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_rest_error_details_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiRestErrorDetailsMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiRestErrorDetailsMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiRestErrorDetailsMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiRestErrorDetailsMastodonAdapter(
      fields[0] as MastodonApiRestErrorDetails,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiRestErrorDetailsMastodonAdapter obj) {
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
      other is UnifediApiRestErrorDetailsMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiRestErrorDetailsMastodonAdapter
    _$$_UnifediApiRestErrorDetailsMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiRestErrorDetailsMastodonAdapter(
          MastodonApiRestErrorDetails.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiRestErrorDetailsMastodonAdapterToJson(
        _$_UnifediApiRestErrorDetailsMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
