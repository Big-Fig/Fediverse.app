// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_my_account_notifications_settings_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiMyAccountNotificationsSettings
    _$UnifediApiMyAccountNotificationsSettingsFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiMyAccountNotificationsSettings.fromJson(json);
}

/// @nodoc
class _$UnifediApiMyAccountNotificationsSettingsTearOff {
  const _$UnifediApiMyAccountNotificationsSettingsTearOff();

  _UnifediApiMyAccountNotificationsSettings call(
      {@HiveField(0)
          required bool? followers,
      @HiveField(1)
          required bool? follows,
      @JsonKey(name: 'non_followers')
      @HiveField(2)
          required bool? nonFollowers,
      @JsonKey(name: 'non_follows')
      @HiveField(3)
          required bool? nonFollows,
      @JsonKey(name: 'block_from_strangers')
      @HiveField(4)
          required bool? blockFromStrangers,
      @JsonKey(name: 'hide_notification_contents')
      @HiveField(5)
          required bool? hideNotificationContents}) {
    return _UnifediApiMyAccountNotificationsSettings(
      followers: followers,
      follows: follows,
      nonFollowers: nonFollowers,
      nonFollows: nonFollows,
      blockFromStrangers: blockFromStrangers,
      hideNotificationContents: hideNotificationContents,
    );
  }

