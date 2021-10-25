// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_post_filter_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiPostFilterAdapter extends TypeAdapter<MastodonApiPostFilter> {
  @override
  final int typeId = 0;

  @override
  MastodonApiPostFilter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiPostFilter(
      context: (fields[0] as List).cast<String>(),
      expiresIn: fields[1] as Duration?,
      irreversible: fields[3] as bool,
      phrase: fields[4] as String,
      wholeWord: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiPostFilter obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.expiresIn)
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
      other is MastodonApiPostFilterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiPostFilter _$$_MastodonApiPostFilterFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiPostFilter(
      context:
          (json['context'] as List<dynamic>).map((e) => e as String).toList(),
      expiresIn: json['expires_in'] == null
          ? null
          : Duration(microseconds: json['expires_in'] as int),
      irreversible: json['irreversible'] as bool,
      phrase: json['phrase'] as String,
      wholeWord: json['whole_word'] as bool,
    );

Map<String, dynamic> _$$_MastodonApiPostFilterToJson(
    _$_MastodonApiPostFilter instance) {
  final val = <String, dynamic>{
    'context': instance.context,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('expires_in', instance.expiresIn?.inMicroseconds);
  val['irreversible'] = instance.irreversible;
  val['phrase'] = instance.phrase;
  val['whole_word'] = instance.wholeWord;
  return val;
}
