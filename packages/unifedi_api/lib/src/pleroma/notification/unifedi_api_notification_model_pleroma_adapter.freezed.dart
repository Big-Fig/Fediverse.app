// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_notification_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiNotificationPleromaAdapter
    _$UnifediApiNotificationPleromaAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiNotificationPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiNotificationPleromaAdapterTearOff {
  const _$UnifediApiNotificationPleromaAdapterTearOff();

  _UnifediApiNotificationPleromaAdapter call(
      @HiveField(0) PleromaApiNotification value) {
    return _UnifediApiNotificationPleromaAdapter(
      value,
    );
  }

  UnifediApiNotificationPleromaAdapter fromJson(Map<String, Object> json) {
    return UnifediApiNotificationPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiNotificationPleromaAdapter =
    _$UnifediApiNotificationPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiNotificationPleromaAdapter {
  @HiveField(0)
  PleromaApiNotification get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiNotificationPleromaAdapterCopyWith<
          UnifediApiNotificationPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiNotificationPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiNotificationPleromaAdapterCopyWith(
          UnifediApiNotificationPleromaAdapter value,
          $Res Function(UnifediApiNotificationPleromaAdapter) then) =
      _$UnifediApiNotificationPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiNotification value});

  $PleromaApiNotificationCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiNotificationPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiNotificationPleromaAdapterCopyWith<$Res> {
  _$UnifediApiNotificationPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiNotificationPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiNotificationPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiNotification,
    ));
  }

  @override
  $PleromaApiNotificationCopyWith<$Res> get value {
    return $PleromaApiNotificationCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiNotificationPleromaAdapterCopyWith<$Res>
    implements $UnifediApiNotificationPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiNotificationPleromaAdapterCopyWith(
          _UnifediApiNotificationPleromaAdapter value,
          $Res Function(_UnifediApiNotificationPleromaAdapter) then) =
      __$UnifediApiNotificationPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiNotification value});

  @override
  $PleromaApiNotificationCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiNotificationPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiNotificationPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiNotificationPleromaAdapterCopyWith<$Res> {
  __$UnifediApiNotificationPleromaAdapterCopyWithImpl(
      _UnifediApiNotificationPleromaAdapter _value,
      $Res Function(_UnifediApiNotificationPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiNotificationPleromaAdapter));

  @override
  _UnifediApiNotificationPleromaAdapter get _value =>
      super._value as _UnifediApiNotificationPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiNotificationPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiNotification,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiNotificationPleromaAdapter
    extends _UnifediApiNotificationPleromaAdapter {
  const _$_UnifediApiNotificationPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiNotificationPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiNotificationPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiNotification value;

  @override
  String toString() {
    return 'UnifediApiNotificationPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiNotificationPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiNotificationPleromaAdapterCopyWith<
          _UnifediApiNotificationPleromaAdapter>
      get copyWith => __$UnifediApiNotificationPleromaAdapterCopyWithImpl<
          _UnifediApiNotificationPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiNotificationPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiNotificationPleromaAdapter
    extends UnifediApiNotificationPleromaAdapter {
  const factory _UnifediApiNotificationPleromaAdapter(
          @HiveField(0) PleromaApiNotification value) =
      _$_UnifediApiNotificationPleromaAdapter;
  const _UnifediApiNotificationPleromaAdapter._() : super._();

  factory _UnifediApiNotificationPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiNotificationPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiNotification get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiNotificationPleromaAdapterCopyWith<
          _UnifediApiNotificationPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
