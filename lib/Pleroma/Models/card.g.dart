// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) {
  return Card(
    url: json['url'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    type: json['type'] as String,
    authorName: json['author_name'] as String,
    authorUrl: json['authorUrl'] as String,
    providerName: json['provider_name'] as String,
    providerUrl: json['provider_url'] as String,
    html: json['html'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    image: json['image'] as String,
    embedUrl: json['embed_url'] as String,
  );
}

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'url': instance.url,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'author_name': instance.authorName,
      'authorUrl': instance.authorUrl,
      'provider_name': instance.providerName,
      'provider_url': instance.providerUrl,
      'html': instance.html,
      'width': instance.width,
      'height': instance.height,
      'image': instance.image,
      'embed_url': instance.embedUrl,
    };
