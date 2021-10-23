// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'push_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PushMessage _$PushMessageFromJson(Map<String, dynamic> json) {
  return _PushMessage.fromJson(json);
}

/// @nodoc
class _$PushMessageTearOff {
  const _$PushMessageTearOff();

  _PushMessage call(
      {@HiveField(1) required PushNotification? notification,
      @HiveField(2) required Map<String, dynamic>? data,
      @HiveField(3) required String typeString}) {
    return _PushMessage(
      notification: notification,
      data: data,
      typeString: typeString,
    );
  }

  PushMessage fromJson(Map<String, Object> json) {
    return PushMessage.fromJson(json);
  }
}

/// @nodoc
const $PushMessage = _$PushMessageTearOff();

/// @nodoc
mixin _$PushMessage {
  @HiveField(1)
  PushNotification? get notification => throw _privateConstructorUsedError;
  @HiveField(2)
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;
  @HiveField(3)
  String get typeString => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PushMessageCopyWith<PushMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushMessageCopyWith<$Res> {
  factory $PushMessageCopyWith(
          PushMessage value, $Res Function(PushMessage) then) =
      _$PushMessageCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(1) PushNotification? notification,
      @HiveField(2) Map<String, dynamic>? data,
      @HiveField(3) String typeString});

  $PushNotificationCopyWith<$Res>? get notification;
}

/// @nodoc
class _$PushMessageCopyWithImpl<$Res> implements $PushMessageCopyWith<$Res> {
  _$PushMessageCopyWithImpl(this._value, this._then);

  final PushMessage _value;
  // ignore: unused_field
  final $Res Function(PushMessage) _then;

  @override
  $Res call({
    Object? notification = freezed,
    Object? data = freezed,
    Object? typeString = freezed,
  }) {
    return _then(_value.copyWith(
      notification: notification == freezed
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as PushNotification?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      typeString: typeString == freezed
          ? _value.typeString
          : typeString // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $PushNotificationCopyWith<$Res>? get notification {
    if (_value.notification == null) {
      return null;
    }

    return $PushNotificationCopyWith<$Res>(_value.notification!, (value) {
      return _then(_value.copyWith(notification: value));
    });
  }
}

/// @nodoc
abstract class _$PushMessageCopyWith<$Res>
    implements $PushMessageCopyWith<$Res> {
  factory _$PushMessageCopyWith(
          _PushMessage value, $Res Function(_PushMessage) then) =
      __$PushMessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(1) PushNotification? notification,
      @HiveField(2) Map<String, dynamic>? data,
      @HiveField(3) String typeString});

  @override
  $PushNotificationCopyWith<$Res>? get notification;
}

