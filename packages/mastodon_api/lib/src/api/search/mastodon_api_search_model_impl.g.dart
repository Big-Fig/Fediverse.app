// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_search_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiSearchResultAdapter
    extends TypeAdapter<MastodonApiSearchResult> {
  @override
  final int typeId = 0;

  @override
  MastodonApiSearchResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiSearchResult(
      accounts: (fields[0] as List).cast<MastodonApiAccount>(),
      hashtags: (fields[1] as List).cast<MastodonApiTag>(),
      statuses: (fields[2] as List).cast<MastodonApiStatus>(),
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiSearchResult obj) {
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
      other is MastodonApiSearchResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiSearchResult _$$_MastodonApiSearchResultFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiSearchResult(
      accounts: (json['accounts'] as List<dynamic>)
          .map((e) => MastodonApiAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
      hashtags: (json['hashtags'] as List<dynamic>)
          .map((e) => MastodonApiTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      statuses: (json['statuses'] as List<dynamic>)
          .map((e) => MastodonApiStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MastodonApiSearchResultToJson(
        _$_MastodonApiSearchResult instance) =>
    <String, dynamic>{
      'accounts': instance.accounts.map((e) => e.toJson()).toList(),
      'hashtags': instance.hashtags.map((e) => e.toJson()).toList(),
      'statuses': instance.statuses.map((e) => e.toJson()).toList(),
    };
