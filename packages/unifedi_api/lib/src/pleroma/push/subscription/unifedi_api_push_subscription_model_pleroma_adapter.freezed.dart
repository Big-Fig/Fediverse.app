// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_push_subscription_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPushSubscriptionPleromaAdapter
    _$UnifediApiPushSubscriptionPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiPushSubscriptionPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiPushSubscriptionPleromaAdapterTearOff {
  const _$UnifediApiPushSubscriptionPleromaAdapterTearOff();

  _UnifediApiPushSubscriptionPleromaAdapter call(
      @HiveField(0) PleromaApiPushSubscription value) {
    return _UnifediApiPushSubscriptionPleromaAdapter(
      value,
    );
  }

  UnifediApiPushSubscriptionPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiPushSubscriptionPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPushSubscriptionPleromaAdapter =
    _$UnifediApiPushSubscriptionPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiPushSubscriptionPleromaAdapter {
  @HiveField(0)
  PleromaApiPushSubscription get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPushSubscriptionPleromaAdapterCopyWith<
          UnifediApiPushSubscriptionPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPushSubscriptionPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiPushSubscriptionPleromaAdapterCopyWith(
          UnifediApiPushSubscriptionPleromaAdapter value,
          $Res Function(UnifediApiPushSubscriptionPleromaAdapter) then) =
      _$UnifediApiPushSubscriptionPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiPushSubscription value});

  $PleromaApiPushSubscriptionCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiPushSubscriptionPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiPushSubscriptionPleromaAdapterCopyWith<$Res> {
  _$UnifediApiPushSubscriptionPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiPushSubscriptionPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPushSubscriptionPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiPushSubscription,
    ));
  }

  @override
  $PleromaApiPushSubscriptionCopyWith<$Res> get value {
    return $PleromaApiPushSubscriptionCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiPushSubscriptionPleromaAdapterCopyWith<$Res>
    implements $UnifediApiPushSubscriptionPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiPushSubscriptionPleromaAdapterCopyWith(
          _UnifediApiPushSubscriptionPleromaAdapter value,
          $Res Function(_UnifediApiPushSubscriptionPleromaAdapter) then) =
      __$UnifediApiPushSubscriptionPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiPushSubscription value});

  @override
  $PleromaApiPushSubscriptionCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiPushSubscriptionPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiPushSubscriptionPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiPushSubscriptionPleromaAdapterCopyWith<$Res> {
  __$UnifediApiPushSubscriptionPleromaAdapterCopyWithImpl(
      _UnifediApiPushSubscriptionPleromaAdapter _value,
      $Res Function(_UnifediApiPushSubscriptionPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiPushSubscriptionPleromaAdapter));

  @override
  _UnifediApiPushSubscriptionPleromaAdapter get _value =>
      super._value as _UnifediApiPushSubscriptionPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiPushSubscriptionPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiPushSubscription,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPushSubscriptionPleromaAdapter
    extends _UnifediApiPushSubscriptionPleromaAdapter {
  const _$_UnifediApiPushSubscriptionPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiPushSubscriptionPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiPushSubscriptionPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiPushSubscription value;

  @override
  String toString() {
    return 'UnifediApiPushSubscriptionPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiPushSubscriptionPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPushSubscriptionPleromaAdapterCopyWith<
          _UnifediApiPushSubscriptionPleromaAdapter>
      get copyWith => __$UnifediApiPushSubscriptionPleromaAdapterCopyWithImpl<
          _UnifediApiPushSubscriptionPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPushSubscriptionPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiPushSubscriptionPleromaAdapter
    extends UnifediApiPushSubscriptionPleromaAdapter {
  const factory _UnifediApiPushSubscriptionPleromaAdapter(
          @HiveField(0) PleromaApiPushSubscription value) =
      _$_UnifediApiPushSubscriptionPleromaAdapter;
  const _UnifediApiPushSubscriptionPleromaAdapter._() : super._();

  factory _UnifediApiPushSubscriptionPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiPushSubscriptionPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiPushSubscription get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPushSubscriptionPleromaAdapterCopyWith<
          _UnifediApiPushSubscriptionPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
