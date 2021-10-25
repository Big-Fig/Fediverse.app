// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_my_account_notifications_settings_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiMyAccountNotificationsSettings
    _$PleromaApiMyAccountNotificationsSettingsFromJson(
        Map<String, dynamic> json) {
  return _PleromaApiMyAccountNotificationsSettings.fromJson(json);
}

/// @nodoc
class _$PleromaApiMyAccountNotificationsSettingsTearOff {
  const _$PleromaApiMyAccountNotificationsSettingsTearOff();

  _PleromaApiMyAccountNotificationsSettings call(
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
    return _PleromaApiMyAccountNotificationsSettings(
      followers: followers,
      follows: follows,
      nonFollowers: nonFollowers,
      nonFollows: nonFollows,
      blockFromStrangers: blockFromStrangers,
      hideNotificationContents: hideNotificationContents,
    );
  }

  PleromaApiMyAccountNotificationsSettings fromJson(Map<String, Object> json) {
    return PleromaApiMyAccountNotificationsSettings.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiMyAccountNotificationsSettings =
    _$PleromaApiMyAccountNotificationsSettingsTearOff();

/// @nodoc
mixin _$PleromaApiMyAccountNotificationsSettings {
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
  $PleromaApiMyAccountNotificationsSettingsCopyWith<
          PleromaApiMyAccountNotificationsSettings>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiMyAccountNotificationsSettingsCopyWith<$Res> {
  factory $PleromaApiMyAccountNotificationsSettingsCopyWith(
          PleromaApiMyAccountNotificationsSettings value,
          $Res Function(PleromaApiMyAccountNotificationsSettings) then) =
      _$PleromaApiMyAccountNotificationsSettingsCopyWithImpl<$Res>;
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
class _$PleromaApiMyAccountNotificationsSettingsCopyWithImpl<$Res>
    implements $PleromaApiMyAccountNotificationsSettingsCopyWith<$Res> {
  _$PleromaApiMyAccountNotificationsSettingsCopyWithImpl(
      this._value, this._then);

  final PleromaApiMyAccountNotificationsSettings _value;
  // ignore: unused_field
  final $Res Function(PleromaApiMyAccountNotificationsSettings) _then;

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
abstract class _$PleromaApiMyAccountNotificationsSettingsCopyWith<$Res>
    implements $PleromaApiMyAccountNotificationsSettingsCopyWith<$Res> {
  factory _$PleromaApiMyAccountNotificationsSettingsCopyWith(
          _PleromaApiMyAccountNotificationsSettings value,
          $Res Function(_PleromaApiMyAccountNotificationsSettings) then) =
      __$PleromaApiMyAccountNotificationsSettingsCopyWithImpl<$Res>;
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
class __$PleromaApiMyAccountNotificationsSettingsCopyWithImpl<$Res>
    extends _$PleromaApiMyAccountNotificationsSettingsCopyWithImpl<$Res>
    implements _$PleromaApiMyAccountNotificationsSettingsCopyWith<$Res> {
  __$PleromaApiMyAccountNotificationsSettingsCopyWithImpl(
      _PleromaApiMyAccountNotificationsSettings _value,
      $Res Function(_PleromaApiMyAccountNotificationsSettings) _then)
      : super(_value,
            (v) => _then(v as _PleromaApiMyAccountNotificationsSettings));

  @override
  _PleromaApiMyAccountNotificationsSettings get _value =>
      super._value as _PleromaApiMyAccountNotificationsSettings;

  @override
  $Res call({
    Object? followers = freezed,
    Object? follows = freezed,
    Object? nonFollowers = freezed,
    Object? nonFollows = freezed,
    Object? blockFromStrangers = freezed,
    Object? hideNotificationContents = freezed,
  }) {
    return _then(_PleromaApiMyAccountNotificationsSettings(
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
class _$_PleromaApiMyAccountNotificationsSettings
    implements _PleromaApiMyAccountNotificationsSettings {
  const _$_PleromaApiMyAccountNotificationsSettings(
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

  factory _$_PleromaApiMyAccountNotificationsSettings.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiMyAccountNotificationsSettingsFromJson(json);

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
    return 'PleromaApiMyAccountNotificationsSettings(followers: $followers, follows: $follows, nonFollowers: $nonFollowers, nonFollows: $nonFollows, blockFromStrangers: $blockFromStrangers, hideNotificationContents: $hideNotificationContents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiMyAccountNotificationsSettings &&
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
  _$PleromaApiMyAccountNotificationsSettingsCopyWith<
          _PleromaApiMyAccountNotificationsSettings>
      get copyWith => __$PleromaApiMyAccountNotificationsSettingsCopyWithImpl<
          _PleromaApiMyAccountNotificationsSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiMyAccountNotificationsSettingsToJson(this);
  }
}

abstract class _PleromaApiMyAccountNotificationsSettings
    implements PleromaApiMyAccountNotificationsSettings {
  const factory _PleromaApiMyAccountNotificationsSettings(
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
      _$_PleromaApiMyAccountNotificationsSettings;

  factory _PleromaApiMyAccountNotificationsSettings.fromJson(
          Map<String, dynamic> json) =
      _$_PleromaApiMyAccountNotificationsSettings.fromJson;

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
  _$PleromaApiMyAccountNotificationsSettingsCopyWith<
          _PleromaApiMyAccountNotificationsSettings>
      get copyWith => throw _privateConstructorUsedError;
}
