// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_tag_history_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiTagHistoryAdapter extends TypeAdapter<UnifediApiTagHistory> {
  @override
  final int typeId = 0;

  @override
  UnifediApiTagHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiTagHistory(
      items: (fields[0] as List).cast<UnifediApiTagHistoryItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiTagHistory obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiTagHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiTagHistory _$$_UnifediApiTagHistoryFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiTagHistory(
      items: (json['items'] as List<dynamic>)
          .map((e) =>
              UnifediApiTagHistoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UnifediApiTagHistoryToJson(
        _$_UnifediApiTagHistory instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
