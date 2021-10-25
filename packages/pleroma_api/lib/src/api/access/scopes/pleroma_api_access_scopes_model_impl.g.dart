// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_access_scopes_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiAccessScopesAdapter
    extends TypeAdapter<PleromaApiAccessScopes> {
  @override
  final int typeId = 0;

  @override
  PleromaApiAccessScopes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiAccessScopes(
      globalPermissions: (fields[0] as List).cast<String>(),
      targetPermissions: (fields[1] as List).cast<PleromaApiAccessScopesItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiAccessScopes obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.targetPermissions)
      ..writeByte(0)
      ..write(obj.globalPermissions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiAccessScopesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiAccessScopes _$$_PleromaApiAccessScopesFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiAccessScopes(
      globalPermissions: (json['globalPermissions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      targetPermissions: (json['targetPermissions'] as List<dynamic>)
          .map((e) =>
              PleromaApiAccessScopesItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PleromaApiAccessScopesToJson(
        _$_PleromaApiAccessScopes instance) =>
    <String, dynamic>{
      'globalPermissions': instance.globalPermissions,
      'targetPermissions':
          instance.targetPermissions.map((e) => e.toJson()).toList(),
    };
