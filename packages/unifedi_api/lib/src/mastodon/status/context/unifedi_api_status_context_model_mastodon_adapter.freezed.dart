// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_status_context_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiStatusContextMastodonAdapter
    _$UnifediApiStatusContextMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiStatusContextMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiStatusContextMastodonAdapterTearOff {
  const _$UnifediApiStatusContextMastodonAdapterTearOff();

  _UnifediApiStatusContextMastodonAdapter call(
      @HiveField(0) MastodonApiStatusContext value) {
    return _UnifediApiStatusContextMastodonAdapter(
      value,
    );
  }

  UnifediApiStatusContextMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiStatusContextMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiStatusContextMastodonAdapter =
    _$UnifediApiStatusContextMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiStatusContextMastodonAdapter {
  @HiveField(0)
  MastodonApiStatusContext get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiStatusContextMastodonAdapterCopyWith<
          UnifediApiStatusContextMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiStatusContextMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiStatusContextMastodonAdapterCopyWith(
          UnifediApiStatusContextMastodonAdapter value,
          $Res Function(UnifediApiStatusContextMastodonAdapter) then) =
      _$UnifediApiStatusContextMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiStatusContext value});

  $MastodonApiStatusContextCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiStatusContextMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiStatusContextMastodonAdapterCopyWith<$Res> {
  _$UnifediApiStatusContextMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiStatusContextMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiStatusContextMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiStatusContext,
    ));
  }

  @override
  $MastodonApiStatusContextCopyWith<$Res> get value {
    return $MastodonApiStatusContextCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiStatusContextMastodonAdapterCopyWith<$Res>
    implements $UnifediApiStatusContextMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiStatusContextMastodonAdapterCopyWith(
          _UnifediApiStatusContextMastodonAdapter value,
          $Res Function(_UnifediApiStatusContextMastodonAdapter) then) =
      __$UnifediApiStatusContextMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiStatusContext value});

  @override
  $MastodonApiStatusContextCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiStatusContextMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiStatusContextMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiStatusContextMastodonAdapterCopyWith<$Res> {
  __$UnifediApiStatusContextMastodonAdapterCopyWithImpl(
      _UnifediApiStatusContextMastodonAdapter _value,
      $Res Function(_UnifediApiStatusContextMastodonAdapter) _then)
      : super(
            _value, (v) => _then(v as _UnifediApiStatusContextMastodonAdapter));

  @override
  _UnifediApiStatusContextMastodonAdapter get _value =>
      super._value as _UnifediApiStatusContextMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiStatusContextMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiStatusContext,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiStatusContextMastodonAdapter
    extends _UnifediApiStatusContextMastodonAdapter {
  const _$_UnifediApiStatusContextMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiStatusContextMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiStatusContextMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiStatusContext value;

  @override
  String toString() {
    return 'UnifediApiStatusContextMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiStatusContextMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiStatusContextMastodonAdapterCopyWith<
          _UnifediApiStatusContextMastodonAdapter>
      get copyWith => __$UnifediApiStatusContextMastodonAdapterCopyWithImpl<
          _UnifediApiStatusContextMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiStatusContextMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiStatusContextMastodonAdapter
    extends UnifediApiStatusContextMastodonAdapter {
  const factory _UnifediApiStatusContextMastodonAdapter(
          @HiveField(0) MastodonApiStatusContext value) =
      _$_UnifediApiStatusContextMastodonAdapter;
  const _UnifediApiStatusContextMastodonAdapter._() : super._();

  factory _UnifediApiStatusContextMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiStatusContextMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiStatusContext get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiStatusContextMastodonAdapterCopyWith<
          _UnifediApiStatusContextMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
