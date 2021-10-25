// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_push_subscription_keys_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPushSubscriptionKeysPleromaAdapter
    _$UnifediApiPushSubscriptionKeysPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiPushSubscriptionKeysPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiPushSubscriptionKeysPleromaAdapterTearOff {
  const _$UnifediApiPushSubscriptionKeysPleromaAdapterTearOff();

  _UnifediApiPushSubscriptionKeysPleromaAdapter call(
      @HiveField(0) PleromaApiPushSubscriptionKeys value) {
    return _UnifediApiPushSubscriptionKeysPleromaAdapter(
      value,
    );
  }

  UnifediApiPushSubscriptionKeysPleromaAdapter fromJson(
      Map<String, Object> json) {
    return UnifediApiPushSubscriptionKeysPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPushSubscriptionKeysPleromaAdapter =
    _$UnifediApiPushSubscriptionKeysPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiPushSubscriptionKeysPleromaAdapter {
  @HiveField(0)
  PleromaApiPushSubscriptionKeys get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPushSubscriptionKeysPleromaAdapterCopyWith<
          UnifediApiPushSubscriptionKeysPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPushSubscriptionKeysPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiPushSubscriptionKeysPleromaAdapterCopyWith(
          UnifediApiPushSubscriptionKeysPleromaAdapter value,
          $Res Function(UnifediApiPushSubscriptionKeysPleromaAdapter) then) =
      _$UnifediApiPushSubscriptionKeysPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiPushSubscriptionKeys value});

  $PleromaApiPushSubscriptionKeysCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiPushSubscriptionKeysPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiPushSubscriptionKeysPleromaAdapterCopyWith<$Res> {
  _$UnifediApiPushSubscriptionKeysPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiPushSubscriptionKeysPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPushSubscriptionKeysPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiPushSubscriptionKeys,
    ));
  }

  @override
  $PleromaApiPushSubscriptionKeysCopyWith<$Res> get value {
    return $PleromaApiPushSubscriptionKeysCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiPushSubscriptionKeysPleromaAdapterCopyWith<$Res>
    implements $UnifediApiPushSubscriptionKeysPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiPushSubscriptionKeysPleromaAdapterCopyWith(
          _UnifediApiPushSubscriptionKeysPleromaAdapter value,
          $Res Function(_UnifediApiPushSubscriptionKeysPleromaAdapter) then) =
      __$UnifediApiPushSubscriptionKeysPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiPushSubscriptionKeys value});

  @override
  $PleromaApiPushSubscriptionKeysCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiPushSubscriptionKeysPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiPushSubscriptionKeysPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiPushSubscriptionKeysPleromaAdapterCopyWith<$Res> {
  __$UnifediApiPushSubscriptionKeysPleromaAdapterCopyWithImpl(
      _UnifediApiPushSubscriptionKeysPleromaAdapter _value,
      $Res Function(_UnifediApiPushSubscriptionKeysPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiPushSubscriptionKeysPleromaAdapter));

  @override
  _UnifediApiPushSubscriptionKeysPleromaAdapter get _value =>
      super._value as _UnifediApiPushSubscriptionKeysPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiPushSubscriptionKeysPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiPushSubscriptionKeys,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPushSubscriptionKeysPleromaAdapter
    extends _UnifediApiPushSubscriptionKeysPleromaAdapter {
  const _$_UnifediApiPushSubscriptionKeysPleromaAdapter(
      @HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiPushSubscriptionKeysPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiPushSubscriptionKeysPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiPushSubscriptionKeys value;

  @override
  String toString() {
    return 'UnifediApiPushSubscriptionKeysPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiPushSubscriptionKeysPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPushSubscriptionKeysPleromaAdapterCopyWith<
          _UnifediApiPushSubscriptionKeysPleromaAdapter>
      get copyWith =>
          __$UnifediApiPushSubscriptionKeysPleromaAdapterCopyWithImpl<
              _UnifediApiPushSubscriptionKeysPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPushSubscriptionKeysPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiPushSubscriptionKeysPleromaAdapter
    extends UnifediApiPushSubscriptionKeysPleromaAdapter {
  const factory _UnifediApiPushSubscriptionKeysPleromaAdapter(
          @HiveField(0) PleromaApiPushSubscriptionKeys value) =
      _$_UnifediApiPushSubscriptionKeysPleromaAdapter;
  const _UnifediApiPushSubscriptionKeysPleromaAdapter._() : super._();

  factory _UnifediApiPushSubscriptionKeysPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiPushSubscriptionKeysPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiPushSubscriptionKeys get value =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPushSubscriptionKeysPleromaAdapterCopyWith<
          _UnifediApiPushSubscriptionKeysPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
