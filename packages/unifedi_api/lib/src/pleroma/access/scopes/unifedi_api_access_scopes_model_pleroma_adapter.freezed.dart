// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_access_scopes_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccessScopesPleromaAdapter
    _$UnifediApiAccessScopesPleromaAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiAccessScopesPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessScopesPleromaAdapterTearOff {
  const _$UnifediApiAccessScopesPleromaAdapterTearOff();

  _UnifediApiAccessScopesPleromaAdapter call(
      @HiveField(0) PleromaApiAccessScopes value) {
    return _UnifediApiAccessScopesPleromaAdapter(
      value,
    );
  }

  UnifediApiAccessScopesPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiAccessScopesPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccessScopesPleromaAdapter =
    _$UnifediApiAccessScopesPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAccessScopesPleromaAdapter {
  @HiveField(0)
  PleromaApiAccessScopes get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessScopesPleromaAdapterCopyWith<
          UnifediApiAccessScopesPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessScopesPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiAccessScopesPleromaAdapterCopyWith(
          UnifediApiAccessScopesPleromaAdapter value,
          $Res Function(UnifediApiAccessScopesPleromaAdapter) then) =
      _$UnifediApiAccessScopesPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiAccessScopes value});

  $PleromaApiAccessScopesCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAccessScopesPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiAccessScopesPleromaAdapterCopyWith<$Res> {
  _$UnifediApiAccessScopesPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiAccessScopesPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccessScopesPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessScopes,
    ));
  }

  @override
  $PleromaApiAccessScopesCopyWith<$Res> get value {
    return $PleromaApiAccessScopesCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccessScopesPleromaAdapterCopyWith<$Res>
    implements $UnifediApiAccessScopesPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiAccessScopesPleromaAdapterCopyWith(
          _UnifediApiAccessScopesPleromaAdapter value,
          $Res Function(_UnifediApiAccessScopesPleromaAdapter) then) =
      __$UnifediApiAccessScopesPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiAccessScopes value});

  @override
  $PleromaApiAccessScopesCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAccessScopesPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAccessScopesPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAccessScopesPleromaAdapterCopyWith<$Res> {
  __$UnifediApiAccessScopesPleromaAdapterCopyWithImpl(
      _UnifediApiAccessScopesPleromaAdapter _value,
      $Res Function(_UnifediApiAccessScopesPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiAccessScopesPleromaAdapter));

  @override
  _UnifediApiAccessScopesPleromaAdapter get _value =>
      super._value as _UnifediApiAccessScopesPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAccessScopesPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessScopes,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccessScopesPleromaAdapter
    extends _UnifediApiAccessScopesPleromaAdapter {
  const _$_UnifediApiAccessScopesPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAccessScopesPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccessScopesPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiAccessScopes value;

  @override
  String toString() {
    return 'UnifediApiAccessScopesPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiAccessScopesPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccessScopesPleromaAdapterCopyWith<
          _UnifediApiAccessScopesPleromaAdapter>
      get copyWith => __$UnifediApiAccessScopesPleromaAdapterCopyWithImpl<
          _UnifediApiAccessScopesPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessScopesPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiAccessScopesPleromaAdapter
    extends UnifediApiAccessScopesPleromaAdapter {
  const factory _UnifediApiAccessScopesPleromaAdapter(
          @HiveField(0) PleromaApiAccessScopes value) =
      _$_UnifediApiAccessScopesPleromaAdapter;
  const _UnifediApiAccessScopesPleromaAdapter._() : super._();

  factory _UnifediApiAccessScopesPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiAccessScopesPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiAccessScopes get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessScopesPleromaAdapterCopyWith<
          _UnifediApiAccessScopesPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
