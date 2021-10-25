// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_push_payload_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPushPayload _$UnifediApiPushPayloadFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiPushPayload.fromJson(json);
}

/// @nodoc
class _$UnifediApiPushPayloadTearOff {
  const _$UnifediApiPushPayloadTearOff();

  _UnifediApiPushPayload call(
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
    return _UnifediApiPushPayload(
      notificationId: notificationId,
      notificationType: notificationType,
      title: title,
      body: body,
      icon: icon,
    );
  }

  UnifediApiPushPayload fromJson(Map<String, Object> json) {
    return UnifediApiPushPayload.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPushPayload = _$UnifediApiPushPayloadTearOff();

/// @nodoc
mixin _$UnifediApiPushPayload {
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
  $UnifediApiPushPayloadCopyWith<UnifediApiPushPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPushPayloadCopyWith<$Res> {
  factory $UnifediApiPushPayloadCopyWith(UnifediApiPushPayload value,
          $Res Function(UnifediApiPushPayload) then) =
      _$UnifediApiPushPayloadCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) @JsonKey(name: 'notification_id') String notificationId,
      @HiveField(1) @JsonKey(name: 'notification_type') String notificationType,
      @HiveField(2) String? title,
      @HiveField(3) String? body,
      @HiveField(4) String? icon});
}

/// @nodoc
class _$UnifediApiPushPayloadCopyWithImpl<$Res>
    implements $UnifediApiPushPayloadCopyWith<$Res> {
  _$UnifediApiPushPayloadCopyWithImpl(this._value, this._then);

  final UnifediApiPushPayload _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPushPayload) _then;

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
abstract class _$UnifediApiPushPayloadCopyWith<$Res>
    implements $UnifediApiPushPayloadCopyWith<$Res> {
  factory _$UnifediApiPushPayloadCopyWith(_UnifediApiPushPayload value,
          $Res Function(_UnifediApiPushPayload) then) =
      __$UnifediApiPushPayloadCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) @JsonKey(name: 'notification_id') String notificationId,
      @HiveField(1) @JsonKey(name: 'notification_type') String notificationType,
      @HiveField(2) String? title,
      @HiveField(3) String? body,
      @HiveField(4) String? icon});
}

/// @nodoc
class __$UnifediApiPushPayloadCopyWithImpl<$Res>
    extends _$UnifediApiPushPayloadCopyWithImpl<$Res>
    implements _$UnifediApiPushPayloadCopyWith<$Res> {
  __$UnifediApiPushPayloadCopyWithImpl(_UnifediApiPushPayload _value,
      $Res Function(_UnifediApiPushPayload) _then)
      : super(_value, (v) => _then(v as _UnifediApiPushPayload));

  @override
  _UnifediApiPushPayload get _value => super._value as _UnifediApiPushPayload;

  @override
  $Res call({
    Object? notificationId = freezed,
    Object? notificationType = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? icon = freezed,
  }) {
    return _then(_UnifediApiPushPayload(
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
class _$_UnifediApiPushPayload implements _UnifediApiPushPayload {
  const _$_UnifediApiPushPayload(
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

  factory _$_UnifediApiPushPayload.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiPushPayloadFromJson(json);

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
    return 'UnifediApiPushPayload(notificationId: $notificationId, notificationType: $notificationType, title: $title, body: $body, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiPushPayload &&
            (identical(other.notificationId, notificationId) ||
                const DeepCollectionEquality()
                    .equals(other.notificationId, notificationId)) &&
            (identical(other.notificationType, notificationType) ||
                const DeepCollectionEquality()
                    .equals(other.notificationType, notificationType)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(notificationId) ^
      const DeepCollectionEquality().hash(notificationType) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(icon);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPushPayloadCopyWith<_UnifediApiPushPayload> get copyWith =>
      __$UnifediApiPushPayloadCopyWithImpl<_UnifediApiPushPayload>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPushPayloadToJson(this);
  }
}

abstract class _UnifediApiPushPayload implements UnifediApiPushPayload {
  const factory _UnifediApiPushPayload(
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
          required String? icon}) = _$_UnifediApiPushPayload;

  factory _UnifediApiPushPayload.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiPushPayload.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'notification_id')
  String get notificationId => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'notification_type')
  String get notificationType => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String? get title => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  String? get body => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  String? get icon => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPushPayloadCopyWith<_UnifediApiPushPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
