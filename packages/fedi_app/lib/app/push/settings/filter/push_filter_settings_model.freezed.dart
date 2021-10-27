// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'push_filter_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PushFilterSettings _$PushFilterSettingsFromJson(Map<String, dynamic> json) {
  return _PushFilterSettings.fromJson(json);
}

/// @nodoc
class _$PushFilterSettingsTearOff {
  const _$PushFilterSettingsTearOff();

  _PushFilterSettings call(
      {@JsonKey(name: 'blockFromStrangers')
      @HiveField(1)
          required bool? blockFromStrangers,
      @JsonKey(name: 'hideNotificationContents')
      @HiveField(2)
          required bool? hideNotificationContents}) {
    return _PushFilterSettings(
      blockFromStrangers: blockFromStrangers,
      hideNotificationContents: hideNotificationContents,
    );
  }

  PushFilterSettings fromJson(Map<String, Object?> json) {
    return PushFilterSettings.fromJson(json);
  }
}

/// @nodoc
const $PushFilterSettings = _$PushFilterSettingsTearOff();

/// @nodoc
mixin _$PushFilterSettings {
  @JsonKey(name: 'blockFromStrangers')
  @HiveField(1)
  bool? get blockFromStrangers => throw _privateConstructorUsedError;
  @JsonKey(name: 'hideNotificationContents')
  @HiveField(2)
  bool? get hideNotificationContents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PushFilterSettingsCopyWith<PushFilterSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushFilterSettingsCopyWith<$Res> {
  factory $PushFilterSettingsCopyWith(
          PushFilterSettings value, $Res Function(PushFilterSettings) then) =
      _$PushFilterSettingsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'blockFromStrangers')
      @HiveField(1)
          bool? blockFromStrangers,
      @JsonKey(name: 'hideNotificationContents')
      @HiveField(2)
          bool? hideNotificationContents});
}

/// @nodoc
class _$PushFilterSettingsCopyWithImpl<$Res>
    implements $PushFilterSettingsCopyWith<$Res> {
  _$PushFilterSettingsCopyWithImpl(this._value, this._then);

  final PushFilterSettings _value;
  // ignore: unused_field
  final $Res Function(PushFilterSettings) _then;

  @override
  $Res call({
    Object? blockFromStrangers = freezed,
    Object? hideNotificationContents = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$PushFilterSettingsCopyWith<$Res>
    implements $PushFilterSettingsCopyWith<$Res> {
  factory _$PushFilterSettingsCopyWith(
          _PushFilterSettings value, $Res Function(_PushFilterSettings) then) =
      __$PushFilterSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'blockFromStrangers')
      @HiveField(1)
          bool? blockFromStrangers,
      @JsonKey(name: 'hideNotificationContents')
      @HiveField(2)
          bool? hideNotificationContents});
}

/// @nodoc
class __$PushFilterSettingsCopyWithImpl<$Res>
    extends _$PushFilterSettingsCopyWithImpl<$Res>
    implements _$PushFilterSettingsCopyWith<$Res> {
  __$PushFilterSettingsCopyWithImpl(
      _PushFilterSettings _value, $Res Function(_PushFilterSettings) _then)
      : super(_value, (v) => _then(v as _PushFilterSettings));

  @override
  _PushFilterSettings get _value => super._value as _PushFilterSettings;

  @override
  $Res call({
    Object? blockFromStrangers = freezed,
    Object? hideNotificationContents = freezed,
  }) {
    return _then(_PushFilterSettings(
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
class _$_PushFilterSettings extends _PushFilterSettings {
  const _$_PushFilterSettings(
      {@JsonKey(name: 'blockFromStrangers')
      @HiveField(1)
          required this.blockFromStrangers,
      @JsonKey(name: 'hideNotificationContents')
      @HiveField(2)
          required this.hideNotificationContents})
      : super._();

  factory _$_PushFilterSettings.fromJson(Map<String, dynamic> json) =>
      _$$_PushFilterSettingsFromJson(json);

  @override
  @JsonKey(name: 'blockFromStrangers')
  @HiveField(1)
  final bool? blockFromStrangers;
  @override
  @JsonKey(name: 'hideNotificationContents')
  @HiveField(2)
  final bool? hideNotificationContents;

  @override
  String toString() {
    return 'PushFilterSettings(blockFromStrangers: $blockFromStrangers, hideNotificationContents: $hideNotificationContents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PushFilterSettings &&
            (identical(other.blockFromStrangers, blockFromStrangers) ||
                other.blockFromStrangers == blockFromStrangers) &&
            (identical(
                    other.hideNotificationContents, hideNotificationContents) ||
                other.hideNotificationContents == hideNotificationContents));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, blockFromStrangers, hideNotificationContents);

  @JsonKey(ignore: true)
  @override
  _$PushFilterSettingsCopyWith<_PushFilterSettings> get copyWith =>
      __$PushFilterSettingsCopyWithImpl<_PushFilterSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PushFilterSettingsToJson(this);
  }
}

abstract class _PushFilterSettings extends PushFilterSettings {
  const factory _PushFilterSettings(
      {@JsonKey(name: 'blockFromStrangers')
      @HiveField(1)
          required bool? blockFromStrangers,
      @JsonKey(name: 'hideNotificationContents')
      @HiveField(2)
          required bool? hideNotificationContents}) = _$_PushFilterSettings;
  const _PushFilterSettings._() : super._();

  factory _PushFilterSettings.fromJson(Map<String, dynamic> json) =
      _$_PushFilterSettings.fromJson;

  @override
  @JsonKey(name: 'blockFromStrangers')
  @HiveField(1)
  bool? get blockFromStrangers;
  @override
  @JsonKey(name: 'hideNotificationContents')
  @HiveField(2)
  bool? get hideNotificationContents;
  @override
  @JsonKey(ignore: true)
  _$PushFilterSettingsCopyWith<_PushFilterSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
