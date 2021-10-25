// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_web_sockets_event_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiWebSocketsEventPleromaAdapter
    _$UnifediApiWebSocketsEventPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiWebSocketsEventPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiWebSocketsEventPleromaAdapterTearOff {
  const _$UnifediApiWebSocketsEventPleromaAdapterTearOff();

  _UnifediApiWebSocketsEventPleromaAdapter call(
      @HiveField(0) PleromaApiWebSocketsEvent value) {
    return _UnifediApiWebSocketsEventPleromaAdapter(
      value,
    );
  }

  UnifediApiWebSocketsEventPleromaAdapter fromJson(Map<String, Object> json) {
    return UnifediApiWebSocketsEventPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiWebSocketsEventPleromaAdapter =
    _$UnifediApiWebSocketsEventPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiWebSocketsEventPleromaAdapter {
  @HiveField(0)
  PleromaApiWebSocketsEvent get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiWebSocketsEventPleromaAdapterCopyWith<
          UnifediApiWebSocketsEventPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiWebSocketsEventPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiWebSocketsEventPleromaAdapterCopyWith(
          UnifediApiWebSocketsEventPleromaAdapter value,
          $Res Function(UnifediApiWebSocketsEventPleromaAdapter) then) =
      _$UnifediApiWebSocketsEventPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiWebSocketsEvent value});

  $PleromaApiWebSocketsEventCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiWebSocketsEventPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiWebSocketsEventPleromaAdapterCopyWith<$Res> {
  _$UnifediApiWebSocketsEventPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiWebSocketsEventPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiWebSocketsEventPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiWebSocketsEvent,
    ));
  }

  @override
  $PleromaApiWebSocketsEventCopyWith<$Res> get value {
    return $PleromaApiWebSocketsEventCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiWebSocketsEventPleromaAdapterCopyWith<$Res>
    implements $UnifediApiWebSocketsEventPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiWebSocketsEventPleromaAdapterCopyWith(
          _UnifediApiWebSocketsEventPleromaAdapter value,
          $Res Function(_UnifediApiWebSocketsEventPleromaAdapter) then) =
      __$UnifediApiWebSocketsEventPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiWebSocketsEvent value});

  @override
  $PleromaApiWebSocketsEventCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiWebSocketsEventPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiWebSocketsEventPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiWebSocketsEventPleromaAdapterCopyWith<$Res> {
  __$UnifediApiWebSocketsEventPleromaAdapterCopyWithImpl(
      _UnifediApiWebSocketsEventPleromaAdapter _value,
      $Res Function(_UnifediApiWebSocketsEventPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiWebSocketsEventPleromaAdapter));

  @override
  _UnifediApiWebSocketsEventPleromaAdapter get _value =>
      super._value as _UnifediApiWebSocketsEventPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiWebSocketsEventPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiWebSocketsEvent,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiWebSocketsEventPleromaAdapter
    extends _UnifediApiWebSocketsEventPleromaAdapter {
  const _$_UnifediApiWebSocketsEventPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiWebSocketsEventPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiWebSocketsEventPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiWebSocketsEvent value;

  @override
  String toString() {
    return 'UnifediApiWebSocketsEventPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiWebSocketsEventPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiWebSocketsEventPleromaAdapterCopyWith<
          _UnifediApiWebSocketsEventPleromaAdapter>
      get copyWith => __$UnifediApiWebSocketsEventPleromaAdapterCopyWithImpl<
          _UnifediApiWebSocketsEventPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiWebSocketsEventPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiWebSocketsEventPleromaAdapter
    extends UnifediApiWebSocketsEventPleromaAdapter {
  const factory _UnifediApiWebSocketsEventPleromaAdapter(
          @HiveField(0) PleromaApiWebSocketsEvent value) =
      _$_UnifediApiWebSocketsEventPleromaAdapter;
  const _UnifediApiWebSocketsEventPleromaAdapter._() : super._();

  factory _UnifediApiWebSocketsEventPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiWebSocketsEventPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiWebSocketsEvent get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiWebSocketsEventPleromaAdapterCopyWith<
          _UnifediApiWebSocketsEventPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
