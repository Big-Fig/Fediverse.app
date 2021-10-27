// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notifications_push_handler_unhandled_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationsPushHandlerUnhandledList
    _$NotificationsPushHandlerUnhandledListFromJson(Map<String, dynamic> json) {
  return _NotificationsPushHandlerUnhandledList.fromJson(json);
}

/// @nodoc
class _$NotificationsPushHandlerUnhandledListTearOff {
  const _$NotificationsPushHandlerUnhandledListTearOff();

  _NotificationsPushHandlerUnhandledList call(
      {@HiveField(0) required List<NotificationsPushHandlerMessage> messages}) {
    return _NotificationsPushHandlerUnhandledList(
      messages: messages,
    );
  }

  NotificationsPushHandlerUnhandledList fromJson(Map<String, Object?> json) {
    return NotificationsPushHandlerUnhandledList.fromJson(json);
  }
}

/// @nodoc
const $NotificationsPushHandlerUnhandledList =
    _$NotificationsPushHandlerUnhandledListTearOff();

/// @nodoc
mixin _$NotificationsPushHandlerUnhandledList {
  @HiveField(0)
  List<NotificationsPushHandlerMessage> get messages =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationsPushHandlerUnhandledListCopyWith<
          NotificationsPushHandlerUnhandledList>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsPushHandlerUnhandledListCopyWith<$Res> {
  factory $NotificationsPushHandlerUnhandledListCopyWith(
          NotificationsPushHandlerUnhandledList value,
          $Res Function(NotificationsPushHandlerUnhandledList) then) =
      _$NotificationsPushHandlerUnhandledListCopyWithImpl<$Res>;
  $Res call({@HiveField(0) List<NotificationsPushHandlerMessage> messages});
}

/// @nodoc
class _$NotificationsPushHandlerUnhandledListCopyWithImpl<$Res>
    implements $NotificationsPushHandlerUnhandledListCopyWith<$Res> {
  _$NotificationsPushHandlerUnhandledListCopyWithImpl(this._value, this._then);

  final NotificationsPushHandlerUnhandledList _value;
  // ignore: unused_field
  final $Res Function(NotificationsPushHandlerUnhandledList) _then;

  @override
  $Res call({
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<NotificationsPushHandlerMessage>,
    ));
  }
}

/// @nodoc
abstract class _$NotificationsPushHandlerUnhandledListCopyWith<$Res>
    implements $NotificationsPushHandlerUnhandledListCopyWith<$Res> {
  factory _$NotificationsPushHandlerUnhandledListCopyWith(
          _NotificationsPushHandlerUnhandledList value,
          $Res Function(_NotificationsPushHandlerUnhandledList) then) =
      __$NotificationsPushHandlerUnhandledListCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) List<NotificationsPushHandlerMessage> messages});
}

/// @nodoc
class __$NotificationsPushHandlerUnhandledListCopyWithImpl<$Res>
    extends _$NotificationsPushHandlerUnhandledListCopyWithImpl<$Res>
    implements _$NotificationsPushHandlerUnhandledListCopyWith<$Res> {
  __$NotificationsPushHandlerUnhandledListCopyWithImpl(
      _NotificationsPushHandlerUnhandledList _value,
      $Res Function(_NotificationsPushHandlerUnhandledList) _then)
      : super(
            _value, (v) => _then(v as _NotificationsPushHandlerUnhandledList));

  @override
  _NotificationsPushHandlerUnhandledList get _value =>
      super._value as _NotificationsPushHandlerUnhandledList;

  @override
  $Res call({
    Object? messages = freezed,
  }) {
    return _then(_NotificationsPushHandlerUnhandledList(
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<NotificationsPushHandlerMessage>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationsPushHandlerUnhandledList
    implements _NotificationsPushHandlerUnhandledList {
  const _$_NotificationsPushHandlerUnhandledList(
      {@HiveField(0) required this.messages});

  factory _$_NotificationsPushHandlerUnhandledList.fromJson(
          Map<String, dynamic> json) =>
      _$$_NotificationsPushHandlerUnhandledListFromJson(json);

  @override
  @HiveField(0)
  final List<NotificationsPushHandlerMessage> messages;

  @override
  String toString() {
    return 'NotificationsPushHandlerUnhandledList(messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationsPushHandlerUnhandledList &&
            const DeepCollectionEquality().equals(other.messages, messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(messages));

  @JsonKey(ignore: true)
  @override
  _$NotificationsPushHandlerUnhandledListCopyWith<
          _NotificationsPushHandlerUnhandledList>
      get copyWith => __$NotificationsPushHandlerUnhandledListCopyWithImpl<
          _NotificationsPushHandlerUnhandledList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationsPushHandlerUnhandledListToJson(this);
  }
}

abstract class _NotificationsPushHandlerUnhandledList
    implements NotificationsPushHandlerUnhandledList {
  const factory _NotificationsPushHandlerUnhandledList(
          {@HiveField(0)
              required List<NotificationsPushHandlerMessage> messages}) =
      _$_NotificationsPushHandlerUnhandledList;

  factory _NotificationsPushHandlerUnhandledList.fromJson(
          Map<String, dynamic> json) =
      _$_NotificationsPushHandlerUnhandledList.fromJson;

  @override
  @HiveField(0)
  List<NotificationsPushHandlerMessage> get messages;
  @override
  @JsonKey(ignore: true)
  _$NotificationsPushHandlerUnhandledListCopyWith<
          _NotificationsPushHandlerUnhandledList>
      get copyWith => throw _privateConstructorUsedError;
}
