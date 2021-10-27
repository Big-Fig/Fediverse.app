// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_push_payload_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiPushPayload _$MastodonApiPushPayloadFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiPushPayload.fromJson(json);
}

/// @nodoc
class _$MastodonApiPushPayloadTearOff {
  const _$MastodonApiPushPayloadTearOff();

  _MastodonApiPushPayload call(
      {@HiveField(0)
      @JsonKey(name: 'notification_id')
          required String notificationId,
      @HiveField(1)
      @JsonKey(name: 'notification_type')
          required String notificationType,
      @HiveField(2)
          required String? title,
      @HiveField(3)
          required String? body,
      @HiveField(4)
          required String? icon}) {
    return _MastodonApiPushPayload(
      notificationId: notificationId,
      notificationType: notificationType,
      title: title,
      body: body,
      icon: icon,
    );
  }

  MastodonApiPushPayload fromJson(Map<String, Object?> json) {
    return MastodonApiPushPayload.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiPushPayload = _$MastodonApiPushPayloadTearOff();

/// @nodoc
mixin _$MastodonApiPushPayload {
  @HiveField(0)
  @JsonKey(name: 'notification_id')
  String get notificationId => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'notification_type')
  String get notificationType => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get title => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get body => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiPushPayloadCopyWith<MastodonApiPushPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiPushPayloadCopyWith<$Res> {
  factory $MastodonApiPushPayloadCopyWith(MastodonApiPushPayload value,
          $Res Function(MastodonApiPushPayload) then) =
      _$MastodonApiPushPayloadCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) @JsonKey(name: 'notification_id') String notificationId,
      @HiveField(1) @JsonKey(name: 'notification_type') String notificationType,
      @HiveField(2) String? title,
      @HiveField(3) String? body,
      @HiveField(4) String? icon});
}

/// @nodoc
class _$MastodonApiPushPayloadCopyWithImpl<$Res>
    implements $MastodonApiPushPayloadCopyWith<$Res> {
  _$MastodonApiPushPayloadCopyWithImpl(this._value, this._then);

  final MastodonApiPushPayload _value;
  // ignore: unused_field
  final $Res Function(MastodonApiPushPayload) _then;

  @override
  $Res call({
    Object? notificationId = freezed,
    Object? notificationType = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      notificationId: notificationId == freezed
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      notificationType: notificationType == freezed
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MastodonApiPushPayloadCopyWith<$Res>
    implements $MastodonApiPushPayloadCopyWith<$Res> {
  factory _$MastodonApiPushPayloadCopyWith(_MastodonApiPushPayload value,
          $Res Function(_MastodonApiPushPayload) then) =
      __$MastodonApiPushPayloadCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) @JsonKey(name: 'notification_id') String notificationId,
      @HiveField(1) @JsonKey(name: 'notification_type') String notificationType,
      @HiveField(2) String? title,
      @HiveField(3) String? body,
      @HiveField(4) String? icon});
}

/// @nodoc
class __$MastodonApiPushPayloadCopyWithImpl<$Res>
    extends _$MastodonApiPushPayloadCopyWithImpl<$Res>
    implements _$MastodonApiPushPayloadCopyWith<$Res> {
  __$MastodonApiPushPayloadCopyWithImpl(_MastodonApiPushPayload _value,
      $Res Function(_MastodonApiPushPayload) _then)
      : super(_value, (v) => _then(v as _MastodonApiPushPayload));

  @override
  _MastodonApiPushPayload get _value => super._value as _MastodonApiPushPayload;

  @override
  $Res call({
    Object? notificationId = freezed,
    Object? notificationType = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? icon = freezed,
  }) {
    return _then(_MastodonApiPushPayload(
      notificationId: notificationId == freezed
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      notificationType: notificationType == freezed
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiPushPayload implements _MastodonApiPushPayload {
  const _$_MastodonApiPushPayload(
      {@HiveField(0)
      @JsonKey(name: 'notification_id')
          required this.notificationId,
      @HiveField(1)
      @JsonKey(name: 'notification_type')
          required this.notificationType,
      @HiveField(2)
          required this.title,
      @HiveField(3)
          required this.body,
      @HiveField(4)
          required this.icon});

  factory _$_MastodonApiPushPayload.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiPushPayloadFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'notification_id')
  final String notificationId;
  @override
  @HiveField(1)
  @JsonKey(name: 'notification_type')
  final String notificationType;
  @override
  @HiveField(2)
  final String? title;
  @override
  @HiveField(3)
  final String? body;
  @override
  @HiveField(4)
  final String? icon;

  @override
  String toString() {
    return 'MastodonApiPushPayload(notificationId: $notificationId, notificationType: $notificationType, title: $title, body: $body, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiPushPayload &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.notificationType, notificationType) ||
                other.notificationType == notificationType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, notificationId, notificationType, title, body, icon);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiPushPayloadCopyWith<_MastodonApiPushPayload> get copyWith =>
      __$MastodonApiPushPayloadCopyWithImpl<_MastodonApiPushPayload>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiPushPayloadToJson(this);
  }
}

abstract class _MastodonApiPushPayload implements MastodonApiPushPayload {
  const factory _MastodonApiPushPayload(
      {@HiveField(0)
      @JsonKey(name: 'notification_id')
          required String notificationId,
      @HiveField(1)
      @JsonKey(name: 'notification_type')
          required String notificationType,
      @HiveField(2)
          required String? title,
      @HiveField(3)
          required String? body,
      @HiveField(4)
          required String? icon}) = _$_MastodonApiPushPayload;

  factory _MastodonApiPushPayload.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiPushPayload.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'notification_id')
  String get notificationId;
  @override
  @HiveField(1)
  @JsonKey(name: 'notification_type')
  String get notificationType;
  @override
  @HiveField(2)
  String? get title;
  @override
  @HiveField(3)
  String? get body;
  @override
  @HiveField(4)
  String? get icon;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiPushPayloadCopyWith<_MastodonApiPushPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
