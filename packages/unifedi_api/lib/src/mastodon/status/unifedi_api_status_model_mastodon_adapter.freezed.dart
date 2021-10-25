// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_status_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiStatusMastodonAdapter _$UnifediApiStatusMastodonAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiStatusMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiStatusMastodonAdapterTearOff {
  const _$UnifediApiStatusMastodonAdapterTearOff();

  _UnifediApiStatusMastodonAdapter call(@HiveField(0) MastodonApiStatus value) {
    return _UnifediApiStatusMastodonAdapter(
      value,
    );
  }

  UnifediApiStatusMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiStatusMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiStatusMastodonAdapter =
    _$UnifediApiStatusMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiStatusMastodonAdapter {
  @HiveField(0)
  MastodonApiStatus get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiStatusMastodonAdapterCopyWith<UnifediApiStatusMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiStatusMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiStatusMastodonAdapterCopyWith(
          UnifediApiStatusMastodonAdapter value,
          $Res Function(UnifediApiStatusMastodonAdapter) then) =
      _$UnifediApiStatusMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiStatus value});

  $MastodonApiStatusCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiStatusMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiStatusMastodonAdapterCopyWith<$Res> {
  _$UnifediApiStatusMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiStatusMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiStatusMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiStatus,
    ));
  }

  @override
  $MastodonApiStatusCopyWith<$Res> get value {
    return $MastodonApiStatusCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiStatusMastodonAdapterCopyWith<$Res>
    implements $UnifediApiStatusMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiStatusMastodonAdapterCopyWith(
          _UnifediApiStatusMastodonAdapter value,
          $Res Function(_UnifediApiStatusMastodonAdapter) then) =
      __$UnifediApiStatusMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiStatus value});

  @override
  $MastodonApiStatusCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiStatusMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiStatusMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiStatusMastodonAdapterCopyWith<$Res> {
  __$UnifediApiStatusMastodonAdapterCopyWithImpl(
      _UnifediApiStatusMastodonAdapter _value,
      $Res Function(_UnifediApiStatusMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiStatusMastodonAdapter));

  @override
  _UnifediApiStatusMastodonAdapter get _value =>
      super._value as _UnifediApiStatusMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiStatusMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiStatusMastodonAdapter
    extends _UnifediApiStatusMastodonAdapter {
  const _$_UnifediApiStatusMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiStatusMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiStatusMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiStatus value;

  @override
  String toString() {
    return 'UnifediApiStatusMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiStatusMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiStatusMastodonAdapterCopyWith<_UnifediApiStatusMastodonAdapter>
      get copyWith => __$UnifediApiStatusMastodonAdapterCopyWithImpl<
          _UnifediApiStatusMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiStatusMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiStatusMastodonAdapter
    extends UnifediApiStatusMastodonAdapter {
  const factory _UnifediApiStatusMastodonAdapter(
          @HiveField(0) MastodonApiStatus value) =
      _$_UnifediApiStatusMastodonAdapter;
  const _UnifediApiStatusMastodonAdapter._() : super._();

  factory _UnifediApiStatusMastodonAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiStatusMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiStatus get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiStatusMastodonAdapterCopyWith<_UnifediApiStatusMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
