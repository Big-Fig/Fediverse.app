// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_conversation_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiConversationAdapter
    extends TypeAdapter<MastodonApiConversation> {
  @override
  final int typeId = 0;

  @override
  MastodonApiConversation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiConversation(
      unread: fields[0] as bool?,
      lastStatus: fields[1] as MastodonApiStatus?,
      id: fields[2] as String,
      accounts: (fields[3] as List).cast<MastodonApiAccount>(),
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiConversation obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.unread)
      ..writeByte(1)
      ..write(obj.lastStatus)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.accounts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiConversationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiConversation _$$_MastodonApiConversationFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiConversation(
      unread: json['unread'] as bool?,
      lastStatus: json['last_status'] == null
          ? null
          : MastodonApiStatus.fromJson(
              json['last_status'] as Map<String, dynamic>),
      id: json['id'] as String,
      accounts: (json['accounts'] as List<dynamic>)
          .map((e) => MastodonApiAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MastodonApiConversationToJson(
    _$_MastodonApiConversation instance) {
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
  return val;
}
