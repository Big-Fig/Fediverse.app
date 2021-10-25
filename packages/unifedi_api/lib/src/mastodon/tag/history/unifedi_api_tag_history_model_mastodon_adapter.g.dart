// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_tag_history_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiTagHistoryMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiTagHistoryMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiTagHistoryMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiTagHistoryMastodonAdapter(
      (fields[0] as List).cast<MastodonApiTagHistoryItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiTagHistoryMastodonAdapter obj) {
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
      other is UnifediApiTagHistoryMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UnifediApiTagHistoryItemMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiTagHistoryItemMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiTagHistoryItemMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiTagHistoryItemMastodonAdapter(
      fields[0] as MastodonApiTagHistoryItem,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiTagHistoryItemMastodonAdapter obj) {
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
      other is UnifediApiTagHistoryItemMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiTagHistoryMastodonAdapter
    _$$_UnifediApiTagHistoryMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiTagHistoryMastodonAdapter(
          (json['value'] as List<dynamic>)
              .map((e) =>
                  MastodonApiTagHistoryItem.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$_UnifediApiTagHistoryMastodonAdapterToJson(
        _$_UnifediApiTagHistoryMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.map((e) => e.toJson()).toList(),
    };

_$_UnifediApiTagHistoryItemMastodonAdapter
    _$$_UnifediApiTagHistoryItemMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiTagHistoryItemMastodonAdapter(
          MastodonApiTagHistoryItem.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiTagHistoryItemMastodonAdapterToJson(
        _$_UnifediApiTagHistoryItemMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
