// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_access_scopes_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccessScopesMastodonAdapter
    _$UnifediApiAccessScopesMastodonAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiAccessScopesMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessScopesMastodonAdapterTearOff {
  const _$UnifediApiAccessScopesMastodonAdapterTearOff();

  _UnifediApiAccessScopesMastodonAdapter call(
      @HiveField(0) MastodonApiAccessScopes value) {
    return _UnifediApiAccessScopesMastodonAdapter(
      value,
    );
  }

  UnifediApiAccessScopesMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiAccessScopesMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccessScopesMastodonAdapter =
    _$UnifediApiAccessScopesMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAccessScopesMastodonAdapter {
  @HiveField(0)
  MastodonApiAccessScopes get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessScopesMastodonAdapterCopyWith<
          UnifediApiAccessScopesMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessScopesMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiAccessScopesMastodonAdapterCopyWith(
          UnifediApiAccessScopesMastodonAdapter value,
          $Res Function(UnifediApiAccessScopesMastodonAdapter) then) =
      _$UnifediApiAccessScopesMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiAccessScopes value});

  $MastodonApiAccessScopesCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAccessScopesMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiAccessScopesMastodonAdapterCopyWith<$Res> {
  _$UnifediApiAccessScopesMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiAccessScopesMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccessScopesMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessScopes,
    ));
  }

  @override
  $MastodonApiAccessScopesCopyWith<$Res> get value {
    return $MastodonApiAccessScopesCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccessScopesMastodonAdapterCopyWith<$Res>
    implements $UnifediApiAccessScopesMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiAccessScopesMastodonAdapterCopyWith(
          _UnifediApiAccessScopesMastodonAdapter value,
          $Res Function(_UnifediApiAccessScopesMastodonAdapter) then) =
      __$UnifediApiAccessScopesMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiAccessScopes value});

  @override
  $MastodonApiAccessScopesCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAccessScopesMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAccessScopesMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAccessScopesMastodonAdapterCopyWith<$Res> {
  __$UnifediApiAccessScopesMastodonAdapterCopyWithImpl(
      _UnifediApiAccessScopesMastodonAdapter _value,
      $Res Function(_UnifediApiAccessScopesMastodonAdapter) _then)
      : super(
            _value, (v) => _then(v as _UnifediApiAccessScopesMastodonAdapter));

  @override
  _UnifediApiAccessScopesMastodonAdapter get _value =>
      super._value as _UnifediApiAccessScopesMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAccessScopesMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessScopes,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccessScopesMastodonAdapter
    extends _UnifediApiAccessScopesMastodonAdapter {
  const _$_UnifediApiAccessScopesMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAccessScopesMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccessScopesMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiAccessScopes value;

  @override
  String toString() {
    return 'UnifediApiAccessScopesMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiAccessScopesMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccessScopesMastodonAdapterCopyWith<
          _UnifediApiAccessScopesMastodonAdapter>
      get copyWith => __$UnifediApiAccessScopesMastodonAdapterCopyWithImpl<
          _UnifediApiAccessScopesMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessScopesMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiAccessScopesMastodonAdapter
    extends UnifediApiAccessScopesMastodonAdapter {
  const factory _UnifediApiAccessScopesMastodonAdapter(
          @HiveField(0) MastodonApiAccessScopes value) =
      _$_UnifediApiAccessScopesMastodonAdapter;
  const _UnifediApiAccessScopesMastodonAdapter._() : super._();

  factory _UnifediApiAccessScopesMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiAccessScopesMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiAccessScopes get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessScopesMastodonAdapterCopyWith<
          _UnifediApiAccessScopesMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
