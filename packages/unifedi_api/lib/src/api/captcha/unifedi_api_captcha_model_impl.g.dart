// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_captcha_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiCaptchaAdapter extends TypeAdapter<UnifediApiCaptcha> {
  @override
  final int typeId = 0;

  @override
  UnifediApiCaptcha read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiCaptcha(
      secondsValid: fields[1] as int?,
      token: fields[2] as String?,
      type: fields[3] as String,
      url: fields[4] as String?,
      answerData: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiCaptcha obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.secondsValid)
      ..writeByte(2)
      ..write(obj.token)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.answerData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiCaptchaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiCaptcha _$$_UnifediApiCaptchaFromJson(Map<String, dynamic> json) =>
    _$_UnifediApiCaptcha(
      secondsValid: json['seconds_valid'] as int?,
      token: json['token'] as String?,
      type: json['type'] as String,
      url: json['url'] as String?,
      answerData: json['answer_data'] as String?,
    );

Map<String, dynamic> _$$_UnifediApiCaptchaToJson(
    _$_UnifediApiCaptcha instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('seconds_valid', instance.secondsValid);
  writeNotNull('token', instance.token);
  val['type'] = instance.type;
  writeNotNull('url', instance.url);
  writeNotNull('answer_data', instance.answerData);
  return val;
}
