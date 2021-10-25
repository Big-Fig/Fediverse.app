// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_rest_error_details_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiRestErrorDetailsMastodonAdapter
    _$UnifediApiRestErrorDetailsMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiRestErrorDetailsMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiRestErrorDetailsMastodonAdapterTearOff {
  const _$UnifediApiRestErrorDetailsMastodonAdapterTearOff();

  _UnifediApiRestErrorDetailsMastodonAdapter call(
      @HiveField(0) MastodonApiRestErrorDetails value) {
    return _UnifediApiRestErrorDetailsMastodonAdapter(
      value,
    );
  }

  UnifediApiRestErrorDetailsMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiRestErrorDetailsMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiRestErrorDetailsMastodonAdapter =
    _$UnifediApiRestErrorDetailsMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiRestErrorDetailsMastodonAdapter {
  @HiveField(0)
  MastodonApiRestErrorDetails get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiRestErrorDetailsMastodonAdapterCopyWith<
          UnifediApiRestErrorDetailsMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiRestErrorDetailsMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiRestErrorDetailsMastodonAdapterCopyWith(
          UnifediApiRestErrorDetailsMastodonAdapter value,
          $Res Function(UnifediApiRestErrorDetailsMastodonAdapter) then) =
      _$UnifediApiRestErrorDetailsMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiRestErrorDetails value});

  $MastodonApiRestErrorDetailsCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiRestErrorDetailsMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiRestErrorDetailsMastodonAdapterCopyWith<$Res> {
  _$UnifediApiRestErrorDetailsMastodonAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiRestErrorDetailsMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiRestErrorDetailsMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiRestErrorDetails,
    ));
  }

  @override
  $MastodonApiRestErrorDetailsCopyWith<$Res> get value {
    return $MastodonApiRestErrorDetailsCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiRestErrorDetailsMastodonAdapterCopyWith<$Res>
    implements $UnifediApiRestErrorDetailsMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiRestErrorDetailsMastodonAdapterCopyWith(
          _UnifediApiRestErrorDetailsMastodonAdapter value,
          $Res Function(_UnifediApiRestErrorDetailsMastodonAdapter) then) =
      __$UnifediApiRestErrorDetailsMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiRestErrorDetails value});

  @override
  $MastodonApiRestErrorDetailsCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiRestErrorDetailsMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiRestErrorDetailsMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiRestErrorDetailsMastodonAdapterCopyWith<$Res> {
  __$UnifediApiRestErrorDetailsMastodonAdapterCopyWithImpl(
      _UnifediApiRestErrorDetailsMastodonAdapter _value,
      $Res Function(_UnifediApiRestErrorDetailsMastodonAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiRestErrorDetailsMastodonAdapter));

  @override
  _UnifediApiRestErrorDetailsMastodonAdapter get _value =>
      super._value as _UnifediApiRestErrorDetailsMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiRestErrorDetailsMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiRestErrorDetails,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiRestErrorDetailsMastodonAdapter
    extends _UnifediApiRestErrorDetailsMastodonAdapter {
  const _$_UnifediApiRestErrorDetailsMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiRestErrorDetailsMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiRestErrorDetailsMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiRestErrorDetails value;

  @override
  String toString() {
    return 'UnifediApiRestErrorDetailsMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiRestErrorDetailsMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiRestErrorDetailsMastodonAdapterCopyWith<
          _UnifediApiRestErrorDetailsMastodonAdapter>
      get copyWith => __$UnifediApiRestErrorDetailsMastodonAdapterCopyWithImpl<
          _UnifediApiRestErrorDetailsMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiRestErrorDetailsMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiRestErrorDetailsMastodonAdapter
    extends UnifediApiRestErrorDetailsMastodonAdapter {
  const factory _UnifediApiRestErrorDetailsMastodonAdapter(
          @HiveField(0) MastodonApiRestErrorDetails value) =
      _$_UnifediApiRestErrorDetailsMastodonAdapter;
  const _UnifediApiRestErrorDetailsMastodonAdapter._() : super._();

  factory _UnifediApiRestErrorDetailsMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiRestErrorDetailsMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiRestErrorDetails get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiRestErrorDetailsMastodonAdapterCopyWith<
          _UnifediApiRestErrorDetailsMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
