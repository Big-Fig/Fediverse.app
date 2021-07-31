// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_emoji_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MastodonApiEmoji _$MastodonApiEmojiFromJson(Map<String, dynamic> json) {
  return MastodonApiEmoji(
    shortcode: json['shortcode'] as String?,
    url: json['url'] as String?,
    staticUrl: json['static_url'] as String?,
    visibleInPicker: json['visible_in_picker'] as bool?,
    category: json['category'] as String?,
  );
}

Map<String, dynamic> _$MastodonApiEmojiToJson(MastodonApiEmoji instance) =>
    <String, dynamic>{
      'shortcode': instance.shortcode,
      'url': instance.url,
      'static_url': instance.staticUrl,
      'visible_in_picker': instance.visibleInPicker,
      'category': instance.category,
    };
