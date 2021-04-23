// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaCard _$PleromaCardFromJson(Map<String, dynamic> json) {
  return PleromaCard(
    authorName: json['author_name'] as String?,
    authorUrl: json['author_url'] as String?,
    description: json['description'] as String?,
    embedUrl: json['embed_url'] as String?,
    height: json['height'] as int?,
    html: json['html'] as String?,
    image: json['image'] as String?,
    providerName: json['provider_name'] as String?,
    providerUrl: json['provider_url'] as String?,
    title: json['title'] as String?,
    type: _$enumDecodeNullable(_$MastodonApiCardTypeEnumMap, json['type']),
    url: json['url'] as String?,
    width: json['width'] as int?,
  );
}

Map<String, dynamic> _$PleromaCardToJson(PleromaCard instance) =>
    <String, dynamic>{
      'author_name': instance.authorName,
      'author_url': instance.authorUrl,
      'description': instance.description,
      'embed_url': instance.embedUrl,
      'height': instance.height,
      'html': instance.html,
      'image': instance.image,
      'provider_name': instance.providerName,
      'provider_url': instance.providerUrl,
      'title': instance.title,
      'type': _$MastodonApiCardTypeEnumMap[instance.type],
      'url': instance.url,
      'width': instance.width,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$MastodonApiCardTypeEnumMap = {
  MastodonApiCardType.link: 'link',
  MastodonApiCardType.photo: 'photo',
  MastodonApiCardType.video: 'video',
  MastodonApiCardType.rich: 'rich',
  MastodonApiCardType.unknown: 'unknown',
};
