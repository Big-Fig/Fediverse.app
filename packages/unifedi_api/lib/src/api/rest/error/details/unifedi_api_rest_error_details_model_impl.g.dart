// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_rest_error_details_model_impl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiRestErrorDetails _$$_UnifediApiRestErrorDetailsFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiRestErrorDetails(
      identifier: json['identifier'] as String?,
      message: json['message'] as String?,
      details: (json['details'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => UnifediApiRestErrorDetails.fromJson(
                    e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$$_UnifediApiRestErrorDetailsToJson(
    _$_UnifediApiRestErrorDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('identifier', instance.identifier);
  writeNotNull('message', instance.message);
  writeNotNull(
      'details',
      instance.details
          ?.map((k, e) => MapEntry(k, e.map((e) => e.toJson()).toList())));
  return val;
}
