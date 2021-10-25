// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_tag_history_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiTagHistoryPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiTagHistoryPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiTagHistoryPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiTagHistoryPleromaAdapter(
      (fields[0] as List).cast<PleromaApiTagHistoryItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiTagHistoryPleromaAdapter obj) {
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
      other is UnifediApiTagHistoryPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UnifediApiTagHistoryItemPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiTagHistoryItemPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiTagHistoryItemPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiTagHistoryItemPleromaAdapter(
      fields[0] as PleromaApiTagHistoryItem,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiTagHistoryItemPleromaAdapter obj) {
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
      other is UnifediApiTagHistoryItemPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiTagHistoryPleromaAdapter
    _$$_UnifediApiTagHistoryPleromaAdapterFromJson(Map<String, dynamic> json) =>
        _$_UnifediApiTagHistoryPleromaAdapter(
          (json['value'] as List<dynamic>)
              .map((e) =>
                  PleromaApiTagHistoryItem.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$_UnifediApiTagHistoryPleromaAdapterToJson(
        _$_UnifediApiTagHistoryPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.map((e) => e.toJson()).toList(),
    };

_$_UnifediApiTagHistoryItemPleromaAdapter
    _$$_UnifediApiTagHistoryItemPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiTagHistoryItemPleromaAdapter(
          PleromaApiTagHistoryItem.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiTagHistoryItemPleromaAdapterToJson(
        _$_UnifediApiTagHistoryItemPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
