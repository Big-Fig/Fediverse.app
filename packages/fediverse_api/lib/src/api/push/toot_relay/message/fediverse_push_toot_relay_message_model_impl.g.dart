// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fediverse_push_toot_relay_message_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FediversePushTootRelayMessageAdapter
    extends TypeAdapter<FediversePushTootRelayMessage> {
  @override
  final int typeId = 0;

  @override
  FediversePushTootRelayMessage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FediversePushTootRelayMessage(
      cryptoKey: fields[0] as String,
      salt: fields[1] as String,
      payload: fields[2] as String,
      account: fields[3] as String,
      server: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FediversePushTootRelayMessage obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.cryptoKey)
      ..writeByte(1)
      ..write(obj.salt)
      ..writeByte(2)
      ..write(obj.payload)
      ..writeByte(3)
      ..write(obj.account)
      ..writeByte(4)
      ..write(obj.server);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FediversePushTootRelayMessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FediversePushTootRelayMessage _$$_FediversePushTootRelayMessageFromJson(
        Map<String, dynamic> json) =>
    _$_FediversePushTootRelayMessage(
      cryptoKey: json['crypto_key'] as String,
      salt: json['salt'] as String,
      payload: json['payload'] as String,
      account: json['account'] as String,
      server: json['server'] as String,
    );

Map<String, dynamic> _$$_FediversePushTootRelayMessageToJson(
        _$_FediversePushTootRelayMessage instance) =>
    <String, dynamic>{
      'crypto_key': instance.cryptoKey,
      'salt': instance.salt,
      'payload': instance.payload,
      'account': instance.account,
      'server': instance.server,
    };
