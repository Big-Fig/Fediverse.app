// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_edit_my_account_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiEditMyAccountAdapter
    extends TypeAdapter<PleromaApiEditMyAccount> {
  @override
  final int typeId = 0;

  @override
  PleromaApiEditMyAccount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiEditMyAccount(
      fieldsAttributes: (fields[1] as List?)?.cast<PleromaApiField>(),
      discoverable: fields[2] as bool?,
      bot: fields[3] as bool?,
      displayName: fields[4] as String?,
      note: fields[5] as String?,
      locked: fields[6] as bool?,
      privacy: fields[7] as String?,
      sensitive: fields[8] as bool?,
      language: fields[9] as String?,
      avatarLocalFilePath: fields[10] as String?,
      deleteAvatar: fields[11] as bool?,
      headerLocalFilePath: fields[12] as String?,
      deleteHeader: fields[13] as bool?,
      noRichText: fields[14] as bool?,
      hideFollowers: fields[15] as bool?,
      hideFollows: fields[16] as bool?,
      hideFollowersCount: fields[17] as bool?,
      hideFollowsCount: fields[18] as bool?,
      hideFavorites: fields[19] as bool?,
      showRole: fields[20] as bool?,
      defaultScope: fields[21] as String?,
      pleromaSettingsStore: (fields[22] as Map?)?.cast<String, dynamic>(),
      skipThreadContainment: fields[23] as bool?,
      allowFollowingMove: fields[24] as bool?,
      acceptsChatMessages: fields[25] as bool?,
      alsoKnownAs: (fields[26] as List?)?.cast<String>(),
      pleromaBackgroundImageLocalFilePath: fields[27] as String?,
      deletePleromaBackgroundImage: fields[28] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiEditMyAccount obj) {
    writer
      ..writeByte(28)
      ..writeByte(14)
      ..write(obj.noRichText)
      ..writeByte(15)
      ..write(obj.hideFollowers)
      ..writeByte(16)
      ..write(obj.hideFollows)
      ..writeByte(17)
      ..write(obj.hideFollowersCount)
      ..writeByte(18)
      ..write(obj.hideFollowsCount)
      ..writeByte(19)
      ..write(obj.hideFavorites)
      ..writeByte(20)
      ..write(obj.showRole)
      ..writeByte(21)
      ..write(obj.defaultScope)
      ..writeByte(22)
      ..write(obj.pleromaSettingsStore)
      ..writeByte(23)
      ..write(obj.skipThreadContainment)
      ..writeByte(24)
      ..write(obj.allowFollowingMove)
      ..writeByte(25)
      ..write(obj.acceptsChatMessages)
      ..writeByte(26)
      ..write(obj.alsoKnownAs)
      ..writeByte(27)
      ..write(obj.pleromaBackgroundImageLocalFilePath)
      ..writeByte(28)
      ..write(obj.deletePleromaBackgroundImage)
      ..writeByte(1)
      ..write(obj.fieldsAttributes)
      ..writeByte(2)
      ..write(obj.discoverable)
      ..writeByte(3)
      ..write(obj.bot)
      ..writeByte(4)
      ..write(obj.displayName)
      ..writeByte(5)
      ..write(obj.note)
      ..writeByte(6)
      ..write(obj.locked)
      ..writeByte(7)
      ..write(obj.privacy)
      ..writeByte(8)
      ..write(obj.sensitive)
      ..writeByte(9)
      ..write(obj.language)
      ..writeByte(10)
      ..write(obj.avatarLocalFilePath)
      ..writeByte(11)
      ..write(obj.deleteAvatar)
      ..writeByte(12)
      ..write(obj.headerLocalFilePath)
      ..writeByte(13)
      ..write(obj.deleteHeader);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiEditMyAccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiEditMyAccount _$$_PleromaApiEditMyAccountFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiEditMyAccount(
      fieldsAttributes: (json['fields_attributes'] as List<dynamic>?)
          ?.map((e) => PleromaApiField.fromJson(e as Map<String, dynamic>))
          .toList(),
      discoverable: json['discoverable'] as bool?,
      bot: json['bot'] as bool?,
      displayName: json['display_name'] as String?,
      note: json['note'] as String?,
      locked: json['locked'] as bool?,
      privacy: json['privacy'] as String?,
      sensitive: json['sensitive'] as bool?,
      language: json['language'] as String?,
      avatarLocalFilePath: json['avatar_local_file_path'] as String?,
      deleteAvatar: json['delete_avatar'] as bool?,
      headerLocalFilePath: json['header_local_file_path'] as String?,
      deleteHeader: json['delete_header'] as bool?,
      noRichText: json['no_rich_text'] as bool?,
      hideFollowers: json['hide_followers'] as bool?,
      hideFollows: json['hide_follows'] as bool?,
      hideFollowersCount: json['hide_followers_count'] as bool?,
      hideFollowsCount: json['hide_follows_count'] as bool?,
      hideFavorites: json['hide_favorites'] as bool?,
      showRole: json['show_role'] as bool?,
      defaultScope: json['default_scope'] as String?,
      pleromaSettingsStore:
          json['pleroma_settings_store'] as Map<String, dynamic>?,
      skipThreadContainment: json['skip_thread_containment'] as bool?,
      allowFollowingMove: json['allow_following_move'] as bool?,
      acceptsChatMessages: json['accepts_chat_messages'] as bool?,
      alsoKnownAs: (json['also_known_as'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      pleromaBackgroundImageLocalFilePath:
          json['pleroma_background_image_local_file_path'] as String?,
      deletePleromaBackgroundImage:
          json['delete_pleroma_background_image'] as bool?,
    );

Map<String, dynamic> _$$_PleromaApiEditMyAccountToJson(
    _$_PleromaApiEditMyAccount instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fields_attributes',
      instance.fieldsAttributes?.map((e) => e.toJson()).toList());
  writeNotNull('discoverable', instance.discoverable);
  writeNotNull('bot', instance.bot);
  writeNotNull('display_name', instance.displayName);
  writeNotNull('note', instance.note);
  writeNotNull('locked', instance.locked);
  writeNotNull('privacy', instance.privacy);
  writeNotNull('sensitive', instance.sensitive);
  writeNotNull('language', instance.language);
  writeNotNull('avatar_local_file_path', instance.avatarLocalFilePath);
  writeNotNull('delete_avatar', instance.deleteAvatar);
  writeNotNull('header_local_file_path', instance.headerLocalFilePath);
  writeNotNull('delete_header', instance.deleteHeader);
  writeNotNull('no_rich_text', instance.noRichText);
  writeNotNull('hide_followers', instance.hideFollowers);
  writeNotNull('hide_follows', instance.hideFollows);
  writeNotNull('hide_followers_count', instance.hideFollowersCount);
  writeNotNull('hide_follows_count', instance.hideFollowsCount);
  writeNotNull('hide_favorites', instance.hideFavorites);
  writeNotNull('show_role', instance.showRole);
  writeNotNull('default_scope', instance.defaultScope);
  writeNotNull('pleroma_settings_store', instance.pleromaSettingsStore);
  writeNotNull('skip_thread_containment', instance.skipThreadContainment);
  writeNotNull('allow_following_move', instance.allowFollowingMove);
  writeNotNull('accepts_chat_messages', instance.acceptsChatMessages);
  writeNotNull('also_known_as', instance.alsoKnownAs);
  writeNotNull('pleroma_background_image_local_file_path',
      instance.pleromaBackgroundImageLocalFilePath);
  writeNotNull(
      'delete_pleroma_background_image', instance.deletePleromaBackgroundImage);
  return val;
}
