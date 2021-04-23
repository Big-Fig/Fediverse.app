// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaContent _$PleromaContentFromJson(Map<String, dynamic> json) {
  return PleromaContent(
    textPlain: json['text/plain'] as String?,
  );
}

Map<String, dynamic> _$PleromaContentToJson(PleromaContent instance) =>
    <String, dynamic>{
      'text/plain': instance.textPlain,
    };