  UnifediApiMyAccountNotificationsSettings fromJson(Map<String, Object> json) {
    return UnifediApiMyAccountNotificationsSettings.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiMyAccountNotificationsSettings =
    _$UnifediApiMyAccountNotificationsSettingsTearOff();

/// @nodoc
mixin _$UnifediApiMyAccountNotificationsSettings {
  @HiveField(0)
  bool? get followers => throw _privateConstructorUsedError;
  @HiveField(1)
  bool? get follows => throw _privateConstructorUsedError;
  @JsonKey(name: 'non_followers')
  @HiveField(2)
  bool? get nonFollowers => throw _privateConstructorUsedError;
  @JsonKey(name: 'non_follows')
  @HiveField(3)
  bool? get nonFollows => throw _privateConstructorUsedError;
  @JsonKey(name: 'block_from_strangers')
  @HiveField(4)
  bool? get blockFromStrangers => throw _privateConstructorUsedError;
  @JsonKey(name: 'hide_notification_contents')
  @HiveField(5)
  bool? get hideNotificationContents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiMyAccountNotificationsSettingsCopyWith<
          UnifediApiMyAccountNotificationsSettings>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiMyAccountNotificationsSettingsCopyWith<$Res> {
  factory $UnifediApiMyAccountNotificationsSettingsCopyWith(
          UnifediApiMyAccountNotificationsSettings value,
          $Res Function(UnifediApiMyAccountNotificationsSettings) then) =
      _$UnifediApiMyAccountNotificationsSettingsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          bool? followers,
      @HiveField(1)
          bool? follows,
      @JsonKey(name: 'non_followers')
      @HiveField(2)
          bool? nonFollowers,
      @JsonKey(name: 'non_follows')
      @HiveField(3)
          bool? nonFollows,
      @JsonKey(name: 'block_from_strangers')
      @HiveField(4)
          bool? blockFromStrangers,
      @JsonKey(name: 'hide_notification_contents')
      @HiveField(5)
          bool? hideNotificationContents});
}

/// @nodoc
class _$UnifediApiMyAccountNotificationsSettingsCopyWithImpl<$Res>
    implements $UnifediApiMyAccountNotificationsSettingsCopyWith<$Res> {
  _$UnifediApiMyAccountNotificationsSettingsCopyWithImpl(
      this._value, this._then);

  final UnifediApiMyAccountNotificationsSettings _value;
  // ignore: unused_field
  final $Res Function(UnifediApiMyAccountNotificationsSettings) _then;

  @override
  $Res call({
    Object? followers = freezed,
    Object? follows = freezed,
    Object? nonFollowers = freezed,
    Object? nonFollows = freezed,
    Object? blockFromStrangers = freezed,
    Object? hideNotificationContents = freezed,
  }) {
    return _then(_value.copyWith(
      followers: followers == freezed
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as bool?,
      follows: follows == freezed
          ? _value.follows
          : follows // ignore: cast_nullable_to_non_nullable
              as bool?,
      nonFollowers: nonFollowers == freezed
          ? _value.nonFollowers
          : nonFollowers // ignore: cast_nullable_to_non_nullable
              as bool?,
      nonFollows: nonFollows == freezed
          ? _value.nonFollows
          : nonFollows // ignore: cast_nullable_to_non_nullable
              as bool?,
      blockFromStrangers: blockFromStrangers == freezed
          ? _value.blockFromStrangers
          : blockFromStrangers // ignore: cast_nullable_to_non_nullable
              as bool?,
      hideNotificationContents: hideNotificationContents == freezed
          ? _value.hideNotificationContents
          : hideNotificationContents // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiMyAccountNotificationsSettingsCopyWith<$Res>
    implements $UnifediApiMyAccountNotificationsSettingsCopyWith<$Res> {
  factory _$UnifediApiMyAccountNotificationsSettingsCopyWith(
          _UnifediApiMyAccountNotificationsSettings value,
          $Res Function(_UnifediApiMyAccountNotificationsSettings) then) =
      __$UnifediApiMyAccountNotificationsSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          bool? followers,
      @HiveField(1)
          bool? follows,
      @JsonKey(name: 'non_followers')
      @HiveField(2)
          bool? nonFollowers,
      @JsonKey(name: 'non_follows')
      @HiveField(3)
          bool? nonFollows,
      @JsonKey(name: 'block_from_strangers')
      @HiveField(4)
          bool? blockFromStrangers,
      @JsonKey(name: 'hide_notification_contents')
      @HiveField(5)
          bool? hideNotificationContents});
}

/// @nodoc
class __$UnifediApiMyAccountNotificationsSettingsCopyWithImpl<$Res>
    extends _$UnifediApiMyAccountNotificationsSettingsCopyWithImpl<$Res>
    implements _$UnifediApiMyAccountNotificationsSettingsCopyWith<$Res> {
  __$UnifediApiMyAccountNotificationsSettingsCopyWithImpl(
      _UnifediApiMyAccountNotificationsSettings _value,
      $Res Function(_UnifediApiMyAccountNotificationsSettings) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiMyAccountNotificationsSettings));

  @override
  _UnifediApiMyAccountNotificationsSettings get _value =>
      super._value as _UnifediApiMyAccountNotificationsSettings;

  @override
  $Res call({
    Object? followers = freezed,
    Object? follows = freezed,
    Object? nonFollowers = freezed,
    Object? nonFollows = freezed,
    Object? blockFromStrangers = freezed,
    Object? hideNotificationContents = freezed,
  }) {
    return _then(_UnifediApiMyAccountNotificationsSettings(
      followers: followers == freezed
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as bool?,
      follows: follows == freezed
          ? _value.follows
          : follows // ignore: cast_nullable_to_non_nullable
              as bool?,
      nonFollowers: nonFollowers == freezed
          ? _value.nonFollowers
          : nonFollowers // ignore: cast_nullable_to_non_nullable
              as bool?,
      nonFollows: nonFollows == freezed
          ? _value.nonFollows
          : nonFollows // ignore: cast_nullable_to_non_nullable
              as bool?,
      blockFromStrangers: blockFromStrangers == freezed
          ? _value.blockFromStrangers
          : blockFromStrangers // ignore: cast_nullable_to_non_nullable
              as bool?,
      hideNotificationContents: hideNotificationContents == freezed
          ? _value.hideNotificationContents
          : hideNotificationContents // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiMyAccountNotificationsSettings
    implements _UnifediApiMyAccountNotificationsSettings {
  const _$_UnifediApiMyAccountNotificationsSettings(
      {@HiveField(0)
          required this.followers,
      @HiveField(1)
          required this.follows,
      @JsonKey(name: 'non_followers')
      @HiveField(2)
          required this.nonFollowers,
      @JsonKey(name: 'non_follows')
      @HiveField(3)
          required this.nonFollows,
      @JsonKey(name: 'block_from_strangers')
      @HiveField(4)
          required this.blockFromStrangers,
      @JsonKey(name: 'hide_notification_contents')
      @HiveField(5)
          required this.hideNotificationContents});

  factory _$_UnifediApiMyAccountNotificationsSettings.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiMyAccountNotificationsSettingsFromJson(json);

  @override
  @HiveField(0)
  final bool? followers;
  @override
  @HiveField(1)
  final bool? follows;
  @override
  @JsonKey(name: 'non_followers')
  @HiveField(2)
  final bool? nonFollowers;
  @override
  @JsonKey(name: 'non_follows')
  @HiveField(3)
  final bool? nonFollows;
  @override
  @JsonKey(name: 'block_from_strangers')
  @HiveField(4)
  final bool? blockFromStrangers;
  @override
  @JsonKey(name: 'hide_notification_contents')
  @HiveField(5)
  final bool? hideNotificationContents;

  @override
  String toString() {
    return 'UnifediApiMyAccountNotificationsSettings(followers: $followers, follows: $follows, nonFollowers: $nonFollowers, nonFollows: $nonFollows, blockFromStrangers: $blockFromStrangers, hideNotificationContents: $hideNotificationContents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiMyAccountNotificationsSettings &&
            (identical(other.followers, followers) ||
                const DeepCollectionEquality()
                    .equals(other.followers, followers)) &&
            (identical(other.follows, follows) ||
                const DeepCollectionEquality()
                    .equals(other.follows, follows)) &&
            (identical(other.nonFollowers, nonFollowers) ||
                const DeepCollectionEquality()
                    .equals(other.nonFollowers, nonFollowers)) &&
            (identical(other.nonFollows, nonFollows) ||
                const DeepCollectionEquality()
                    .equals(other.nonFollows, nonFollows)) &&
            (identical(other.blockFromStrangers, blockFromStrangers) ||
                const DeepCollectionEquality()
                    .equals(other.blockFromStrangers, blockFromStrangers)) &&
            (identical(
                    other.hideNotificationContents, hideNotificationContents) ||
                const DeepCollectionEquality().equals(
                    other.hideNotificationContents, hideNotificationContents)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(followers) ^
      const DeepCollectionEquality().hash(follows) ^
      const DeepCollectionEquality().hash(nonFollowers) ^
      const DeepCollectionEquality().hash(nonFollows) ^
      const DeepCollectionEquality().hash(blockFromStrangers) ^
      const DeepCollectionEquality().hash(hideNotificationContents);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiMyAccountNotificationsSettingsCopyWith<
          _UnifediApiMyAccountNotificationsSettings>
      get copyWith => __$UnifediApiMyAccountNotificationsSettingsCopyWithImpl<
          _UnifediApiMyAccountNotificationsSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiMyAccountNotificationsSettingsToJson(this);
  }
}

abstract class _UnifediApiMyAccountNotificationsSettings
    implements UnifediApiMyAccountNotificationsSettings {
  const factory _UnifediApiMyAccountNotificationsSettings(
          {@HiveField(0)
              required bool? followers,
          @HiveField(1)
              required bool? follows,
          @JsonKey(name: 'non_followers')
          @HiveField(2)
              required bool? nonFollowers,
          @JsonKey(name: 'non_follows')
          @HiveField(3)
              required bool? nonFollows,
          @JsonKey(name: 'block_from_strangers')
          @HiveField(4)
              required bool? blockFromStrangers,
          @JsonKey(name: 'hide_notification_contents')
          @HiveField(5)
              required bool? hideNotificationContents}) =
      _$_UnifediApiMyAccountNotificationsSettings;

  factory _UnifediApiMyAccountNotificationsSettings.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiMyAccountNotificationsSettings.fromJson;

  @override
  @HiveField(0)
  bool? get followers => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  bool? get follows => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'non_followers')
  @HiveField(2)
  bool? get nonFollowers => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'non_follows')
  @HiveField(3)
  bool? get nonFollows => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'block_from_strangers')
  @HiveField(4)
  bool? get blockFromStrangers => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'hide_notification_contents')
  @HiveField(5)
  bool? get hideNotificationContents => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiMyAccountNotificationsSettingsCopyWith<
          _UnifediApiMyAccountNotificationsSettings>
      get copyWith => throw _privateConstructorUsedError;
}
