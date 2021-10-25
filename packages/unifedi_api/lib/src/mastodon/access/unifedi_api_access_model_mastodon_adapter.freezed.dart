// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_access_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccessMastodonAdapter _$UnifediApiAccessMastodonAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiAccessMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessMastodonAdapterTearOff {
  const _$UnifediApiAccessMastodonAdapterTearOff();

  _UnifediApiAccessMastodonAdapter call(@HiveField(0) MastodonApiAccess value) {
    return _UnifediApiAccessMastodonAdapter(
      value,
    );
  }

  UnifediApiAccessMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiAccessMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccessMastodonAdapter =
    _$UnifediApiAccessMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAccessMastodonAdapter {
  @HiveField(0)
  MastodonApiAccess get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessMastodonAdapterCopyWith<UnifediApiAccessMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiAccessMastodonAdapterCopyWith(
          UnifediApiAccessMastodonAdapter value,
          $Res Function(UnifediApiAccessMastodonAdapter) then) =
      _$UnifediApiAccessMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiAccess value});

  $MastodonApiAccessCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAccessMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiAccessMastodonAdapterCopyWith<$Res> {
  _$UnifediApiAccessMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiAccessMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccessMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccess,
    ));
  }

  @override
  $MastodonApiAccessCopyWith<$Res> get value {
    return $MastodonApiAccessCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccessMastodonAdapterCopyWith<$Res>
    implements $UnifediApiAccessMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiAccessMastodonAdapterCopyWith(
          _UnifediApiAccessMastodonAdapter value,
          $Res Function(_UnifediApiAccessMastodonAdapter) then) =
      __$UnifediApiAccessMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiAccess value});

  @override
  $MastodonApiAccessCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAccessMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAccessMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAccessMastodonAdapterCopyWith<$Res> {
  __$UnifediApiAccessMastodonAdapterCopyWithImpl(
      _UnifediApiAccessMastodonAdapter _value,
      $Res Function(_UnifediApiAccessMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiAccessMastodonAdapter));

  @override
  _UnifediApiAccessMastodonAdapter get _value =>
      super._value as _UnifediApiAccessMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAccessMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccess,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccessMastodonAdapter
    extends _UnifediApiAccessMastodonAdapter {
  const _$_UnifediApiAccessMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAccessMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccessMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiAccess value;

  @override
  String toString() {
    return 'UnifediApiAccessMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiAccessMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccessMastodonAdapterCopyWith<_UnifediApiAccessMastodonAdapter>
      get copyWith => __$UnifediApiAccessMastodonAdapterCopyWithImpl<
          _UnifediApiAccessMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiAccessMastodonAdapter
    extends UnifediApiAccessMastodonAdapter {
  const factory _UnifediApiAccessMastodonAdapter(
          @HiveField(0) MastodonApiAccess value) =
      _$_UnifediApiAccessMastodonAdapter;
  const _UnifediApiAccessMastodonAdapter._() : super._();

  factory _UnifediApiAccessMastodonAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiAccessMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiAccess get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessMastodonAdapterCopyWith<_UnifediApiAccessMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
