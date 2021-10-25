// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_search_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiSearchResultAdapter
    extends TypeAdapter<UnifediApiSearchResult> {
  @override
  final int typeId = 0;

  @override
  UnifediApiSearchResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiSearchResult(
      accounts: (fields[0] as List).cast<UnifediApiAccount>(),
      hashtags: (fields[1] as List).cast<UnifediApiTag>(),
      statuses: (fields[2] as List).cast<UnifediApiStatus>(),
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiSearchResult obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.accounts)
      ..writeByte(2)
      ..write(obj.statuses)
      ..writeByte(1)
      ..write(obj.hashtags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiSearchResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiSearchResult _$$_UnifediApiSearchResultFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiSearchResult(
      accounts: (json['accounts'] as List<dynamic>)
          .map((e) => UnifediApiAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
      hashtags: (json['hashtags'] as List<dynamic>)
          .map((e) => UnifediApiTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      statuses: (json['statuses'] as List<dynamic>)
          .map((e) => UnifediApiStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UnifediApiSearchResultToJson(
        _$_UnifediApiSearchResult instance) =>
    <String, dynamic>{
      'accounts': instance.accounts.map((e) => e.toJson()).toList(),
      'hashtags': instance.hashtags.map((e) => e.toJson()).toList(),
      'statuses': instance.statuses.map((e) => e.toJson()).toList(),
    };
