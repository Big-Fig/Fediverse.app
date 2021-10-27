// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_push_subscription_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPushSubscriptionMastodonAdapter
    _$UnifediApiPushSubscriptionMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiPushSubscriptionMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiPushSubscriptionMastodonAdapterTearOff {
  const _$UnifediApiPushSubscriptionMastodonAdapterTearOff();

  _UnifediApiPushSubscriptionMastodonAdapter call(
      @HiveField(0) MastodonApiPushSubscription value) {
    return _UnifediApiPushSubscriptionMastodonAdapter(
      value,
    );
  }

  UnifediApiPushSubscriptionMastodonAdapter fromJson(
      Map<String, Object?> json) {
    return UnifediApiPushSubscriptionMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPushSubscriptionMastodonAdapter =
    _$UnifediApiPushSubscriptionMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiPushSubscriptionMastodonAdapter {
  @HiveField(0)
  MastodonApiPushSubscription get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPushSubscriptionMastodonAdapterCopyWith<
          UnifediApiPushSubscriptionMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPushSubscriptionMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiPushSubscriptionMastodonAdapterCopyWith(
          UnifediApiPushSubscriptionMastodonAdapter value,
          $Res Function(UnifediApiPushSubscriptionMastodonAdapter) then) =
      _$UnifediApiPushSubscriptionMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiPushSubscription value});

  $MastodonApiPushSubscriptionCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiPushSubscriptionMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiPushSubscriptionMastodonAdapterCopyWith<$Res> {
  _$UnifediApiPushSubscriptionMastodonAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiPushSubscriptionMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPushSubscriptionMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiPushSubscription,
    ));
  }

  @override
  $MastodonApiPushSubscriptionCopyWith<$Res> get value {
    return $MastodonApiPushSubscriptionCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiPushSubscriptionMastodonAdapterCopyWith<$Res>
    implements $UnifediApiPushSubscriptionMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiPushSubscriptionMastodonAdapterCopyWith(
          _UnifediApiPushSubscriptionMastodonAdapter value,
          $Res Function(_UnifediApiPushSubscriptionMastodonAdapter) then) =
      __$UnifediApiPushSubscriptionMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiPushSubscription value});

  @override
  $MastodonApiPushSubscriptionCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiPushSubscriptionMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiPushSubscriptionMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiPushSubscriptionMastodonAdapterCopyWith<$Res> {
  __$UnifediApiPushSubscriptionMastodonAdapterCopyWithImpl(
      _UnifediApiPushSubscriptionMastodonAdapter _value,
      $Res Function(_UnifediApiPushSubscriptionMastodonAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiPushSubscriptionMastodonAdapter));

  @override
  _UnifediApiPushSubscriptionMastodonAdapter get _value =>
      super._value as _UnifediApiPushSubscriptionMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiPushSubscriptionMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiPushSubscription,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPushSubscriptionMastodonAdapter
    extends _UnifediApiPushSubscriptionMastodonAdapter {
  const _$_UnifediApiPushSubscriptionMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiPushSubscriptionMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiPushSubscriptionMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiPushSubscription value;

  @override
  String toString() {
    return 'UnifediApiPushSubscriptionMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiPushSubscriptionMastodonAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPushSubscriptionMastodonAdapterCopyWith<
          _UnifediApiPushSubscriptionMastodonAdapter>
      get copyWith => __$UnifediApiPushSubscriptionMastodonAdapterCopyWithImpl<
          _UnifediApiPushSubscriptionMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPushSubscriptionMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiPushSubscriptionMastodonAdapter
    extends UnifediApiPushSubscriptionMastodonAdapter {
  const factory _UnifediApiPushSubscriptionMastodonAdapter(
          @HiveField(0) MastodonApiPushSubscription value) =
      _$_UnifediApiPushSubscriptionMastodonAdapter;
  const _UnifediApiPushSubscriptionMastodonAdapter._() : super._();

  factory _UnifediApiPushSubscriptionMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiPushSubscriptionMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiPushSubscription get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPushSubscriptionMastodonAdapterCopyWith<
          _UnifediApiPushSubscriptionMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
