// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fediverse_api_version_model_impl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FediverseApiVersion _$$_FediverseApiVersionFromJson(
        Map<String, dynamic> json) =>
    _$_FediverseApiVersion(
      major: json['major'] as int,
      minor: json['minor'] as int?,
      patch: json['patch'] as int?,
      buildNumber: json['buildNumber'] as int?,
      commit: json['commit'] as String?,
    );

Map<String, dynamic> _$$_FediverseApiVersionToJson(
    _$_FediverseApiVersion instance) {
  final val = <String, dynamic>{
    'major': instance.major,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('minor', instance.minor);
  writeNotNull('patch', instance.patch);
  writeNotNull('buildNumber', instance.buildNumber);
  writeNotNull('commit', instance.commit);
  return val;
}
