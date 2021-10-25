// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_status_context_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiStatusContextAdapter
    extends TypeAdapter<PleromaApiStatusContext> {
  @override
  final int typeId = 0;

  @override
  PleromaApiStatusContext read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiStatusContext(
      descendants: (fields[0] as List).cast<PleromaApiStatus>(),
      ancestors: (fields[1] as List).cast<PleromaApiStatus>(),
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiStatusContext obj) {
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
      other is PleromaApiStatusContextAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiStatusContext _$$_PleromaApiStatusContextFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiStatusContext(
      descendants: (json['descendants'] as List<dynamic>)
          .map((e) => PleromaApiStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      ancestors: (json['ancestors'] as List<dynamic>)
          .map((e) => PleromaApiStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PleromaApiStatusContextToJson(
        _$_PleromaApiStatusContext instance) =>
    <String, dynamic>{
      'descendants': instance.descendants.map((e) => e.toJson()).toList(),
      'ancestors': instance.ancestors.map((e) => e.toJson()).toList(),
    };
