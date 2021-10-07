// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_account_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiMyAccountWrapperAdapter
    extends TypeAdapter<UnifediApiMyAccountWrapper> {
  @override
  final int typeId = 82;

  @override
  UnifediApiMyAccountWrapper read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiMyAccountWrapper(
      unifediApiAccount: fields[0] as UnifediApiMyAccount,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiMyAccountWrapper obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.unifediApiAccount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiMyAccountWrapperAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiMyAccountWrapper _$$_UnifediApiMyAccountWrapperFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiMyAccountWrapper(
      unifediApiAccount: UnifediApiMyAccount.fromJson(
          json['remote_account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiMyAccountWrapperToJson(
        _$_UnifediApiMyAccountWrapper instance) =>
    <String, dynamic>{
      'remote_account': instance.unifediApiAccount.toJson(),
    };
