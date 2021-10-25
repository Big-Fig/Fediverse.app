// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_push_payload_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPushPayloadMastodonAdapter
    _$UnifediApiPushPayloadMastodonAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiPushPayloadMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiPushPayloadMastodonAdapterTearOff {
  const _$UnifediApiPushPayloadMastodonAdapterTearOff();

  _UnifediApiPushPayloadMastodonAdapter call(
      @HiveField(0) MastodonApiPushPayload value) {
    return _UnifediApiPushPayloadMastodonAdapter(
      value,
    );
  }

  UnifediApiPushPayloadMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiPushPayloadMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPushPayloadMastodonAdapter =
    _$UnifediApiPushPayloadMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiPushPayloadMastodonAdapter {
  @HiveField(0)
  MastodonApiPushPayload get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPushPayloadMastodonAdapterCopyWith<
          UnifediApiPushPayloadMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPushPayloadMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiPushPayloadMastodonAdapterCopyWith(
          UnifediApiPushPayloadMastodonAdapter value,
          $Res Function(UnifediApiPushPayloadMastodonAdapter) then) =
      _$UnifediApiPushPayloadMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiPushPayload value});

  $MastodonApiPushPayloadCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiPushPayloadMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiPushPayloadMastodonAdapterCopyWith<$Res> {
  _$UnifediApiPushPayloadMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiPushPayloadMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPushPayloadMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiPushPayload,
    ));
  }

  @override
  $MastodonApiPushPayloadCopyWith<$Res> get value {
    return $MastodonApiPushPayloadCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiPushPayloadMastodonAdapterCopyWith<$Res>
    implements $UnifediApiPushPayloadMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiPushPayloadMastodonAdapterCopyWith(
          _UnifediApiPushPayloadMastodonAdapter value,
          $Res Function(_UnifediApiPushPayloadMastodonAdapter) then) =
      __$UnifediApiPushPayloadMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiPushPayload value});

  @override
  $MastodonApiPushPayloadCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiPushPayloadMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiPushPayloadMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiPushPayloadMastodonAdapterCopyWith<$Res> {
  __$UnifediApiPushPayloadMastodonAdapterCopyWithImpl(
      _UnifediApiPushPayloadMastodonAdapter _value,
      $Res Function(_UnifediApiPushPayloadMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiPushPayloadMastodonAdapter));

  @override
  _UnifediApiPushPayloadMastodonAdapter get _value =>
      super._value as _UnifediApiPushPayloadMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiPushPayloadMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiPushPayload,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPushPayloadMastodonAdapter
    extends _UnifediApiPushPayloadMastodonAdapter {
  const _$_UnifediApiPushPayloadMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiPushPayloadMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiPushPayloadMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiPushPayload value;

  @override
  String toString() {
    return 'UnifediApiPushPayloadMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiPushPayloadMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPushPayloadMastodonAdapterCopyWith<
          _UnifediApiPushPayloadMastodonAdapter>
      get copyWith => __$UnifediApiPushPayloadMastodonAdapterCopyWithImpl<
          _UnifediApiPushPayloadMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPushPayloadMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiPushPayloadMastodonAdapter
    extends UnifediApiPushPayloadMastodonAdapter {
  const factory _UnifediApiPushPayloadMastodonAdapter(
          @HiveField(0) MastodonApiPushPayload value) =
      _$_UnifediApiPushPayloadMastodonAdapter;
  const _UnifediApiPushPayloadMastodonAdapter._() : super._();

  factory _UnifediApiPushPayloadMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiPushPayloadMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiPushPayload get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPushPayloadMastodonAdapterCopyWith<
          _UnifediApiPushPayloadMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
