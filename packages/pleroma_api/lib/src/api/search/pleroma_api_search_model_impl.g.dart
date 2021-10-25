// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_search_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiSearchResultAdapter
    extends TypeAdapter<PleromaApiSearchResult> {
  @override
  final int typeId = 0;

  @override
  PleromaApiSearchResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiSearchResult(
      accounts: (fields[0] as List).cast<PleromaApiAccount>(),
      hashtags: (fields[1] as List).cast<PleromaApiTag>(),
      statuses: (fields[2] as List).cast<PleromaApiStatus>(),
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiSearchResult obj) {
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
      other is PleromaApiSearchResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiSearchResult _$$_PleromaApiSearchResultFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiSearchResult(
      accounts: (json['accounts'] as List<dynamic>)
          .map((e) => PleromaApiAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
      hashtags: (json['hashtags'] as List<dynamic>)
          .map((e) => PleromaApiTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      statuses: (json['statuses'] as List<dynamic>)
          .map((e) => PleromaApiStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PleromaApiSearchResultToJson(
        _$_PleromaApiSearchResult instance) =>
    <String, dynamic>{
      'accounts': instance.accounts.map((e) => e.toJson()).toList(),
      'hashtags': instance.hashtags.map((e) => e.toJson()).toList(),
      'statuses': instance.statuses.map((e) => e.toJson()).toList(),
    };
