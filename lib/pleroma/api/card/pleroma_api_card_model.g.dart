// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApiCard _$PleromaApiCardFromJson(Map<String, dynamic> json) {
  return PleromaApiCard(
    authorName: json['author_name'] as String?,
    authorUrl: json['author_url'] as String?,
    description: json['description'] as String?,
    embedUrl: json['embed_url'] as String?,
    height: PleromaApiCard.sizeFromJsonOrNullOnError(json['height']),
    html: json['html'] as String?,
    image: json['image'] as String?,
    providerName: json['provider_name'] as String?,
    providerUrl: json['provider_url'] as String?,
    title: json['title'] as String?,
    type: json['type'] as String?,
    url: json['url'] as String?,
    width: PleromaApiCard.sizeFromJsonOrNullOnError(json['width']),
  );
}

Map<String, dynamic> _$PleromaApiCardToJson(PleromaApiCard instance) =>
    <String, dynamic>{
      'author_name': instance.authorName,
      'author_url': instance.authorUrl,
      'description': instance.description,
      'embed_url': instance.embedUrl,
      'height': instance.height,
      'width': instance.width,
      'html': instance.html,
      'image': instance.image,
      'provider_name': instance.providerName,
      'provider_url': instance.providerUrl,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };
