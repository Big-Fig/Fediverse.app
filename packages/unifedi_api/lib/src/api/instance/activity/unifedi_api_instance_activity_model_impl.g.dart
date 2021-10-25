// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_activity_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceActivityAdapter
    extends TypeAdapter<UnifediApiInstanceActivity> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceActivity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceActivity(
      items: (fields[0] as List).cast<UnifediApiInstanceActivityItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiInstanceActivity obj) {
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
      other is UnifediApiInstanceActivityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceActivity _$$_UnifediApiInstanceActivityFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiInstanceActivity(
      items: (json['items'] as List<dynamic>)
          .map((e) => UnifediApiInstanceActivityItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UnifediApiInstanceActivityToJson(
        _$_UnifediApiInstanceActivity instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
