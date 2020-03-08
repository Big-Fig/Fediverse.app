// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_account_edit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaAccountEdit _$PleromaAccountEditFromJson(Map<String, dynamic> json) {
  return PleromaAccountEdit(
    bot: json['bot'] as bool,
    discoverable: json['discoverable'] as bool,
    displayName: json['display_name'] as String,
    fieldsAttributes: (json['fields_attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k),
          e == null ? null : Field.fromJson(e as Map<String, dynamic>)),
    ),
    locked: json['locked'] as bool,
    note: json['note'] as String,
    source: json['source'] == null
        ? null
        : Source.fromJson(json['source'] as Map<String, dynamic>),
    actorType: json['actor_type'],
    allowFollowingMove: json['allow_following_move'] as bool,
    defaultScope: json['default_scope'] as String,
    hideFavorites: json['hide_favorites'] as bool,
    hideFollowers: json['hide_followers'] as bool,
    hideFollowersCount: json['hide_followers_count'] as bool,
    hideFollows: json['hide_follows'] as bool,
    hideFollowsCount: json['hide_follows_count'] as bool,
    noRichText: json['no_rich_text'] as bool,
    pleromaBackgroundImage: json['pleroma_background_image'] as String,
    pleromaSettingsStore:
        json['pleroma_settings_store'] as Map<String, dynamic>,
    showRole: json['show_role'] as bool,
    skipThreadContainment: json['skip_thread_containment'] as bool,
  );
}

Map<String, dynamic> _$PleromaAccountEditToJson(PleromaAccountEdit instance) =>
    <String, dynamic>{
      'bot': instance.bot,
      'discoverable': instance.discoverable,
      'display_name': instance.displayName,
      'fields_attributes': instance.fieldsAttributes
          ?.map((k, e) => MapEntry(k.toString(), e?.toJson())),
      'locked': instance.locked,
      'note': instance.note,
      'source': instance.source?.toJson(),
      'actor_type': instance.actorType,
      'allow_following_move': instance.allowFollowingMove,
      'default_scope': instance.defaultScope,
      'hide_favorites': instance.hideFavorites,
      'hide_followers': instance.hideFollowers,
      'hide_followers_count': instance.hideFollowersCount,
      'hide_follows': instance.hideFollows,
      'hide_follows_count': instance.hideFollowsCount,
      'no_rich_text': instance.noRichText,
      'pleroma_background_image': instance.pleromaBackgroundImage,
      'pleroma_settings_store': instance.pleromaSettingsStore,
      'show_role': instance.showRole,
      'skip_thread_containment': instance.skipThreadContainment,
    };
