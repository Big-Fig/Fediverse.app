// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_account_old_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaMyAccountWrapperOldAdapter
    extends TypeAdapter<PleromaMyAccountWrapperOld> {
  @override
  final int typeId = 0;

  @override
  PleromaMyAccountWrapperOld read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaMyAccountWrapperOld(
      pleromaAccount: fields[0] as PleromaMyAccountWrapperOld,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaMyAccountWrapperOld obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.pleromaAccount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaMyAccountWrapperOldAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaMyAccountWrapperOld _$$_PleromaMyAccountWrapperOldFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaMyAccountWrapperOld(
      pleromaAccount: PleromaMyAccountWrapperOld.fromJson(
          json['remote_account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PleromaMyAccountWrapperOldToJson(
        _$_PleromaMyAccountWrapperOld instance) =>
    <String, dynamic>{
      'remote_account': instance.pleromaAccount.toJson(),
    };
