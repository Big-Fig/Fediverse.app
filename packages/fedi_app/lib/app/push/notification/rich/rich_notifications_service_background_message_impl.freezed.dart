// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rich_notifications_service_background_message_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NotificationPayloadDataTearOff {
  const _$NotificationPayloadDataTearOff();

  _NotificationPayloadData call(
      {required String acct,
      required String serverHost,
      required IUnifediApiNotification unifediApiNotification}) {
    return _NotificationPayloadData(
      acct: acct,
      serverHost: serverHost,
      unifediApiNotification: unifediApiNotification,
    );
  }
}

/// @nodoc
const $NotificationPayloadData = _$NotificationPayloadDataTearOff();

/// @nodoc
mixin _$NotificationPayloadData {
  String get acct => throw _privateConstructorUsedError;
  String get serverHost => throw _privateConstructorUsedError;
  IUnifediApiNotification get unifediApiNotification =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationPayloadDataCopyWith<NotificationPayloadData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationPayloadDataCopyWith<$Res> {
  factory $NotificationPayloadDataCopyWith(NotificationPayloadData value,
          $Res Function(NotificationPayloadData) then) =
      _$NotificationPayloadDataCopyWithImpl<$Res>;
  $Res call(
      {String acct,
      String serverHost,
      IUnifediApiNotification unifediApiNotification});
}

/// @nodoc
class _$NotificationPayloadDataCopyWithImpl<$Res>
    implements $NotificationPayloadDataCopyWith<$Res> {
  _$NotificationPayloadDataCopyWithImpl(this._value, this._then);

  final NotificationPayloadData _value;
  // ignore: unused_field
  final $Res Function(NotificationPayloadData) _then;

  @override
  $Res call({
    Object? acct = freezed,
    Object? serverHost = freezed,
    Object? unifediApiNotification = freezed,
  }) {
    return _then(_value.copyWith(
      acct: acct == freezed
          ? _value.acct
          : acct // ignore: cast_nullable_to_non_nullable
              as String,
      serverHost: serverHost == freezed
          ? _value.serverHost
          : serverHost // ignore: cast_nullable_to_non_nullable
              as String,
      unifediApiNotification: unifediApiNotification == freezed
          ? _value.unifediApiNotification
          : unifediApiNotification // ignore: cast_nullable_to_non_nullable
              as IUnifediApiNotification,
    ));
  }
}

/// @nodoc
abstract class _$NotificationPayloadDataCopyWith<$Res>
    implements $NotificationPayloadDataCopyWith<$Res> {
  factory _$NotificationPayloadDataCopyWith(_NotificationPayloadData value,
          $Res Function(_NotificationPayloadData) then) =
      __$NotificationPayloadDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String acct,
      String serverHost,
      IUnifediApiNotification unifediApiNotification});
}

/// @nodoc
class __$NotificationPayloadDataCopyWithImpl<$Res>
    extends _$NotificationPayloadDataCopyWithImpl<$Res>
    implements _$NotificationPayloadDataCopyWith<$Res> {
  __$NotificationPayloadDataCopyWithImpl(_NotificationPayloadData _value,
      $Res Function(_NotificationPayloadData) _then)
      : super(_value, (v) => _then(v as _NotificationPayloadData));

  @override
  _NotificationPayloadData get _value =>
      super._value as _NotificationPayloadData;

  @override
  $Res call({
    Object? acct = freezed,
    Object? serverHost = freezed,
    Object? unifediApiNotification = freezed,
  }) {
    return _then(_NotificationPayloadData(
      acct: acct == freezed
          ? _value.acct
          : acct // ignore: cast_nullable_to_non_nullable
              as String,
      serverHost: serverHost == freezed
          ? _value.serverHost
          : serverHost // ignore: cast_nullable_to_non_nullable
              as String,
      unifediApiNotification: unifediApiNotification == freezed
          ? _value.unifediApiNotification
          : unifediApiNotification // ignore: cast_nullable_to_non_nullable
              as IUnifediApiNotification,
    ));
  }
}

/// @nodoc

class _$_NotificationPayloadData extends _NotificationPayloadData {
  const _$_NotificationPayloadData(
      {required this.acct,
      required this.serverHost,
      required this.unifediApiNotification})
      : super._();

  @override
  final String acct;
  @override
  final String serverHost;
  @override
  final IUnifediApiNotification unifediApiNotification;

  @override
  String toString() {
    return 'NotificationPayloadData(acct: $acct, serverHost: $serverHost, unifediApiNotification: $unifediApiNotification)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationPayloadData &&
            (identical(other.acct, acct) || other.acct == acct) &&
            (identical(other.serverHost, serverHost) ||
                other.serverHost == serverHost) &&
            (identical(other.unifediApiNotification, unifediApiNotification) ||
                other.unifediApiNotification == unifediApiNotification));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, acct, serverHost, unifediApiNotification);

  @JsonKey(ignore: true)
  @override
  _$NotificationPayloadDataCopyWith<_NotificationPayloadData> get copyWith =>
      __$NotificationPayloadDataCopyWithImpl<_NotificationPayloadData>(
          this, _$identity);
}

abstract class _NotificationPayloadData extends NotificationPayloadData {
  const factory _NotificationPayloadData(
          {required String acct,
          required String serverHost,
          required IUnifediApiNotification unifediApiNotification}) =
      _$_NotificationPayloadData;
  const _NotificationPayloadData._() : super._();

  @override
  String get acct;
  @override
  String get serverHost;
  @override
  IUnifediApiNotification get unifediApiNotification;
  @override
  @JsonKey(ignore: true)
  _$NotificationPayloadDataCopyWith<_NotificationPayloadData> get copyWith =>
      throw _privateConstructorUsedError;
}
