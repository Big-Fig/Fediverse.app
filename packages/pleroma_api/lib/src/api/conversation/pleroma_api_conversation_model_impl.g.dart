// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_conversation_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiConversationPleromaPartAdapter
    extends TypeAdapter<PleromaApiConversationPleromaPart> {
  @override
  final int typeId = 0;

  @override
  PleromaApiConversationPleromaPart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiConversationPleromaPart(
      recipients: (fields[0] as List?)?.cast<PleromaApiAccount>(),
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiConversationPleromaPart obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.recipients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiConversationPleromaPartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaApiConversationAdapter
    extends TypeAdapter<PleromaApiConversation> {
  @override
  final int typeId = 0;

  @override
  PleromaApiConversation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiConversation(
      unread: fields[0] as bool?,
      lastStatus: fields[1] as PleromaApiStatus?,
      id: fields[2] as String,
      accounts: (fields[3] as List).cast<PleromaApiAccount>(),
      pleroma: fields[4] as PleromaApiConversationPleromaPart?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiConversation obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.lastStatus)
      ..writeByte(3)
      ..write(obj.accounts)
      ..writeByte(4)
      ..write(obj.pleroma)
      ..writeByte(0)
      ..write(obj.unread)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiConversationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiConversationPleromaPart
    _$$_PleromaApiConversationPleromaPartFromJson(Map<String, dynamic> json) =>
        _$_PleromaApiConversationPleromaPart(
          recipients: (json['recipients'] as List<dynamic>?)
              ?.map(
                  (e) => PleromaApiAccount.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$_PleromaApiConversationPleromaPartToJson(
    _$_PleromaApiConversationPleromaPart instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'recipients', instance.recipients?.map((e) => e.toJson()).toList());
  return val;
}

_$_PleromaApiConversation _$$_PleromaApiConversationFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiConversation(
      unread: json['unread'] as bool?,
      lastStatus: json['last_status'] == null
          ? null
          : PleromaApiStatus.fromJson(
              json['last_status'] as Map<String, dynamic>),
      id: json['id'] as String,
      accounts: (json['accounts'] as List<dynamic>)
          .map((e) => PleromaApiAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
      pleroma: json['pleroma'] == null
          ? null
          : PleromaApiConversationPleromaPart.fromJson(
              json['pleroma'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PleromaApiConversationToJson(
    _$_PleromaApiConversation instance) {
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
  writeNotNull('pleroma', instance.pleroma?.toJson());
  return val;
}
