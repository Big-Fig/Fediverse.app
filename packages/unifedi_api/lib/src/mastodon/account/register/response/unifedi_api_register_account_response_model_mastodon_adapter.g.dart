// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_register_account_response_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiRegisterAccountResponseMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiRegisterAccountResponseMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiRegisterAccountResponseMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiRegisterAccountResponseMastodonAdapter(
      fields[0] as MastodonApiRegisterAccountResponse,
    );
  }

  @override
  void write(BinaryWriter writer,
      UnifediApiRegisterAccountResponseMastodonAdapter obj) {
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
      other is UnifediApiRegisterAccountResponseMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiRegisterAccountResponseMastodonAdapter
    _$$_UnifediApiRegisterAccountResponseMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiRegisterAccountResponseMastodonAdapter(
          MastodonApiRegisterAccountResponse.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiRegisterAccountResponseMastodonAdapterToJson(
        _$_UnifediApiRegisterAccountResponseMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
