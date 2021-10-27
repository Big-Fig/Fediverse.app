// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_web_sockets_channel_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiWebSocketsChannelMastodonAdapter
    _$UnifediApiWebSocketsChannelMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiWebSocketsChannelMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiWebSocketsChannelMastodonAdapterTearOff {
  const _$UnifediApiWebSocketsChannelMastodonAdapterTearOff();

  _UnifediApiWebSocketsChannelMastodonAdapter call(
      @HiveField(0) MastodonApiWebSocketsChannel value) {
    return _UnifediApiWebSocketsChannelMastodonAdapter(
      value,
    );
  }

  UnifediApiWebSocketsChannelMastodonAdapter fromJson(
      Map<String, Object?> json) {
    return UnifediApiWebSocketsChannelMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiWebSocketsChannelMastodonAdapter =
    _$UnifediApiWebSocketsChannelMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiWebSocketsChannelMastodonAdapter {
  @HiveField(0)
  MastodonApiWebSocketsChannel get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiWebSocketsChannelMastodonAdapterCopyWith<
          UnifediApiWebSocketsChannelMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiWebSocketsChannelMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiWebSocketsChannelMastodonAdapterCopyWith(
          UnifediApiWebSocketsChannelMastodonAdapter value,
          $Res Function(UnifediApiWebSocketsChannelMastodonAdapter) then) =
      _$UnifediApiWebSocketsChannelMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiWebSocketsChannel value});

  $MastodonApiWebSocketsChannelCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiWebSocketsChannelMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiWebSocketsChannelMastodonAdapterCopyWith<$Res> {
  _$UnifediApiWebSocketsChannelMastodonAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiWebSocketsChannelMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiWebSocketsChannelMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiWebSocketsChannel,
    ));
  }

  @override
  $MastodonApiWebSocketsChannelCopyWith<$Res> get value {
    return $MastodonApiWebSocketsChannelCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiWebSocketsChannelMastodonAdapterCopyWith<$Res>
    implements $UnifediApiWebSocketsChannelMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiWebSocketsChannelMastodonAdapterCopyWith(
          _UnifediApiWebSocketsChannelMastodonAdapter value,
          $Res Function(_UnifediApiWebSocketsChannelMastodonAdapter) then) =
      __$UnifediApiWebSocketsChannelMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiWebSocketsChannel value});

  @override
  $MastodonApiWebSocketsChannelCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiWebSocketsChannelMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiWebSocketsChannelMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiWebSocketsChannelMastodonAdapterCopyWith<$Res> {
  __$UnifediApiWebSocketsChannelMastodonAdapterCopyWithImpl(
      _UnifediApiWebSocketsChannelMastodonAdapter _value,
      $Res Function(_UnifediApiWebSocketsChannelMastodonAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiWebSocketsChannelMastodonAdapter));

  @override
  _UnifediApiWebSocketsChannelMastodonAdapter get _value =>
      super._value as _UnifediApiWebSocketsChannelMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiWebSocketsChannelMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiWebSocketsChannel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiWebSocketsChannelMastodonAdapter
    extends _UnifediApiWebSocketsChannelMastodonAdapter {
  const _$_UnifediApiWebSocketsChannelMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiWebSocketsChannelMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiWebSocketsChannelMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiWebSocketsChannel value;

  @override
  String toString() {
    return 'UnifediApiWebSocketsChannelMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiWebSocketsChannelMastodonAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiWebSocketsChannelMastodonAdapterCopyWith<
          _UnifediApiWebSocketsChannelMastodonAdapter>
      get copyWith => __$UnifediApiWebSocketsChannelMastodonAdapterCopyWithImpl<
          _UnifediApiWebSocketsChannelMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiWebSocketsChannelMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiWebSocketsChannelMastodonAdapter
    extends UnifediApiWebSocketsChannelMastodonAdapter {
  const factory _UnifediApiWebSocketsChannelMastodonAdapter(
          @HiveField(0) MastodonApiWebSocketsChannel value) =
      _$_UnifediApiWebSocketsChannelMastodonAdapter;
  const _UnifediApiWebSocketsChannelMastodonAdapter._() : super._();

  factory _UnifediApiWebSocketsChannelMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiWebSocketsChannelMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiWebSocketsChannel get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiWebSocketsChannelMastodonAdapterCopyWith<
          _UnifediApiWebSocketsChannelMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
