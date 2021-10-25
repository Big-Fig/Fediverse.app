// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_status_context_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiStatusContextAdapter
    extends TypeAdapter<UnifediApiStatusContext> {
  @override
  final int typeId = 0;

  @override
  UnifediApiStatusContext read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiStatusContext(
      descendants: (fields[0] as List).cast<UnifediApiStatus>(),
      ancestors: (fields[1] as List).cast<UnifediApiStatus>(),
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiStatusContext obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.descendants)
      ..writeByte(1)
      ..write(obj.ancestors);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiStatusContextAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiStatusContext _$$_UnifediApiStatusContextFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiStatusContext(
      descendants: (json['descendants'] as List<dynamic>)
          .map((e) => UnifediApiStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      ancestors: (json['ancestors'] as List<dynamic>)
          .map((e) => UnifediApiStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UnifediApiStatusContextToJson(
        _$_UnifediApiStatusContext instance) =>
    <String, dynamic>{
      'descendants': instance.descendants.map((e) => e.toJson()).toList(),
      'ancestors': instance.ancestors.map((e) => e.toJson()).toList(),
    };
