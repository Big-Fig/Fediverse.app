// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_chat_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiChatAdapter extends TypeAdapter<PleromaApiChat> {
  @override
  final int typeId = 0;

  @override
  PleromaApiChat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiChat(
      id: fields[0] as String,
      unread: fields[1] as int,
      updatedAt: fields[2] as DateTime?,
      account: fields[3] as PleromaApiAccount,
      lastMessage: fields[4] as PleromaApiChatMessage?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiChat obj) {
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
      other is PleromaApiChatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiChat _$$_PleromaApiChatFromJson(Map<String, dynamic> json) =>
    _$_PleromaApiChat(
      id: json['id'] as String,
      unread: json['unread'] as int,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      account:
          PleromaApiAccount.fromJson(json['account'] as Map<String, dynamic>),
      lastMessage: json['last_message'] == null
          ? null
          : PleromaApiChatMessage.fromJson(
              json['last_message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PleromaApiChatToJson(_$_PleromaApiChat instance) {
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
