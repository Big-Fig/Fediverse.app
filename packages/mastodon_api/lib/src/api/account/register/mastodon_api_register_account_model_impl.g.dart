// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_register_account_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiRegisterAccountAdapter
    extends TypeAdapter<MastodonApiRegisterAccount> {
  @override
  final int typeId = 0;

  @override
  MastodonApiRegisterAccount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiRegisterAccount(
      username: fields[1] as String,
      email: fields[2] as String,
      password: fields[3] as String,
      agreement: fields[4] as bool,
      locale: fields[5] as String,
      reason: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiRegisterAccount obj) {
    writer
      ..writeByte(6)
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
      other is MastodonApiRegisterAccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiRegisterAccount _$$_MastodonApiRegisterAccountFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiRegisterAccount(
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      agreement: json['agreement'] as bool,
      locale: json['locale'] as String,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$$_MastodonApiRegisterAccountToJson(
    _$_MastodonApiRegisterAccount instance) {
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
  return val;
}
