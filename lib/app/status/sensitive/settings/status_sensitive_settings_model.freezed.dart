// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'status_sensitive_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatusSensitiveSettings _$StatusSensitiveSettingsFromJson(
    Map<String, dynamic> json) {
  return _StatusSensitiveSettings.fromJson(json);
}

/// @nodoc
class _$StatusSensitiveSettingsTearOff {
  const _$StatusSensitiveSettingsTearOff();

  _StatusSensitiveSettings call(
      {@HiveField(0)
      @JsonKey(name: 'is_always_show_spoiler')
          required bool isAlwaysShowSpoiler,
      @HiveField(1)
      @JsonKey(name: 'is_always_show_nsfw')
          required bool isAlwaysShowNsfw,
      @HiveField(2)
      @JsonKey(name: 'nsfw_display_delay_duration_seconds_total')
          required int? nsfwDisplayDelayDurationMicrosecondsTotal}) {
    return _StatusSensitiveSettings(
      isAlwaysShowSpoiler: isAlwaysShowSpoiler,
      isAlwaysShowNsfw: isAlwaysShowNsfw,
      nsfwDisplayDelayDurationMicrosecondsTotal:
          nsfwDisplayDelayDurationMicrosecondsTotal,
    );
  }

  StatusSensitiveSettings fromJson(Map<String, Object> json) {
    return StatusSensitiveSettings.fromJson(json);
  }
}

/// @nodoc
const $StatusSensitiveSettings = _$StatusSensitiveSettingsTearOff();

/// @nodoc
mixin _$StatusSensitiveSettings {
  @HiveField(0)
  @JsonKey(name: 'is_always_show_spoiler')
  bool get isAlwaysShowSpoiler => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'is_always_show_nsfw')
  bool get isAlwaysShowNsfw => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'nsfw_display_delay_duration_seconds_total')
  int? get nsfwDisplayDelayDurationMicrosecondsTotal =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusSensitiveSettingsCopyWith<StatusSensitiveSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusSensitiveSettingsCopyWith<$Res> {
  factory $StatusSensitiveSettingsCopyWith(StatusSensitiveSettings value,
          $Res Function(StatusSensitiveSettings) then) =
      _$StatusSensitiveSettingsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'is_always_show_spoiler')
          bool isAlwaysShowSpoiler,
      @HiveField(1)
      @JsonKey(name: 'is_always_show_nsfw')
          bool isAlwaysShowNsfw,
      @HiveField(2)
      @JsonKey(name: 'nsfw_display_delay_duration_seconds_total')
          int? nsfwDisplayDelayDurationMicrosecondsTotal});
}

/// @nodoc
class _$StatusSensitiveSettingsCopyWithImpl<$Res>
    implements $StatusSensitiveSettingsCopyWith<$Res> {
  _$StatusSensitiveSettingsCopyWithImpl(this._value, this._then);

  final StatusSensitiveSettings _value;
  // ignore: unused_field
  final $Res Function(StatusSensitiveSettings) _then;

  @override
  $Res call({
    Object? isAlwaysShowSpoiler = freezed,
    Object? isAlwaysShowNsfw = freezed,
    Object? nsfwDisplayDelayDurationMicrosecondsTotal = freezed,
  }) {
    return _then(_value.copyWith(
      isAlwaysShowSpoiler: isAlwaysShowSpoiler == freezed
          ? _value.isAlwaysShowSpoiler
          : isAlwaysShowSpoiler // ignore: cast_nullable_to_non_nullable
              as bool,
      isAlwaysShowNsfw: isAlwaysShowNsfw == freezed
          ? _value.isAlwaysShowNsfw
          : isAlwaysShowNsfw // ignore: cast_nullable_to_non_nullable
              as bool,
      nsfwDisplayDelayDurationMicrosecondsTotal:
          nsfwDisplayDelayDurationMicrosecondsTotal == freezed
              ? _value.nsfwDisplayDelayDurationMicrosecondsTotal
              : nsfwDisplayDelayDurationMicrosecondsTotal // ignore: cast_nullable_to_non_nullable
                  as int?,
    ));
  }
}

/// @nodoc
abstract class _$StatusSensitiveSettingsCopyWith<$Res>
    implements $StatusSensitiveSettingsCopyWith<$Res> {
  factory _$StatusSensitiveSettingsCopyWith(_StatusSensitiveSettings value,
          $Res Function(_StatusSensitiveSettings) then) =
      __$StatusSensitiveSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'is_always_show_spoiler')
          bool isAlwaysShowSpoiler,
      @HiveField(1)
      @JsonKey(name: 'is_always_show_nsfw')
          bool isAlwaysShowNsfw,
      @HiveField(2)
      @JsonKey(name: 'nsfw_display_delay_duration_seconds_total')
          int? nsfwDisplayDelayDurationMicrosecondsTotal});
}

