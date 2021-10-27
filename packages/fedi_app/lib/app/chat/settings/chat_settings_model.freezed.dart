// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatSettings _$ChatSettingsFromJson(Map<String, dynamic> json) {
  return _ChatSettings.fromJson(json);
}

/// @nodoc
class _$ChatSettingsTearOff {
  const _$ChatSettingsTearOff();

  _ChatSettings call(
      {@HiveField(0)
      @JsonKey(name: 'replace_conversations_with_unifedi_chats')
          required bool replaceConversationsWithUnifediChats,
      @HiveField(1)
      @JsonKey(name: 'count_conversations_in_chats_unread_badges')
          required bool countConversationsInChatsUnreadBadges}) {
    return _ChatSettings(
      replaceConversationsWithUnifediChats:
          replaceConversationsWithUnifediChats,
      countConversationsInChatsUnreadBadges:
          countConversationsInChatsUnreadBadges,
    );
  }

  ChatSettings fromJson(Map<String, Object?> json) {
    return ChatSettings.fromJson(json);
  }
}

/// @nodoc
const $ChatSettings = _$ChatSettingsTearOff();

/// @nodoc
mixin _$ChatSettings {
  @HiveField(0)
  @JsonKey(name: 'replace_conversations_with_unifedi_chats')
  bool get replaceConversationsWithUnifediChats =>
      throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'count_conversations_in_chats_unread_badges')
  bool get countConversationsInChatsUnreadBadges =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatSettingsCopyWith<ChatSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatSettingsCopyWith<$Res> {
  factory $ChatSettingsCopyWith(
          ChatSettings value, $Res Function(ChatSettings) then) =
      _$ChatSettingsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'replace_conversations_with_unifedi_chats')
          bool replaceConversationsWithUnifediChats,
      @HiveField(1)
      @JsonKey(name: 'count_conversations_in_chats_unread_badges')
          bool countConversationsInChatsUnreadBadges});
}

/// @nodoc
class _$ChatSettingsCopyWithImpl<$Res> implements $ChatSettingsCopyWith<$Res> {
  _$ChatSettingsCopyWithImpl(this._value, this._then);

  final ChatSettings _value;
  // ignore: unused_field
  final $Res Function(ChatSettings) _then;

  @override
  $Res call({
    Object? replaceConversationsWithUnifediChats = freezed,
    Object? countConversationsInChatsUnreadBadges = freezed,
  }) {
    return _then(_value.copyWith(
      replaceConversationsWithUnifediChats: replaceConversationsWithUnifediChats ==
              freezed
          ? _value.replaceConversationsWithUnifediChats
          : replaceConversationsWithUnifediChats // ignore: cast_nullable_to_non_nullable
              as bool,
      countConversationsInChatsUnreadBadges:
          countConversationsInChatsUnreadBadges == freezed
              ? _value.countConversationsInChatsUnreadBadges
              : countConversationsInChatsUnreadBadges // ignore: cast_nullable_to_non_nullable
                  as bool,
    ));
  }
}

/// @nodoc
abstract class _$ChatSettingsCopyWith<$Res>
    implements $ChatSettingsCopyWith<$Res> {
  factory _$ChatSettingsCopyWith(
          _ChatSettings value, $Res Function(_ChatSettings) then) =
      __$ChatSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'replace_conversations_with_unifedi_chats')
          bool replaceConversationsWithUnifediChats,
      @HiveField(1)
      @JsonKey(name: 'count_conversations_in_chats_unread_badges')
          bool countConversationsInChatsUnreadBadges});
}

/// @nodoc
class __$ChatSettingsCopyWithImpl<$Res> extends _$ChatSettingsCopyWithImpl<$Res>
    implements _$ChatSettingsCopyWith<$Res> {
  __$ChatSettingsCopyWithImpl(
      _ChatSettings _value, $Res Function(_ChatSettings) _then)
      : super(_value, (v) => _then(v as _ChatSettings));

  @override
  _ChatSettings get _value => super._value as _ChatSettings;

  @override
  $Res call({
    Object? replaceConversationsWithUnifediChats = freezed,
    Object? countConversationsInChatsUnreadBadges = freezed,
  }) {
    return _then(_ChatSettings(
      replaceConversationsWithUnifediChats: replaceConversationsWithUnifediChats ==
              freezed
          ? _value.replaceConversationsWithUnifediChats
          : replaceConversationsWithUnifediChats // ignore: cast_nullable_to_non_nullable
              as bool,
      countConversationsInChatsUnreadBadges:
          countConversationsInChatsUnreadBadges == freezed
              ? _value.countConversationsInChatsUnreadBadges
              : countConversationsInChatsUnreadBadges // ignore: cast_nullable_to_non_nullable
                  as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatSettings extends _ChatSettings {
  const _$_ChatSettings(
      {@HiveField(0)
      @JsonKey(name: 'replace_conversations_with_unifedi_chats')
          required this.replaceConversationsWithUnifediChats,
      @HiveField(1)
      @JsonKey(name: 'count_conversations_in_chats_unread_badges')
          required this.countConversationsInChatsUnreadBadges})
      : super._();

  factory _$_ChatSettings.fromJson(Map<String, dynamic> json) =>
      _$$_ChatSettingsFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'replace_conversations_with_unifedi_chats')
  final bool replaceConversationsWithUnifediChats;
  @override
  @HiveField(1)
  @JsonKey(name: 'count_conversations_in_chats_unread_badges')
  final bool countConversationsInChatsUnreadBadges;

  @override
  String toString() {
    return 'ChatSettings(replaceConversationsWithUnifediChats: $replaceConversationsWithUnifediChats, countConversationsInChatsUnreadBadges: $countConversationsInChatsUnreadBadges)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatSettings &&
            (identical(other.replaceConversationsWithUnifediChats,
                    replaceConversationsWithUnifediChats) ||
                other.replaceConversationsWithUnifediChats ==
                    replaceConversationsWithUnifediChats) &&
            (identical(other.countConversationsInChatsUnreadBadges,
                    countConversationsInChatsUnreadBadges) ||
                other.countConversationsInChatsUnreadBadges ==
                    countConversationsInChatsUnreadBadges));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      replaceConversationsWithUnifediChats,
      countConversationsInChatsUnreadBadges);

  @JsonKey(ignore: true)
  @override
  _$ChatSettingsCopyWith<_ChatSettings> get copyWith =>
      __$ChatSettingsCopyWithImpl<_ChatSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatSettingsToJson(this);
  }
}

abstract class _ChatSettings extends ChatSettings {
  const factory _ChatSettings(
          {@HiveField(0)
          @JsonKey(name: 'replace_conversations_with_unifedi_chats')
              required bool replaceConversationsWithUnifediChats,
          @HiveField(1)
          @JsonKey(name: 'count_conversations_in_chats_unread_badges')
              required bool countConversationsInChatsUnreadBadges}) =
      _$_ChatSettings;
  const _ChatSettings._() : super._();

  factory _ChatSettings.fromJson(Map<String, dynamic> json) =
      _$_ChatSettings.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'replace_conversations_with_unifedi_chats')
  bool get replaceConversationsWithUnifediChats;
  @override
  @HiveField(1)
  @JsonKey(name: 'count_conversations_in_chats_unread_badges')
  bool get countConversationsInChatsUnreadBadges;
  @override
  @JsonKey(ignore: true)
  _$ChatSettingsCopyWith<_ChatSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
