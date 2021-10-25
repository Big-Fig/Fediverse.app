// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_filter_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiFilterAdapter extends TypeAdapter<PleromaApiFilter> {
  @override
  final int typeId = 0;

  @override
  PleromaApiFilter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiFilter(
      context: (fields[0] as List).cast<String>(),
      expiresAt: fields[1] as DateTime?,
      id: fields[2] as String,
      irreversible: fields[3] as bool,
      phrase: fields[4] as String,
      wholeWord: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiFilter obj) {
    writer
      ..writeByte(6)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.expiresAt)
      ..writeByte(4)
      ..write(obj.phrase)
      ..writeByte(0)
      ..write(obj.context)
      ..writeByte(3)
      ..write(obj.irreversible)
      ..writeByte(5)
      ..write(obj.wholeWord);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiFilterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiFilter _$$_PleromaApiFilterFromJson(Map<String, dynamic> json) =>
    _$_PleromaApiFilter(
      context:
          (json['context'] as List<dynamic>).map((e) => e as String).toList(),
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
      id: json['id'] as String,
      irreversible: json['irreversible'] as bool,
      phrase: json['phrase'] as String,
      wholeWord: json['whole_word'] as bool,
    );

Map<String, dynamic> _$$_PleromaApiFilterToJson(_$_PleromaApiFilter instance) {
  final val = <String, dynamic>{
    'context': instance.context,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('expires_at', instance.expiresAt?.toIso8601String());
  val['id'] = instance.id;
  val['irreversible'] = instance.irreversible;
  val['phrase'] = instance.phrase;
  val['whole_word'] = instance.wholeWord;
  return val;
}
