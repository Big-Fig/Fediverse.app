// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fedi_push_notification_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FediPushNotification _$FediPushNotificationFromJson(Map<String, dynamic> json) {
  return _FediPushNotification.fromJson(json);
}

/// @nodoc
class _$FediPushNotificationTearOff {
  const _$FediPushNotificationTearOff();

  _FediPushNotification call(
      {required String account,
      @JsonKey(name: 'notification_action')
          required String? notificationAction,
      @JsonKey(name: 'notification_action_input')
          required String? notificationActionInput,
      @JsonKey(name: 'notification_id')
          required String notificationId,
      @JsonKey(name: 'notification_type')
          required String notificationType,
      required String server,
      @JsonKey(name: 'notification')
          required UnifediApiNotification? unifediApiNotification}) {
    return _FediPushNotification(
      account: account,
      notificationAction: notificationAction,
      notificationActionInput: notificationActionInput,
      notificationId: notificationId,
      notificationType: notificationType,
      server: server,
      unifediApiNotification: unifediApiNotification,
    );
  }

  FediPushNotification fromJson(Map<String, Object> json) {
    return FediPushNotification.fromJson(json);
  }
}

/// @nodoc
const $FediPushNotification = _$FediPushNotificationTearOff();

/// @nodoc
mixin _$FediPushNotification {
  String get account => throw _privateConstructorUsedError;
  @JsonKey(name: 'notification_action')
  String? get notificationAction => throw _privateConstructorUsedError;
  @JsonKey(name: 'notification_action_input')
  String? get notificationActionInput => throw _privateConstructorUsedError;
  @JsonKey(name: 'notification_id')
  String get notificationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'notification_type')
  String get notificationType => throw _privateConstructorUsedError;
  String get server => throw _privateConstructorUsedError;
  @JsonKey(name: 'notification')
  UnifediApiNotification? get unifediApiNotification =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FediPushNotificationCopyWith<FediPushNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FediPushNotificationCopyWith<$Res> {
  factory $FediPushNotificationCopyWith(FediPushNotification value,
          $Res Function(FediPushNotification) then) =
      _$FediPushNotificationCopyWithImpl<$Res>;
  $Res call(
      {String account,
      @JsonKey(name: 'notification_action')
          String? notificationAction,
      @JsonKey(name: 'notification_action_input')
          String? notificationActionInput,
      @JsonKey(name: 'notification_id')
          String notificationId,
      @JsonKey(name: 'notification_type')
          String notificationType,
      String server,
      @JsonKey(name: 'notification')
          UnifediApiNotification? unifediApiNotification});

  $UnifediApiNotificationCopyWith<$Res>? get unifediApiNotification;
}

/// @nodoc
class _$FediPushNotificationCopyWithImpl<$Res>
    implements $FediPushNotificationCopyWith<$Res> {
  _$FediPushNotificationCopyWithImpl(this._value, this._then);

  final FediPushNotification _value;
  // ignore: unused_field
  final $Res Function(FediPushNotification) _then;

  @override
  $Res call({
    Object? account = freezed,
    Object? notificationAction = freezed,
    Object? notificationActionInput = freezed,
    Object? notificationId = freezed,
    Object? notificationType = freezed,
    Object? server = freezed,
    Object? unifediApiNotification = freezed,
  }) {
    return _then(_value.copyWith(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      notificationAction: notificationAction == freezed
          ? _value.notificationAction
          : notificationAction // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationActionInput: notificationActionInput == freezed
          ? _value.notificationActionInput
          : notificationActionInput // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationId: notificationId == freezed
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      notificationType: notificationType == freezed
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as String,
      server: server == freezed
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as String,
      unifediApiNotification: unifediApiNotification == freezed
          ? _value.unifediApiNotification
          : unifediApiNotification // ignore: cast_nullable_to_non_nullable
              as UnifediApiNotification?,
    ));
  }

  @override
  $UnifediApiNotificationCopyWith<$Res>? get unifediApiNotification {
    if (_value.unifediApiNotification == null) {
      return null;
    }

    return $UnifediApiNotificationCopyWith<$Res>(_value.unifediApiNotification!,
        (value) {
      return _then(_value.copyWith(unifediApiNotification: value));
    });
  }
}

/// @nodoc
abstract class _$FediPushNotificationCopyWith<$Res>
    implements $FediPushNotificationCopyWith<$Res> {
  factory _$FediPushNotificationCopyWith(_FediPushNotification value,
          $Res Function(_FediPushNotification) then) =
      __$FediPushNotificationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String account,
      @JsonKey(name: 'notification_action')
          String? notificationAction,
      @JsonKey(name: 'notification_action_input')
          String? notificationActionInput,
      @JsonKey(name: 'notification_id')
          String notificationId,
      @JsonKey(name: 'notification_type')
          String notificationType,
      String server,
      @JsonKey(name: 'notification')
          UnifediApiNotification? unifediApiNotification});

  @override
  $UnifediApiNotificationCopyWith<$Res>? get unifediApiNotification;
}

