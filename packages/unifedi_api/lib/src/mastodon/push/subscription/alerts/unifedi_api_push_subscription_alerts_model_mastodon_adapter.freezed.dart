// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_push_subscription_alerts_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPushSubscriptionAlertsMastodonAdapter
    _$UnifediApiPushSubscriptionAlertsMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiPushSubscriptionAlertsMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiPushSubscriptionAlertsMastodonAdapterTearOff {
  const _$UnifediApiPushSubscriptionAlertsMastodonAdapterTearOff();

  _UnifediApiPushSubscriptionAlertsMastodonAdapter call(
      @HiveField(0) MastodonApiPushSubscriptionAlerts value) {
    return _UnifediApiPushSubscriptionAlertsMastodonAdapter(
      value,
    );
  }

  UnifediApiPushSubscriptionAlertsMastodonAdapter fromJson(
      Map<String, Object?> json) {
    return UnifediApiPushSubscriptionAlertsMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPushSubscriptionAlertsMastodonAdapter =
    _$UnifediApiPushSubscriptionAlertsMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiPushSubscriptionAlertsMastodonAdapter {
  @HiveField(0)
  MastodonApiPushSubscriptionAlerts get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPushSubscriptionAlertsMastodonAdapterCopyWith<
          UnifediApiPushSubscriptionAlertsMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPushSubscriptionAlertsMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiPushSubscriptionAlertsMastodonAdapterCopyWith(
          UnifediApiPushSubscriptionAlertsMastodonAdapter value,
          $Res Function(UnifediApiPushSubscriptionAlertsMastodonAdapter) then) =
      _$UnifediApiPushSubscriptionAlertsMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiPushSubscriptionAlerts value});

  $MastodonApiPushSubscriptionAlertsCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiPushSubscriptionAlertsMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiPushSubscriptionAlertsMastodonAdapterCopyWith<$Res> {
  _$UnifediApiPushSubscriptionAlertsMastodonAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiPushSubscriptionAlertsMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPushSubscriptionAlertsMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiPushSubscriptionAlerts,
    ));
  }

  @override
  $MastodonApiPushSubscriptionAlertsCopyWith<$Res> get value {
    return $MastodonApiPushSubscriptionAlertsCopyWith<$Res>(_value.value,
        (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiPushSubscriptionAlertsMastodonAdapterCopyWith<$Res>
    implements $UnifediApiPushSubscriptionAlertsMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiPushSubscriptionAlertsMastodonAdapterCopyWith(
          _UnifediApiPushSubscriptionAlertsMastodonAdapter value,
          $Res Function(_UnifediApiPushSubscriptionAlertsMastodonAdapter)
              then) =
      __$UnifediApiPushSubscriptionAlertsMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiPushSubscriptionAlerts value});

  @override
  $MastodonApiPushSubscriptionAlertsCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiPushSubscriptionAlertsMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiPushSubscriptionAlertsMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiPushSubscriptionAlertsMastodonAdapterCopyWith<$Res> {
  __$UnifediApiPushSubscriptionAlertsMastodonAdapterCopyWithImpl(
      _UnifediApiPushSubscriptionAlertsMastodonAdapter _value,
      $Res Function(_UnifediApiPushSubscriptionAlertsMastodonAdapter) _then)
      : super(
            _value,
            (v) =>
                _then(v as _UnifediApiPushSubscriptionAlertsMastodonAdapter));

  @override
  _UnifediApiPushSubscriptionAlertsMastodonAdapter get _value =>
      super._value as _UnifediApiPushSubscriptionAlertsMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiPushSubscriptionAlertsMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiPushSubscriptionAlerts,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPushSubscriptionAlertsMastodonAdapter
    extends _UnifediApiPushSubscriptionAlertsMastodonAdapter {
  const _$_UnifediApiPushSubscriptionAlertsMastodonAdapter(
      @HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiPushSubscriptionAlertsMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiPushSubscriptionAlertsMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiPushSubscriptionAlerts value;

  @override
  String toString() {
    return 'UnifediApiPushSubscriptionAlertsMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiPushSubscriptionAlertsMastodonAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPushSubscriptionAlertsMastodonAdapterCopyWith<
          _UnifediApiPushSubscriptionAlertsMastodonAdapter>
      get copyWith =>
          __$UnifediApiPushSubscriptionAlertsMastodonAdapterCopyWithImpl<
                  _UnifediApiPushSubscriptionAlertsMastodonAdapter>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPushSubscriptionAlertsMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiPushSubscriptionAlertsMastodonAdapter
    extends UnifediApiPushSubscriptionAlertsMastodonAdapter {
  const factory _UnifediApiPushSubscriptionAlertsMastodonAdapter(
          @HiveField(0) MastodonApiPushSubscriptionAlerts value) =
      _$_UnifediApiPushSubscriptionAlertsMastodonAdapter;
  const _UnifediApiPushSubscriptionAlertsMastodonAdapter._() : super._();

  factory _UnifediApiPushSubscriptionAlertsMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiPushSubscriptionAlertsMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiPushSubscriptionAlerts get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPushSubscriptionAlertsMastodonAdapterCopyWith<
          _UnifediApiPushSubscriptionAlertsMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
