// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_account_relationship_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccountRelationshipAdapter
    extends TypeAdapter<UnifediApiAccountRelationship> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccountRelationship read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccountRelationship(
      blocking: fields[1] as bool?,
      domainBlocking: fields[2] as bool?,
      endorsed: fields[3] as bool?,
      followedBy: fields[4] as bool?,
      following: fields[5] as bool?,
      id: fields[6] as String?,
      muting: fields[7] as bool?,
      mutingNotifications: fields[8] as bool?,
      requested: fields[10] as bool?,
      showingReblogs: fields[11] as bool?,
      subscribing: fields[12] as bool?,
      blockedBy: fields[13] as bool?,
      note: fields[14] as String?,
      notifying: fields[15] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiAccountRelationship obj) {
    writer
      ..writeByte(14)
      ..writeByte(6)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.blocking)
      ..writeByte(13)
      ..write(obj.blockedBy)
      ..writeByte(2)
      ..write(obj.domainBlocking)
      ..writeByte(3)
      ..write(obj.endorsed)
      ..writeByte(4)
      ..write(obj.followedBy)
      ..writeByte(5)
      ..write(obj.following)
      ..writeByte(15)
      ..write(obj.notifying)
      ..writeByte(7)
      ..write(obj.muting)
      ..writeByte(8)
      ..write(obj.mutingNotifications)
      ..writeByte(10)
      ..write(obj.requested)
      ..writeByte(11)
      ..write(obj.showingReblogs)
      ..writeByte(12)
      ..write(obj.subscribing)
      ..writeByte(14)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiAccountRelationshipAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccountRelationship _$$_UnifediApiAccountRelationshipFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiAccountRelationship(
      blocking: json['blocking'] as bool?,
      domainBlocking: json['domain_blocking'] as bool?,
      endorsed: json['endorsed'] as bool?,
      followedBy: json['followed_by'] as bool?,
      following: json['following'] as bool?,
      id: json['id'] as String?,
      muting: json['muting'] as bool?,
      mutingNotifications: json['muting_notifications'] as bool?,
      requested: json['requested'] as bool?,
      showingReblogs: json['showing_reblogs'] as bool?,
      subscribing: json['subscribing'] as bool?,
      blockedBy: json['blocked_by'] as bool?,
      note: json['note'] as String?,
      notifying: json['notifying'] as bool?,
    );

Map<String, dynamic> _$$_UnifediApiAccountRelationshipToJson(
    _$_UnifediApiAccountRelationship instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('blocking', instance.blocking);
  writeNotNull('domain_blocking', instance.domainBlocking);
  writeNotNull('endorsed', instance.endorsed);
  writeNotNull('followed_by', instance.followedBy);
  writeNotNull('following', instance.following);
  writeNotNull('id', instance.id);
  writeNotNull('muting', instance.muting);
  writeNotNull('muting_notifications', instance.mutingNotifications);
  writeNotNull('requested', instance.requested);
  writeNotNull('showing_reblogs', instance.showingReblogs);
  writeNotNull('subscribing', instance.subscribing);
  writeNotNull('blocked_by', instance.blockedBy);
  writeNotNull('note', instance.note);
  writeNotNull('notifying', instance.notifying);
  return val;
}
