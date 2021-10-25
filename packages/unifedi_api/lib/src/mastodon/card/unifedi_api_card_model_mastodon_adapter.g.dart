// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_card_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiCardMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiCardMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiCardMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiCardMastodonAdapter(
      fields[0] as MastodonApiCard,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiCardMastodonAdapter obj) {
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
      other is UnifediApiCardMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiCardMastodonAdapter _$$_UnifediApiCardMastodonAdapterFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiCardMastodonAdapter(
      MastodonApiCard.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiCardMastodonAdapterToJson(
        _$_UnifediApiCardMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