/// @nodoc
class __$StatusSensitiveSettingsCopyWithImpl<$Res>
    extends _$StatusSensitiveSettingsCopyWithImpl<$Res>
    implements _$StatusSensitiveSettingsCopyWith<$Res> {
  __$StatusSensitiveSettingsCopyWithImpl(_StatusSensitiveSettings _value,
      $Res Function(_StatusSensitiveSettings) _then)
      : super(_value, (v) => _then(v as _StatusSensitiveSettings));

  @override
  _StatusSensitiveSettings get _value =>
      super._value as _StatusSensitiveSettings;

  @override
  $Res call({
    Object? isAlwaysShowSpoiler = freezed,
    Object? isAlwaysShowNsfw = freezed,
    Object? nsfwDisplayDelayDurationMicrosecondsTotal = freezed,
  }) {
    return _then(_StatusSensitiveSettings(
      isAlwaysShowSpoiler: isAlwaysShowSpoiler == freezed
          ? _value.isAlwaysShowSpoiler
          : isAlwaysShowSpoiler // ignore: cast_nullable_to_non_nullable
              as bool,
      isAlwaysShowNsfw: isAlwaysShowNsfw == freezed
          ? _value.isAlwaysShowNsfw
          : isAlwaysShowNsfw // ignore: cast_nullable_to_non_nullable
              as bool,
      nsfwDisplayDelayDurationMicrosecondsTotal:
          nsfwDisplayDelayDurationMicrosecondsTotal == freezed
              ? _value.nsfwDisplayDelayDurationMicrosecondsTotal
              : nsfwDisplayDelayDurationMicrosecondsTotal // ignore: cast_nullable_to_non_nullable
                  as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StatusSensitiveSettings extends _StatusSensitiveSettings {
  const _$_StatusSensitiveSettings(
      {@HiveField(0)
      @JsonKey(name: 'is_always_show_spoiler')
          required this.isAlwaysShowSpoiler,
      @HiveField(1)
      @JsonKey(name: 'is_always_show_nsfw')
          required this.isAlwaysShowNsfw,
      @HiveField(2)
      @JsonKey(name: 'nsfw_display_delay_duration_seconds_total')
          required this.nsfwDisplayDelayDurationMicrosecondsTotal})
      : super._();

  factory _$_StatusSensitiveSettings.fromJson(Map<String, dynamic> json) =>
      _$$_StatusSensitiveSettingsFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'is_always_show_spoiler')
  final bool isAlwaysShowSpoiler;
  @override
  @HiveField(1)
  @JsonKey(name: 'is_always_show_nsfw')
  final bool isAlwaysShowNsfw;
  @override
  @HiveField(2)
  @JsonKey(name: 'nsfw_display_delay_duration_seconds_total')
  final int? nsfwDisplayDelayDurationMicrosecondsTotal;

  @override
  String toString() {
    return 'StatusSensitiveSettings(isAlwaysShowSpoiler: $isAlwaysShowSpoiler, isAlwaysShowNsfw: $isAlwaysShowNsfw, nsfwDisplayDelayDurationMicrosecondsTotal: $nsfwDisplayDelayDurationMicrosecondsTotal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StatusSensitiveSettings &&
            (identical(other.isAlwaysShowSpoiler, isAlwaysShowSpoiler) ||
                const DeepCollectionEquality()
                    .equals(other.isAlwaysShowSpoiler, isAlwaysShowSpoiler)) &&
            (identical(other.isAlwaysShowNsfw, isAlwaysShowNsfw) ||
                const DeepCollectionEquality()
                    .equals(other.isAlwaysShowNsfw, isAlwaysShowNsfw)) &&
            (identical(other.nsfwDisplayDelayDurationMicrosecondsTotal,
                    nsfwDisplayDelayDurationMicrosecondsTotal) ||
                const DeepCollectionEquality().equals(
                    other.nsfwDisplayDelayDurationMicrosecondsTotal,
                    nsfwDisplayDelayDurationMicrosecondsTotal)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isAlwaysShowSpoiler) ^
      const DeepCollectionEquality().hash(isAlwaysShowNsfw) ^
      const DeepCollectionEquality()
          .hash(nsfwDisplayDelayDurationMicrosecondsTotal);

  @JsonKey(ignore: true)
  @override
  _$StatusSensitiveSettingsCopyWith<_StatusSensitiveSettings> get copyWith =>
      __$StatusSensitiveSettingsCopyWithImpl<_StatusSensitiveSettings>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatusSensitiveSettingsToJson(this);
  }
}

abstract class _StatusSensitiveSettings extends StatusSensitiveSettings {
  const factory _StatusSensitiveSettings(
          {@HiveField(0)
          @JsonKey(name: 'is_always_show_spoiler')
              required bool isAlwaysShowSpoiler,
          @HiveField(1)
          @JsonKey(name: 'is_always_show_nsfw')
              required bool isAlwaysShowNsfw,
          @HiveField(2)
          @JsonKey(name: 'nsfw_display_delay_duration_seconds_total')
              required int? nsfwDisplayDelayDurationMicrosecondsTotal}) =
      _$_StatusSensitiveSettings;
  const _StatusSensitiveSettings._() : super._();

  factory _StatusSensitiveSettings.fromJson(Map<String, dynamic> json) =
      _$_StatusSensitiveSettings.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'is_always_show_spoiler')
  bool get isAlwaysShowSpoiler => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'is_always_show_nsfw')
  bool get isAlwaysShowNsfw => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'nsfw_display_delay_duration_seconds_total')
  int? get nsfwDisplayDelayDurationMicrosecondsTotal =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StatusSensitiveSettingsCopyWith<_StatusSensitiveSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
