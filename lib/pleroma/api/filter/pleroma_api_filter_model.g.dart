// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_filter_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaFilterAdapter extends TypeAdapter<PleromaFilter> {
  @override
  final int typeId = 63;

  @override
  PleromaFilter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaFilter(
      context: (fields[0] as List).cast<String>(),
      phrase: fields[4] as String,
      expiresAt: fields[1] as DateTime?,
      id: fields[2] as String,
      irreversible: fields[3] as bool,
      wholeWord: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaFilter obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.context)
      ..writeByte(1)
      ..write(obj.expiresAt)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.irreversible)
      ..writeByte(4)
      ..write(obj.phrase)
      ..writeByte(5)
      ..write(obj.wholeWord);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaFilterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaFilter _$PleromaFilterFromJson(Map<String, dynamic> json) {
  return PleromaFilter(
    context:
        (json['context'] as List<dynamic>).map((e) => e as String).toList(),
    phrase: json['phrase'] as String,
    expiresAt: json['expires_at'] == null
        ? null
        : DateTime.parse(json['expires_at'] as String),
    id: json['id'] as String,
    irreversible: json['irreversible'] as bool,
    wholeWord: json['whole_word'] as bool,
  );
}

Map<String, dynamic> _$PleromaFilterToJson(PleromaFilter instance) {
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

PostPleromaFilter _$PostPleromaFilterFromJson(Map<String, dynamic> json) {
  return PostPleromaFilter(
    context:
        (json['context'] as List<dynamic>).map((e) => e as String).toList(),
    phrase: json['phrase'] as String,
    expiresInSeconds: json['expires_in'] as int?,
    irreversible: json['irreversible'] as bool,
    wholeWord: json['whole_word'] as bool,
  );
}

Map<String, dynamic> _$PostPleromaFilterToJson(PostPleromaFilter instance) {
  final val = <String, dynamic>{
    'context': instance.context,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('expires_in', instance.expiresInSeconds);
  val['irreversible'] = instance.irreversible;
  val['phrase'] = instance.phrase;
  val['whole_word'] = instance.wholeWord;
  return val;
}