/// @nodoc
class __$PushMessageCopyWithImpl<$Res> extends _$PushMessageCopyWithImpl<$Res>
    implements _$PushMessageCopyWith<$Res> {
  __$PushMessageCopyWithImpl(
      _PushMessage _value, $Res Function(_PushMessage) _then)
      : super(_value, (v) => _then(v as _PushMessage));

  @override
  _PushMessage get _value => super._value as _PushMessage;

  @override
  $Res call({
    Object? notification = freezed,
    Object? data = freezed,
    Object? typeString = freezed,
  }) {
    return _then(_PushMessage(
      notification: notification == freezed
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as PushNotification?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      typeString: typeString == freezed
          ? _value.typeString
          : typeString // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PushMessage extends _PushMessage with DiagnosticableTreeMixin {
  const _$_PushMessage(
      {@HiveField(1) required this.notification,
      @HiveField(2) required this.data,
      @HiveField(3) required this.typeString})
      : super._();

  factory _$_PushMessage.fromJson(Map<String, dynamic> json) =>
      _$$_PushMessageFromJson(json);

  @override
  @HiveField(1)
  final PushNotification? notification;
  @override
  @HiveField(2)
  final Map<String, dynamic>? data;
  @override
  @HiveField(3)
  final String typeString;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PushMessage(notification: $notification, data: $data, typeString: $typeString)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PushMessage'))
      ..add(DiagnosticsProperty('notification', notification))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('typeString', typeString));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PushMessage &&
            (identical(other.notification, notification) ||
                const DeepCollectionEquality()
                    .equals(other.notification, notification)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.typeString, typeString) ||
                const DeepCollectionEquality()
                    .equals(other.typeString, typeString)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(notification) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(typeString);

  @JsonKey(ignore: true)
  @override
  _$PushMessageCopyWith<_PushMessage> get copyWith =>
      __$PushMessageCopyWithImpl<_PushMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PushMessageToJson(this);
  }
}

abstract class _PushMessage extends PushMessage {
  const factory _PushMessage(
      {@HiveField(1) required PushNotification? notification,
      @HiveField(2) required Map<String, dynamic>? data,
      @HiveField(3) required String typeString}) = _$_PushMessage;
  const _PushMessage._() : super._();

  factory _PushMessage.fromJson(Map<String, dynamic> json) =
      _$_PushMessage.fromJson;

  @override
  @HiveField(1)
  PushNotification? get notification => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  String get typeString => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PushMessageCopyWith<_PushMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

PushNotification _$PushNotificationFromJson(Map<String, dynamic> json) {
  return _PushNotification.fromJson(json);
}

/// @nodoc
class _$PushNotificationTearOff {
  const _$PushNotificationTearOff();

  _PushNotification call(
      {@HiveField(0) required String? title,
      @HiveField(1) required String? body}) {
    return _PushNotification(
      title: title,
      body: body,
    );
  }

  PushNotification fromJson(Map<String, Object> json) {
    return PushNotification.fromJson(json);
  }
}

/// @nodoc
const $PushNotification = _$PushNotificationTearOff();

/// @nodoc
mixin _$PushNotification {
  @HiveField(0)
  String? get title => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PushNotificationCopyWith<PushNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushNotificationCopyWith<$Res> {
  factory $PushNotificationCopyWith(
          PushNotification value, $Res Function(PushNotification) then) =
      _$PushNotificationCopyWithImpl<$Res>;
  $Res call({@HiveField(0) String? title, @HiveField(1) String? body});
}

/// @nodoc
class _$PushNotificationCopyWithImpl<$Res>
    implements $PushNotificationCopyWith<$Res> {
  _$PushNotificationCopyWithImpl(this._value, this._then);

  final PushNotification _value;
  // ignore: unused_field
  final $Res Function(PushNotification) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PushNotificationCopyWith<$Res>
    implements $PushNotificationCopyWith<$Res> {
  factory _$PushNotificationCopyWith(
          _PushNotification value, $Res Function(_PushNotification) then) =
      __$PushNotificationCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) String? title, @HiveField(1) String? body});
}

/// @nodoc
class __$PushNotificationCopyWithImpl<$Res>
    extends _$PushNotificationCopyWithImpl<$Res>
    implements _$PushNotificationCopyWith<$Res> {
  __$PushNotificationCopyWithImpl(
      _PushNotification _value, $Res Function(_PushNotification) _then)
      : super(_value, (v) => _then(v as _PushNotification));

  @override
  _PushNotification get _value => super._value as _PushNotification;

  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
  }) {
    return _then(_PushNotification(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PushNotification
    with DiagnosticableTreeMixin
    implements _PushNotification {
  const _$_PushNotification(
      {@HiveField(0) required this.title, @HiveField(1) required this.body});

  factory _$_PushNotification.fromJson(Map<String, dynamic> json) =>
      _$$_PushNotificationFromJson(json);

  @override
  @HiveField(0)
  final String? title;
  @override
  @HiveField(1)
  final String? body;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PushNotification(title: $title, body: $body)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PushNotification'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('body', body));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PushNotification &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(body);

  @JsonKey(ignore: true)
  @override
  _$PushNotificationCopyWith<_PushNotification> get copyWith =>
      __$PushNotificationCopyWithImpl<_PushNotification>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PushNotificationToJson(this);
  }
}

abstract class _PushNotification implements PushNotification {
  const factory _PushNotification(
      {@HiveField(0) required String? title,
      @HiveField(1) required String? body}) = _$_PushNotification;

  factory _PushNotification.fromJson(Map<String, dynamic> json) =
      _$_PushNotification.fromJson;

  @override
  @HiveField(0)
  String? get title => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String? get body => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PushNotificationCopyWith<_PushNotification> get copyWith =>
      throw _privateConstructorUsedError;
}
