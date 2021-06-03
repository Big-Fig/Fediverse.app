// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_account_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaMyAccountWrapperAdapter
    extends TypeAdapter<PleromaMyAccountWrapper> {
  @override
  final int typeId = 21;

  @override
  PleromaMyAccountWrapper read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaMyAccountWrapper(
      pleromaAccount: fields[0] as PleromaApiMyAccount,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaMyAccountWrapper obj) {
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
      other is PleromaMyAccountWrapperAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaMyAccountWrapper _$PleromaMyAccountWrapperFromJson(
    Map<String, dynamic> json) {
  return PleromaMyAccountWrapper(
    pleromaAccount: PleromaApiMyAccount.fromJson(
        json['remote_account'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaMyAccountWrapperToJson(
        PleromaMyAccountWrapper instance) =>
    <String, dynamic>{
      'remote_account': instance.pleromaAccount.toJson(),
    };
