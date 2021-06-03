// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApiContent _$PleromaApiContentFromJson(Map<String, dynamic> json) {
  return PleromaApiContent(
    textPlain: json['text/plain'] as String?,
  );
}

Map<String, dynamic> _$PleromaApiContentToJson(PleromaApiContent instance) =>
    <String, dynamic>{
      'text/plain': instance.textPlain,
    };