/// @nodoc
class __$FediPushNotificationCopyWithImpl<$Res>
    extends _$FediPushNotificationCopyWithImpl<$Res>
    implements _$FediPushNotificationCopyWith<$Res> {
  __$FediPushNotificationCopyWithImpl(
      _FediPushNotification _value, $Res Function(_FediPushNotification) _then)
      : super(_value, (v) => _then(v as _FediPushNotification));

  @override
  _FediPushNotification get _value => super._value as _FediPushNotification;

  @override
  $Res call({
    Object? account = freezed,
    Object? notificationAction = freezed,
    Object? notificationActionInput = freezed,
    Object? notificationId = freezed,
    Object? notificationType = freezed,
    Object? server = freezed,
    Object? unifediApiNotification = freezed,
  }) {
    return _then(_FediPushNotification(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      notificationAction: notificationAction == freezed
          ? _value.notificationAction
          : notificationAction // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationActionInput: notificationActionInput == freezed
          ? _value.notificationActionInput
          : notificationActionInput // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationId: notificationId == freezed
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      notificationType: notificationType == freezed
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as String,
      server: server == freezed
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as String,
      unifediApiNotification: unifediApiNotification == freezed
          ? _value.unifediApiNotification
          : unifediApiNotification // ignore: cast_nullable_to_non_nullable
              as UnifediApiNotification?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FediPushNotification implements _FediPushNotification {
  const _$_FediPushNotification(
      {required this.account,
      @JsonKey(name: 'notification_action')
          required this.notificationAction,
      @JsonKey(name: 'notification_action_input')
          required this.notificationActionInput,
      @JsonKey(name: 'notification_id')
          required this.notificationId,
      @JsonKey(name: 'notification_type')
          required this.notificationType,
      required this.server,
      @JsonKey(name: 'notification')
          required this.unifediApiNotification});

  factory _$_FediPushNotification.fromJson(Map<String, dynamic> json) =>
      _$$_FediPushNotificationFromJson(json);

  @override
  final String account;
  @override
  @JsonKey(name: 'notification_action')
  final String? notificationAction;
  @override
  @JsonKey(name: 'notification_action_input')
  final String? notificationActionInput;
  @override
  @JsonKey(name: 'notification_id')
  final String notificationId;
  @override
  @JsonKey(name: 'notification_type')
  final String notificationType;
  @override
  final String server;
  @override
  @JsonKey(name: 'notification')
  final UnifediApiNotification? unifediApiNotification;

  @override
  String toString() {
    return 'FediPushNotification(account: $account, notificationAction: $notificationAction, notificationActionInput: $notificationActionInput, notificationId: $notificationId, notificationType: $notificationType, server: $server, unifediApiNotification: $unifediApiNotification)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FediPushNotification &&
            (identical(other.account, account) ||
                const DeepCollectionEquality()
                    .equals(other.account, account)) &&
            (identical(other.notificationAction, notificationAction) ||
                const DeepCollectionEquality()
                    .equals(other.notificationAction, notificationAction)) &&
            (identical(
                    other.notificationActionInput, notificationActionInput) ||
                const DeepCollectionEquality().equals(
                    other.notificationActionInput, notificationActionInput)) &&
            (identical(other.notificationId, notificationId) ||
                const DeepCollectionEquality()
                    .equals(other.notificationId, notificationId)) &&
            (identical(other.notificationType, notificationType) ||
                const DeepCollectionEquality()
                    .equals(other.notificationType, notificationType)) &&
            (identical(other.server, server) ||
                const DeepCollectionEquality().equals(other.server, server)) &&
            (identical(other.unifediApiNotification, unifediApiNotification) ||
                const DeepCollectionEquality().equals(
                    other.unifediApiNotification, unifediApiNotification)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(account) ^
      const DeepCollectionEquality().hash(notificationAction) ^
      const DeepCollectionEquality().hash(notificationActionInput) ^
      const DeepCollectionEquality().hash(notificationId) ^
      const DeepCollectionEquality().hash(notificationType) ^
      const DeepCollectionEquality().hash(server) ^
      const DeepCollectionEquality().hash(unifediApiNotification);

  @JsonKey(ignore: true)
  @override
  _$FediPushNotificationCopyWith<_FediPushNotification> get copyWith =>
      __$FediPushNotificationCopyWithImpl<_FediPushNotification>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FediPushNotificationToJson(this);
  }
}

abstract class _FediPushNotification implements FediPushNotification {
  const factory _FediPushNotification(
          {required String account,
          @JsonKey(name: 'notification_action')
              required String? notificationAction,
          @JsonKey(name: 'notification_action_input')
              required String? notificationActionInput,
          @JsonKey(name: 'notification_id')
              required String notificationId,
          @JsonKey(name: 'notification_type')
              required String notificationType,
          required String server,
          @JsonKey(name: 'notification')
              required UnifediApiNotification? unifediApiNotification}) =
      _$_FediPushNotification;

  factory _FediPushNotification.fromJson(Map<String, dynamic> json) =
      _$_FediPushNotification.fromJson;

  @override
  String get account => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'notification_action')
  String? get notificationAction => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'notification_action_input')
  String? get notificationActionInput => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'notification_id')
  String get notificationId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'notification_type')
  String get notificationType => throw _privateConstructorUsedError;
  @override
  String get server => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'notification')
  UnifediApiNotification? get unifediApiNotification =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FediPushNotificationCopyWith<_FediPushNotification> get copyWith =>
      throw _privateConstructorUsedError;
}
