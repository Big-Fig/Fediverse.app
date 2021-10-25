// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_push_payload_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiPushPayload _$PleromaApiPushPayloadFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiPushPayload.fromJson(json);
}

/// @nodoc
class _$PleromaApiPushPayloadTearOff {
  const _$PleromaApiPushPayloadTearOff();

  _PleromaApiPushPayload call(
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
    return _PleromaApiPushPayload(
      notificationId: notificationId,
      notificationType: notificationType,
      title: title,
      body: body,
      icon: icon,
    );
  }

  PleromaApiPushPayload fromJson(Map<String, Object> json) {
    return PleromaApiPushPayload.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiPushPayload = _$PleromaApiPushPayloadTearOff();

/// @nodoc
mixin _$PleromaApiPushPayload {
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
  $PleromaApiPushPayloadCopyWith<PleromaApiPushPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiPushPayloadCopyWith<$Res> {
  factory $PleromaApiPushPayloadCopyWith(PleromaApiPushPayload value,
          $Res Function(PleromaApiPushPayload) then) =
      _$PleromaApiPushPayloadCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) @JsonKey(name: 'notification_id') String notificationId,
      @HiveField(1) @JsonKey(name: 'notification_type') String notificationType,
      @HiveField(2) String? title,
      @HiveField(3) String? body,
      @HiveField(4) String? icon});
}

/// @nodoc
class _$PleromaApiPushPayloadCopyWithImpl<$Res>
    implements $PleromaApiPushPayloadCopyWith<$Res> {
  _$PleromaApiPushPayloadCopyWithImpl(this._value, this._then);

  final PleromaApiPushPayload _value;
  // ignore: unused_field
  final $Res Function(PleromaApiPushPayload) _then;

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
abstract class _$PleromaApiPushPayloadCopyWith<$Res>
    implements $PleromaApiPushPayloadCopyWith<$Res> {
  factory _$PleromaApiPushPayloadCopyWith(_PleromaApiPushPayload value,
          $Res Function(_PleromaApiPushPayload) then) =
      __$PleromaApiPushPayloadCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) @JsonKey(name: 'notification_id') String notificationId,
      @HiveField(1) @JsonKey(name: 'notification_type') String notificationType,
      @HiveField(2) String? title,
      @HiveField(3) String? body,
      @HiveField(4) String? icon});
}

/// @nodoc
class __$PleromaApiPushPayloadCopyWithImpl<$Res>
    extends _$PleromaApiPushPayloadCopyWithImpl<$Res>
    implements _$PleromaApiPushPayloadCopyWith<$Res> {
  __$PleromaApiPushPayloadCopyWithImpl(_PleromaApiPushPayload _value,
      $Res Function(_PleromaApiPushPayload) _then)
      : super(_value, (v) => _then(v as _PleromaApiPushPayload));

  @override
  _PleromaApiPushPayload get _value => super._value as _PleromaApiPushPayload;

  @override
  $Res call({
    Object? notificationId = freezed,
    Object? notificationType = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? icon = freezed,
  }) {
    return _then(_PleromaApiPushPayload(
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
class _$_PleromaApiPushPayload implements _PleromaApiPushPayload {
  const _$_PleromaApiPushPayload(
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

  factory _$_PleromaApiPushPayload.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiPushPayloadFromJson(json);

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
    return 'PleromaApiPushPayload(notificationId: $notificationId, notificationType: $notificationType, title: $title, body: $body, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiPushPayload &&
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
  _$PleromaApiPushPayloadCopyWith<_PleromaApiPushPayload> get copyWith =>
      __$PleromaApiPushPayloadCopyWithImpl<_PleromaApiPushPayload>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiPushPayloadToJson(this);
  }
}

abstract class _PleromaApiPushPayload implements PleromaApiPushPayload {
  const factory _PleromaApiPushPayload(
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
          required String? icon}) = _$_PleromaApiPushPayload;

  factory _PleromaApiPushPayload.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiPushPayload.fromJson;

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
  _$PleromaApiPushPayloadCopyWith<_PleromaApiPushPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
