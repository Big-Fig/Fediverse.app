// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_push_subscription_keys_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPushSubscriptionKeysMastodonAdapter
    _$UnifediApiPushSubscriptionKeysMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiPushSubscriptionKeysMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiPushSubscriptionKeysMastodonAdapterTearOff {
  const _$UnifediApiPushSubscriptionKeysMastodonAdapterTearOff();

  _UnifediApiPushSubscriptionKeysMastodonAdapter call(
      @HiveField(0) MastodonApiPushSubscriptionKeys value) {
    return _UnifediApiPushSubscriptionKeysMastodonAdapter(
      value,
    );
  }

  UnifediApiPushSubscriptionKeysMastodonAdapter fromJson(
      Map<String, Object?> json) {
    return UnifediApiPushSubscriptionKeysMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPushSubscriptionKeysMastodonAdapter =
    _$UnifediApiPushSubscriptionKeysMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiPushSubscriptionKeysMastodonAdapter {
  @HiveField(0)
  MastodonApiPushSubscriptionKeys get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPushSubscriptionKeysMastodonAdapterCopyWith<
          UnifediApiPushSubscriptionKeysMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPushSubscriptionKeysMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiPushSubscriptionKeysMastodonAdapterCopyWith(
          UnifediApiPushSubscriptionKeysMastodonAdapter value,
          $Res Function(UnifediApiPushSubscriptionKeysMastodonAdapter) then) =
      _$UnifediApiPushSubscriptionKeysMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiPushSubscriptionKeys value});

  $MastodonApiPushSubscriptionKeysCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiPushSubscriptionKeysMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiPushSubscriptionKeysMastodonAdapterCopyWith<$Res> {
  _$UnifediApiPushSubscriptionKeysMastodonAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiPushSubscriptionKeysMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPushSubscriptionKeysMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiPushSubscriptionKeys,
    ));
  }

  @override
  $MastodonApiPushSubscriptionKeysCopyWith<$Res> get value {
    return $MastodonApiPushSubscriptionKeysCopyWith<$Res>(_value.value,
        (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiPushSubscriptionKeysMastodonAdapterCopyWith<$Res>
    implements $UnifediApiPushSubscriptionKeysMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiPushSubscriptionKeysMastodonAdapterCopyWith(
          _UnifediApiPushSubscriptionKeysMastodonAdapter value,
          $Res Function(_UnifediApiPushSubscriptionKeysMastodonAdapter) then) =
      __$UnifediApiPushSubscriptionKeysMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiPushSubscriptionKeys value});

  @override
  $MastodonApiPushSubscriptionKeysCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiPushSubscriptionKeysMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiPushSubscriptionKeysMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiPushSubscriptionKeysMastodonAdapterCopyWith<$Res> {
  __$UnifediApiPushSubscriptionKeysMastodonAdapterCopyWithImpl(
      _UnifediApiPushSubscriptionKeysMastodonAdapter _value,
      $Res Function(_UnifediApiPushSubscriptionKeysMastodonAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiPushSubscriptionKeysMastodonAdapter));

  @override
  _UnifediApiPushSubscriptionKeysMastodonAdapter get _value =>
      super._value as _UnifediApiPushSubscriptionKeysMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiPushSubscriptionKeysMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiPushSubscriptionKeys,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPushSubscriptionKeysMastodonAdapter
    extends _UnifediApiPushSubscriptionKeysMastodonAdapter {
  const _$_UnifediApiPushSubscriptionKeysMastodonAdapter(
      @HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiPushSubscriptionKeysMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiPushSubscriptionKeysMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiPushSubscriptionKeys value;

  @override
  String toString() {
    return 'UnifediApiPushSubscriptionKeysMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiPushSubscriptionKeysMastodonAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPushSubscriptionKeysMastodonAdapterCopyWith<
          _UnifediApiPushSubscriptionKeysMastodonAdapter>
      get copyWith =>
          __$UnifediApiPushSubscriptionKeysMastodonAdapterCopyWithImpl<
              _UnifediApiPushSubscriptionKeysMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPushSubscriptionKeysMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiPushSubscriptionKeysMastodonAdapter
    extends UnifediApiPushSubscriptionKeysMastodonAdapter {
  const factory _UnifediApiPushSubscriptionKeysMastodonAdapter(
          @HiveField(0) MastodonApiPushSubscriptionKeys value) =
      _$_UnifediApiPushSubscriptionKeysMastodonAdapter;
  const _UnifediApiPushSubscriptionKeysMastodonAdapter._() : super._();

  factory _UnifediApiPushSubscriptionKeysMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiPushSubscriptionKeysMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiPushSubscriptionKeys get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPushSubscriptionKeysMastodonAdapterCopyWith<
          _UnifediApiPushSubscriptionKeysMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
