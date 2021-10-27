// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_push_subscription_alerts_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPushSubscriptionAlertsPleromaAdapter
    _$UnifediApiPushSubscriptionAlertsPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiPushSubscriptionAlertsPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiPushSubscriptionAlertsPleromaAdapterTearOff {
  const _$UnifediApiPushSubscriptionAlertsPleromaAdapterTearOff();

  _UnifediApiPushSubscriptionAlertsPleromaAdapter call(
      @HiveField(0) PleromaApiPushSubscriptionAlerts value) {
    return _UnifediApiPushSubscriptionAlertsPleromaAdapter(
      value,
    );
  }

  UnifediApiPushSubscriptionAlertsPleromaAdapter fromJson(
      Map<String, Object?> json) {
    return UnifediApiPushSubscriptionAlertsPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPushSubscriptionAlertsPleromaAdapter =
    _$UnifediApiPushSubscriptionAlertsPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiPushSubscriptionAlertsPleromaAdapter {
  @HiveField(0)
  PleromaApiPushSubscriptionAlerts get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPushSubscriptionAlertsPleromaAdapterCopyWith<
          UnifediApiPushSubscriptionAlertsPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPushSubscriptionAlertsPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiPushSubscriptionAlertsPleromaAdapterCopyWith(
          UnifediApiPushSubscriptionAlertsPleromaAdapter value,
          $Res Function(UnifediApiPushSubscriptionAlertsPleromaAdapter) then) =
      _$UnifediApiPushSubscriptionAlertsPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiPushSubscriptionAlerts value});

  $PleromaApiPushSubscriptionAlertsCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiPushSubscriptionAlertsPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiPushSubscriptionAlertsPleromaAdapterCopyWith<$Res> {
  _$UnifediApiPushSubscriptionAlertsPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiPushSubscriptionAlertsPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPushSubscriptionAlertsPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiPushSubscriptionAlerts,
    ));
  }

  @override
  $PleromaApiPushSubscriptionAlertsCopyWith<$Res> get value {
    return $PleromaApiPushSubscriptionAlertsCopyWith<$Res>(_value.value,
        (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiPushSubscriptionAlertsPleromaAdapterCopyWith<$Res>
    implements $UnifediApiPushSubscriptionAlertsPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiPushSubscriptionAlertsPleromaAdapterCopyWith(
          _UnifediApiPushSubscriptionAlertsPleromaAdapter value,
          $Res Function(_UnifediApiPushSubscriptionAlertsPleromaAdapter) then) =
      __$UnifediApiPushSubscriptionAlertsPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiPushSubscriptionAlerts value});

  @override
  $PleromaApiPushSubscriptionAlertsCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiPushSubscriptionAlertsPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiPushSubscriptionAlertsPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiPushSubscriptionAlertsPleromaAdapterCopyWith<$Res> {
  __$UnifediApiPushSubscriptionAlertsPleromaAdapterCopyWithImpl(
      _UnifediApiPushSubscriptionAlertsPleromaAdapter _value,
      $Res Function(_UnifediApiPushSubscriptionAlertsPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiPushSubscriptionAlertsPleromaAdapter));

  @override
  _UnifediApiPushSubscriptionAlertsPleromaAdapter get _value =>
      super._value as _UnifediApiPushSubscriptionAlertsPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiPushSubscriptionAlertsPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiPushSubscriptionAlerts,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPushSubscriptionAlertsPleromaAdapter
    extends _UnifediApiPushSubscriptionAlertsPleromaAdapter {
  const _$_UnifediApiPushSubscriptionAlertsPleromaAdapter(
      @HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiPushSubscriptionAlertsPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiPushSubscriptionAlertsPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiPushSubscriptionAlerts value;

  @override
  String toString() {
    return 'UnifediApiPushSubscriptionAlertsPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiPushSubscriptionAlertsPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPushSubscriptionAlertsPleromaAdapterCopyWith<
          _UnifediApiPushSubscriptionAlertsPleromaAdapter>
      get copyWith =>
          __$UnifediApiPushSubscriptionAlertsPleromaAdapterCopyWithImpl<
                  _UnifediApiPushSubscriptionAlertsPleromaAdapter>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPushSubscriptionAlertsPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiPushSubscriptionAlertsPleromaAdapter
    extends UnifediApiPushSubscriptionAlertsPleromaAdapter {
  const factory _UnifediApiPushSubscriptionAlertsPleromaAdapter(
          @HiveField(0) PleromaApiPushSubscriptionAlerts value) =
      _$_UnifediApiPushSubscriptionAlertsPleromaAdapter;
  const _UnifediApiPushSubscriptionAlertsPleromaAdapter._() : super._();

  factory _UnifediApiPushSubscriptionAlertsPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiPushSubscriptionAlertsPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiPushSubscriptionAlerts get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPushSubscriptionAlertsPleromaAdapterCopyWith<
          _UnifediApiPushSubscriptionAlertsPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
