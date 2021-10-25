// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_register_account_response_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiRegisterAccountResponsePleromaAdapterAdapter
    extends TypeAdapter<UnifediApiRegisterAccountResponsePleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiRegisterAccountResponsePleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiRegisterAccountResponsePleromaAdapter(
      fields[0] as PleromaApiRegisterAccountResponse,
    );
  }

  @override
  void write(BinaryWriter writer,
      UnifediApiRegisterAccountResponsePleromaAdapter obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiRegisterAccountResponsePleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiRegisterAccountResponsePleromaAdapter
    _$$_UnifediApiRegisterAccountResponsePleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiRegisterAccountResponsePleromaAdapter(
          PleromaApiRegisterAccountResponse.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiRegisterAccountResponsePleromaAdapterToJson(
        _$_UnifediApiRegisterAccountResponsePleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
