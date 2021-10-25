// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_chat_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiChatAdapter extends TypeAdapter<UnifediApiChat> {
  @override
  final int typeId = 0;

  @override
  UnifediApiChat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiChat(
      id: fields[0] as String,
      unread: fields[1] as int,
      updatedAt: fields[2] as DateTime?,
      account: fields[3] as UnifediApiAccount,
      lastMessage: fields[4] as UnifediApiChatMessage?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiChat obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.unread)
      ..writeByte(2)
      ..write(obj.updatedAt)
      ..writeByte(3)
      ..write(obj.account)
      ..writeByte(4)
      ..write(obj.lastMessage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiChatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiChat _$$_UnifediApiChatFromJson(Map<String, dynamic> json) =>
    _$_UnifediApiChat(
      id: json['id'] as String,
      unread: json['unread'] as int,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      account:
          UnifediApiAccount.fromJson(json['account'] as Map<String, dynamic>),
      lastMessage: json['last_message'] == null
          ? null
          : UnifediApiChatMessage.fromJson(
              json['last_message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiChatToJson(_$_UnifediApiChat instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'unread': instance.unread,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  val['account'] = instance.account.toJson();
  writeNotNull('last_message', instance.lastMessage?.toJson());
  return val;
}
