// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_captcha_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiCaptchaPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiCaptchaPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiCaptchaPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiCaptchaPleromaAdapter(
      fields[0] as PleromaApiCaptcha,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiCaptchaPleromaAdapter obj) {
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
      other is UnifediApiCaptchaPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiCaptchaPleromaAdapter _$$_UnifediApiCaptchaPleromaAdapterFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiCaptchaPleromaAdapter(
      PleromaApiCaptcha.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiCaptchaPleromaAdapterToJson(
        _$_UnifediApiCaptchaPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
