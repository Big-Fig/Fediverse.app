// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'global_or_instance_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GlobalOrInstanceSettingsTearOff {
  const _$GlobalOrInstanceSettingsTearOff();

  _GlobalOrInstanceSettings<T> call<T>(
      {required T settings, required GlobalOrInstanceSettingsType type}) {
    return _GlobalOrInstanceSettings<T>(
      settings: settings,
      type: type,
    );
  }
}

/// @nodoc
const $GlobalOrInstanceSettings = _$GlobalOrInstanceSettingsTearOff();

/// @nodoc
mixin _$GlobalOrInstanceSettings<T> {
  T get settings => throw _privateConstructorUsedError;
  GlobalOrInstanceSettingsType get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GlobalOrInstanceSettingsCopyWith<T, GlobalOrInstanceSettings<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalOrInstanceSettingsCopyWith<T, $Res> {
  factory $GlobalOrInstanceSettingsCopyWith(GlobalOrInstanceSettings<T> value,
          $Res Function(GlobalOrInstanceSettings<T>) then) =
      _$GlobalOrInstanceSettingsCopyWithImpl<T, $Res>;
  $Res call({T settings, GlobalOrInstanceSettingsType type});
}

/// @nodoc
class _$GlobalOrInstanceSettingsCopyWithImpl<T, $Res>
    implements $GlobalOrInstanceSettingsCopyWith<T, $Res> {
  _$GlobalOrInstanceSettingsCopyWithImpl(this._value, this._then);

  final GlobalOrInstanceSettings<T> _value;
  // ignore: unused_field
  final $Res Function(GlobalOrInstanceSettings<T>) _then;

  @override
  $Res call({
    Object? settings = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as T,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GlobalOrInstanceSettingsType,
    ));
  }
}

/// @nodoc
abstract class _$GlobalOrInstanceSettingsCopyWith<T, $Res>
    implements $GlobalOrInstanceSettingsCopyWith<T, $Res> {
  factory _$GlobalOrInstanceSettingsCopyWith(_GlobalOrInstanceSettings<T> value,
          $Res Function(_GlobalOrInstanceSettings<T>) then) =
      __$GlobalOrInstanceSettingsCopyWithImpl<T, $Res>;
  @override
  $Res call({T settings, GlobalOrInstanceSettingsType type});
}

/// @nodoc
class __$GlobalOrInstanceSettingsCopyWithImpl<T, $Res>
    extends _$GlobalOrInstanceSettingsCopyWithImpl<T, $Res>
    implements _$GlobalOrInstanceSettingsCopyWith<T, $Res> {
  __$GlobalOrInstanceSettingsCopyWithImpl(_GlobalOrInstanceSettings<T> _value,
      $Res Function(_GlobalOrInstanceSettings<T>) _then)
      : super(_value, (v) => _then(v as _GlobalOrInstanceSettings<T>));

  @override
  _GlobalOrInstanceSettings<T> get _value =>
      super._value as _GlobalOrInstanceSettings<T>;

  @override
  $Res call({
    Object? settings = freezed,
    Object? type = freezed,
  }) {
    return _then(_GlobalOrInstanceSettings<T>(
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as T,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GlobalOrInstanceSettingsType,
    ));
  }
}

/// @nodoc

class _$_GlobalOrInstanceSettings<T> extends _GlobalOrInstanceSettings<T> {
  const _$_GlobalOrInstanceSettings(
      {required this.settings, required this.type})
      : super._();

  @override
  final T settings;
  @override
  final GlobalOrInstanceSettingsType type;

  @override
  String toString() {
    return 'GlobalOrInstanceSettings<$T>(settings: $settings, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GlobalOrInstanceSettings<T> &&
            (identical(other.settings, settings) ||
                const DeepCollectionEquality()
                    .equals(other.settings, settings)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(settings) ^
      const DeepCollectionEquality().hash(type);

  @JsonKey(ignore: true)
  @override
  _$GlobalOrInstanceSettingsCopyWith<T, _GlobalOrInstanceSettings<T>>
      get copyWith => __$GlobalOrInstanceSettingsCopyWithImpl<T,
          _GlobalOrInstanceSettings<T>>(this, _$identity);
}

abstract class _GlobalOrInstanceSettings<T>
    extends GlobalOrInstanceSettings<T> {
  const factory _GlobalOrInstanceSettings(
          {required T settings, required GlobalOrInstanceSettingsType type}) =
      _$_GlobalOrInstanceSettings<T>;
  const _GlobalOrInstanceSettings._() : super._();

  @override
  T get settings => throw _privateConstructorUsedError;
  @override
  GlobalOrInstanceSettingsType get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GlobalOrInstanceSettingsCopyWith<T, _GlobalOrInstanceSettings<T>>
      get copyWith => throw _privateConstructorUsedError;
}
