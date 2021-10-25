// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_conversation_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiConversationAdapter
    extends TypeAdapter<UnifediApiConversation> {
  @override
  final int typeId = 0;

  @override
  UnifediApiConversation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiConversation(
      unread: fields[0] as bool?,
      lastStatus: fields[1] as UnifediApiStatus?,
      id: fields[2] as String,
      accounts: (fields[3] as List).cast<UnifediApiAccount>(),
      recipients: (fields[4] as List?)?.cast<UnifediApiAccount>(),
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiConversation obj) {
    writer
      ..writeByte(5)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(0)
      ..write(obj.unread)
      ..writeByte(1)
      ..write(obj.lastStatus)
      ..writeByte(3)
      ..write(obj.accounts)
      ..writeByte(4)
      ..write(obj.recipients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiConversationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiConversation _$$_UnifediApiConversationFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiConversation(
      unread: json['unread'] as bool?,
      lastStatus: json['last_status'] == null
          ? null
          : UnifediApiStatus.fromJson(
              json['last_status'] as Map<String, dynamic>),
      id: json['id'] as String,
      accounts: (json['accounts'] as List<dynamic>)
          .map((e) => UnifediApiAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
      recipients: (json['recipients'] as List<dynamic>?)
          ?.map((e) => UnifediApiAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UnifediApiConversationToJson(
    _$_UnifediApiConversation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('unread', instance.unread);
  writeNotNull('last_status', instance.lastStatus?.toJson());
  val['id'] = instance.id;
  val['accounts'] = instance.accounts.map((e) => e.toJson()).toList();
  writeNotNull(
      'recipients', instance.recipients?.map((e) => e.toJson()).toList());
  return val;
}
