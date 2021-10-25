// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_notification_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiNotificationMastodonAdapter
    _$UnifediApiNotificationMastodonAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiNotificationMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiNotificationMastodonAdapterTearOff {
  const _$UnifediApiNotificationMastodonAdapterTearOff();

  _UnifediApiNotificationMastodonAdapter call(
      @HiveField(0) MastodonApiNotification value) {
    return _UnifediApiNotificationMastodonAdapter(
      value,
    );
  }

  UnifediApiNotificationMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiNotificationMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiNotificationMastodonAdapter =
    _$UnifediApiNotificationMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiNotificationMastodonAdapter {
  @HiveField(0)
  MastodonApiNotification get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiNotificationMastodonAdapterCopyWith<
          UnifediApiNotificationMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiNotificationMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiNotificationMastodonAdapterCopyWith(
          UnifediApiNotificationMastodonAdapter value,
          $Res Function(UnifediApiNotificationMastodonAdapter) then) =
      _$UnifediApiNotificationMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiNotification value});

  $MastodonApiNotificationCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiNotificationMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiNotificationMastodonAdapterCopyWith<$Res> {
  _$UnifediApiNotificationMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiNotificationMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiNotificationMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiNotification,
    ));
  }

  @override
  $MastodonApiNotificationCopyWith<$Res> get value {
    return $MastodonApiNotificationCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiNotificationMastodonAdapterCopyWith<$Res>
    implements $UnifediApiNotificationMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiNotificationMastodonAdapterCopyWith(
          _UnifediApiNotificationMastodonAdapter value,
          $Res Function(_UnifediApiNotificationMastodonAdapter) then) =
      __$UnifediApiNotificationMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiNotification value});

  @override
  $MastodonApiNotificationCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiNotificationMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiNotificationMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiNotificationMastodonAdapterCopyWith<$Res> {
  __$UnifediApiNotificationMastodonAdapterCopyWithImpl(
      _UnifediApiNotificationMastodonAdapter _value,
      $Res Function(_UnifediApiNotificationMastodonAdapter) _then)
      : super(
            _value, (v) => _then(v as _UnifediApiNotificationMastodonAdapter));

  @override
  _UnifediApiNotificationMastodonAdapter get _value =>
      super._value as _UnifediApiNotificationMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiNotificationMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiNotification,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiNotificationMastodonAdapter
    extends _UnifediApiNotificationMastodonAdapter {
  const _$_UnifediApiNotificationMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiNotificationMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiNotificationMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiNotification value;

  @override
  String toString() {
    return 'UnifediApiNotificationMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiNotificationMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiNotificationMastodonAdapterCopyWith<
          _UnifediApiNotificationMastodonAdapter>
      get copyWith => __$UnifediApiNotificationMastodonAdapterCopyWithImpl<
          _UnifediApiNotificationMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiNotificationMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiNotificationMastodonAdapter
    extends UnifediApiNotificationMastodonAdapter {
  const factory _UnifediApiNotificationMastodonAdapter(
          @HiveField(0) MastodonApiNotification value) =
      _$_UnifediApiNotificationMastodonAdapter;
  const _UnifediApiNotificationMastodonAdapter._() : super._();

  factory _UnifediApiNotificationMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiNotificationMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiNotification get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiNotificationMastodonAdapterCopyWith<
          _UnifediApiNotificationMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
