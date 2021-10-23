// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'instance_announcement_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InstanceAnnouncementSettings _$InstanceAnnouncementSettingsFromJson(
    Map<String, dynamic> json) {
  return _InstanceAnnouncementSettings.fromJson(json);
}

/// @nodoc
class _$InstanceAnnouncementSettingsTearOff {
  const _$InstanceAnnouncementSettingsTearOff();

  _InstanceAnnouncementSettings call(
      {@HiveField(1) required bool withDismissed}) {
    return _InstanceAnnouncementSettings(
      withDismissed: withDismissed,
    );
  }

  InstanceAnnouncementSettings fromJson(Map<String, Object> json) {
    return InstanceAnnouncementSettings.fromJson(json);
  }
}

/// @nodoc
const $InstanceAnnouncementSettings = _$InstanceAnnouncementSettingsTearOff();

/// @nodoc
mixin _$InstanceAnnouncementSettings {
  @HiveField(1)
  bool get withDismissed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InstanceAnnouncementSettingsCopyWith<InstanceAnnouncementSettings>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstanceAnnouncementSettingsCopyWith<$Res> {
  factory $InstanceAnnouncementSettingsCopyWith(
          InstanceAnnouncementSettings value,
          $Res Function(InstanceAnnouncementSettings) then) =
      _$InstanceAnnouncementSettingsCopyWithImpl<$Res>;
  $Res call({@HiveField(1) bool withDismissed});
}

/// @nodoc
class _$InstanceAnnouncementSettingsCopyWithImpl<$Res>
    implements $InstanceAnnouncementSettingsCopyWith<$Res> {
  _$InstanceAnnouncementSettingsCopyWithImpl(this._value, this._then);

  final InstanceAnnouncementSettings _value;
  // ignore: unused_field
  final $Res Function(InstanceAnnouncementSettings) _then;

  @override
  $Res call({
    Object? withDismissed = freezed,
  }) {
    return _then(_value.copyWith(
      withDismissed: withDismissed == freezed
          ? _value.withDismissed
          : withDismissed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$InstanceAnnouncementSettingsCopyWith<$Res>
    implements $InstanceAnnouncementSettingsCopyWith<$Res> {
  factory _$InstanceAnnouncementSettingsCopyWith(
          _InstanceAnnouncementSettings value,
          $Res Function(_InstanceAnnouncementSettings) then) =
      __$InstanceAnnouncementSettingsCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(1) bool withDismissed});
}

/// @nodoc
class __$InstanceAnnouncementSettingsCopyWithImpl<$Res>
    extends _$InstanceAnnouncementSettingsCopyWithImpl<$Res>
    implements _$InstanceAnnouncementSettingsCopyWith<$Res> {
  __$InstanceAnnouncementSettingsCopyWithImpl(
      _InstanceAnnouncementSettings _value,
      $Res Function(_InstanceAnnouncementSettings) _then)
      : super(_value, (v) => _then(v as _InstanceAnnouncementSettings));

  @override
  _InstanceAnnouncementSettings get _value =>
      super._value as _InstanceAnnouncementSettings;

  @override
  $Res call({
    Object? withDismissed = freezed,
  }) {
    return _then(_InstanceAnnouncementSettings(
      withDismissed: withDismissed == freezed
          ? _value.withDismissed
          : withDismissed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InstanceAnnouncementSettings extends _InstanceAnnouncementSettings {
  const _$_InstanceAnnouncementSettings(
      {@HiveField(1) required this.withDismissed})
      : super._();

  factory _$_InstanceAnnouncementSettings.fromJson(Map<String, dynamic> json) =>
      _$$_InstanceAnnouncementSettingsFromJson(json);

  @override
  @HiveField(1)
  final bool withDismissed;

  @override
  String toString() {
    return 'InstanceAnnouncementSettings(withDismissed: $withDismissed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InstanceAnnouncementSettings &&
            (identical(other.withDismissed, withDismissed) ||
                const DeepCollectionEquality()
                    .equals(other.withDismissed, withDismissed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(withDismissed);

  @JsonKey(ignore: true)
  @override
  _$InstanceAnnouncementSettingsCopyWith<_InstanceAnnouncementSettings>
      get copyWith => __$InstanceAnnouncementSettingsCopyWithImpl<
          _InstanceAnnouncementSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InstanceAnnouncementSettingsToJson(this);
  }
}

abstract class _InstanceAnnouncementSettings
    extends InstanceAnnouncementSettings {
  const factory _InstanceAnnouncementSettings(
          {@HiveField(1) required bool withDismissed}) =
      _$_InstanceAnnouncementSettings;
  const _InstanceAnnouncementSettings._() : super._();

  factory _InstanceAnnouncementSettings.fromJson(Map<String, dynamic> json) =
      _$_InstanceAnnouncementSettings.fromJson;

  @override
  @HiveField(1)
  bool get withDismissed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InstanceAnnouncementSettingsCopyWith<_InstanceAnnouncementSettings>
      get copyWith => throw _privateConstructorUsedError;
}
