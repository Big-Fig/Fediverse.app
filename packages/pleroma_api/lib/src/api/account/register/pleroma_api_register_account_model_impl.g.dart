// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_register_account_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiRegisterAccountAdapter
    extends TypeAdapter<PleromaApiRegisterAccount> {
  @override
  final int typeId = 0;

  @override
  PleromaApiRegisterAccount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiRegisterAccount(
      username: fields[1] as String,
      email: fields[2] as String,
      password: fields[3] as String,
      agreement: fields[4] as bool,
      locale: fields[5] as String,
      reason: fields[6] as String?,
      captchaToken: fields[7] as String?,
      captchaAnswerData: fields[8] as String?,
      captchaSolution: fields[9] as String?,
      fullName: fields[10] as String?,
      bio: fields[11] as String?,
      inviteToken: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiRegisterAccount obj) {
    writer
      ..writeByte(12)
      ..writeByte(7)
      ..write(obj.captchaToken)
      ..writeByte(8)
      ..write(obj.captchaAnswerData)
      ..writeByte(9)
      ..write(obj.captchaSolution)
      ..writeByte(10)
      ..write(obj.fullName)
      ..writeByte(11)
      ..write(obj.bio)
      ..writeByte(12)
      ..write(obj.inviteToken)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.agreement)
      ..writeByte(5)
      ..write(obj.locale)
      ..writeByte(6)
      ..write(obj.reason);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiRegisterAccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiRegisterAccount _$$_PleromaApiRegisterAccountFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiRegisterAccount(
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      agreement: json['agreement'] as bool,
      locale: json['locale'] as String,
      reason: json['reason'] as String?,
      captchaToken: json['captcha_token'] as String?,
      captchaAnswerData: json['captcha_answer_data'] as String?,
      captchaSolution: json['captcha_solution'] as String?,
      fullName: json['fullname'] as String?,
      bio: json['bio'] as String?,
      inviteToken: json['token'] as String?,
    );

Map<String, dynamic> _$$_PleromaApiRegisterAccountToJson(
    _$_PleromaApiRegisterAccount instance) {
  final val = <String, dynamic>{
    'username': instance.username,
    'email': instance.email,
    'password': instance.password,
    'agreement': instance.agreement,
    'locale': instance.locale,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reason', instance.reason);
  writeNotNull('captcha_token', instance.captchaToken);
  writeNotNull('captcha_answer_data', instance.captchaAnswerData);
  writeNotNull('captcha_solution', instance.captchaSolution);
  writeNotNull('fullname', instance.fullName);
  writeNotNull('bio', instance.bio);
  writeNotNull('token', instance.inviteToken);
  return val;
}
