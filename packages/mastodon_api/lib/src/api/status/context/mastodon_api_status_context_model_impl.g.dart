// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_status_context_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiStatusContextAdapter
    extends TypeAdapter<MastodonApiStatusContext> {
  @override
  final int typeId = 0;

  @override
  MastodonApiStatusContext read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiStatusContext(
      descendants: (fields[0] as List).cast<MastodonApiStatus>(),
      ancestors: (fields[1] as List).cast<MastodonApiStatus>(),
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiStatusContext obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.descendants)
      ..writeByte(1)
      ..write(obj.ancestors);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiStatusContextAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiStatusContext _$$_MastodonApiStatusContextFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiStatusContext(
      descendants: (json['descendants'] as List<dynamic>)
          .map((e) => MastodonApiStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      ancestors: (json['ancestors'] as List<dynamic>)
          .map((e) => MastodonApiStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MastodonApiStatusContextToJson(
        _$_MastodonApiStatusContext instance) =>
    <String, dynamic>{
      'descendants': instance.descendants.map((e) => e.toJson()).toList(),
      'ancestors': instance.ancestors.map((e) => e.toJson()).toList(),
    };
