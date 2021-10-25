// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_web_sockets_event_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiWebSocketsEventMastodonAdapter
    _$UnifediApiWebSocketsEventMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiWebSocketsEventMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiWebSocketsEventMastodonAdapterTearOff {
  const _$UnifediApiWebSocketsEventMastodonAdapterTearOff();

  _UnifediApiWebSocketsEventMastodonAdapter call(
      @HiveField(0) MastodonApiWebSocketsEvent value) {
    return _UnifediApiWebSocketsEventMastodonAdapter(
      value,
    );
  }

  UnifediApiWebSocketsEventMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiWebSocketsEventMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiWebSocketsEventMastodonAdapter =
    _$UnifediApiWebSocketsEventMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiWebSocketsEventMastodonAdapter {
  @HiveField(0)
  MastodonApiWebSocketsEvent get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiWebSocketsEventMastodonAdapterCopyWith<
          UnifediApiWebSocketsEventMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiWebSocketsEventMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiWebSocketsEventMastodonAdapterCopyWith(
          UnifediApiWebSocketsEventMastodonAdapter value,
          $Res Function(UnifediApiWebSocketsEventMastodonAdapter) then) =
      _$UnifediApiWebSocketsEventMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiWebSocketsEvent value});

  $MastodonApiWebSocketsEventCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiWebSocketsEventMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiWebSocketsEventMastodonAdapterCopyWith<$Res> {
  _$UnifediApiWebSocketsEventMastodonAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiWebSocketsEventMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiWebSocketsEventMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiWebSocketsEvent,
    ));
  }

  @override
  $MastodonApiWebSocketsEventCopyWith<$Res> get value {
    return $MastodonApiWebSocketsEventCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiWebSocketsEventMastodonAdapterCopyWith<$Res>
    implements $UnifediApiWebSocketsEventMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiWebSocketsEventMastodonAdapterCopyWith(
          _UnifediApiWebSocketsEventMastodonAdapter value,
          $Res Function(_UnifediApiWebSocketsEventMastodonAdapter) then) =
      __$UnifediApiWebSocketsEventMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiWebSocketsEvent value});

  @override
  $MastodonApiWebSocketsEventCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiWebSocketsEventMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiWebSocketsEventMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiWebSocketsEventMastodonAdapterCopyWith<$Res> {
  __$UnifediApiWebSocketsEventMastodonAdapterCopyWithImpl(
      _UnifediApiWebSocketsEventMastodonAdapter _value,
      $Res Function(_UnifediApiWebSocketsEventMastodonAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiWebSocketsEventMastodonAdapter));

  @override
  _UnifediApiWebSocketsEventMastodonAdapter get _value =>
      super._value as _UnifediApiWebSocketsEventMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiWebSocketsEventMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiWebSocketsEvent,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiWebSocketsEventMastodonAdapter
    extends _UnifediApiWebSocketsEventMastodonAdapter {
  const _$_UnifediApiWebSocketsEventMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiWebSocketsEventMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiWebSocketsEventMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiWebSocketsEvent value;

  @override
  String toString() {
    return 'UnifediApiWebSocketsEventMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiWebSocketsEventMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiWebSocketsEventMastodonAdapterCopyWith<
          _UnifediApiWebSocketsEventMastodonAdapter>
      get copyWith => __$UnifediApiWebSocketsEventMastodonAdapterCopyWithImpl<
          _UnifediApiWebSocketsEventMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiWebSocketsEventMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiWebSocketsEventMastodonAdapter
    extends UnifediApiWebSocketsEventMastodonAdapter {
  const factory _UnifediApiWebSocketsEventMastodonAdapter(
          @HiveField(0) MastodonApiWebSocketsEvent value) =
      _$_UnifediApiWebSocketsEventMastodonAdapter;
  const _UnifediApiWebSocketsEventMastodonAdapter._() : super._();

  factory _UnifediApiWebSocketsEventMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiWebSocketsEventMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiWebSocketsEvent get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiWebSocketsEventMastodonAdapterCopyWith<
          _UnifediApiWebSocketsEventMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
