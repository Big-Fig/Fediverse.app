// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_notification_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiNotification _$MastodonApiNotificationFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiNotification.fromJson(json);
}

/// @nodoc
class _$MastodonApiNotificationTearOff {
  const _$MastodonApiNotificationTearOff();

  _MastodonApiNotification call(
      {@HiveField(0) required MastodonApiAccount? account,
      @HiveField(2) @JsonKey(name: 'created_at') required DateTime createdAt,
      @HiveField(3) required String id,
      @HiveField(4) required String type,
      @HiveField(5) required MastodonApiStatus? status}) {
    return _MastodonApiNotification(
      account: account,
      createdAt: createdAt,
      id: id,
      type: type,
      status: status,
    );
  }

  MastodonApiNotification fromJson(Map<String, Object?> json) {
    return MastodonApiNotification.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiNotification = _$MastodonApiNotificationTearOff();

/// @nodoc
mixin _$MastodonApiNotification {
  @HiveField(0)
  MastodonApiAccount? get account => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(3)
  String get id => throw _privateConstructorUsedError;
  @HiveField(4)
  String get type => throw _privateConstructorUsedError;
  @HiveField(5)
  MastodonApiStatus? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiNotificationCopyWith<MastodonApiNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiNotificationCopyWith<$Res> {
  factory $MastodonApiNotificationCopyWith(MastodonApiNotification value,
          $Res Function(MastodonApiNotification) then) =
      _$MastodonApiNotificationCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) MastodonApiAccount? account,
      @HiveField(2) @JsonKey(name: 'created_at') DateTime createdAt,
      @HiveField(3) String id,
      @HiveField(4) String type,
      @HiveField(5) MastodonApiStatus? status});

  $MastodonApiAccountCopyWith<$Res>? get account;
  $MastodonApiStatusCopyWith<$Res>? get status;
}

/// @nodoc
class _$MastodonApiNotificationCopyWithImpl<$Res>
    implements $MastodonApiNotificationCopyWith<$Res> {
  _$MastodonApiNotificationCopyWithImpl(this._value, this._then);

  final MastodonApiNotification _value;
  // ignore: unused_field
  final $Res Function(MastodonApiNotification) _then;

  @override
  $Res call({
    Object? account = freezed,
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? type = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccount?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MastodonApiStatus?,
    ));
  }

  @override
  $MastodonApiAccountCopyWith<$Res>? get account {
    if (_value.account == null) {
      return null;
    }

    return $MastodonApiAccountCopyWith<$Res>(_value.account!, (value) {
      return _then(_value.copyWith(account: value));
    });
  }

  @override
  $MastodonApiStatusCopyWith<$Res>? get status {
    if (_value.status == null) {
      return null;
    }

    return $MastodonApiStatusCopyWith<$Res>(_value.status!, (value) {
      return _then(_value.copyWith(status: value));
    });
  }
}

/// @nodoc
abstract class _$MastodonApiNotificationCopyWith<$Res>
    implements $MastodonApiNotificationCopyWith<$Res> {
  factory _$MastodonApiNotificationCopyWith(_MastodonApiNotification value,
          $Res Function(_MastodonApiNotification) then) =
      __$MastodonApiNotificationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) MastodonApiAccount? account,
      @HiveField(2) @JsonKey(name: 'created_at') DateTime createdAt,
      @HiveField(3) String id,
      @HiveField(4) String type,
      @HiveField(5) MastodonApiStatus? status});

  @override
  $MastodonApiAccountCopyWith<$Res>? get account;
  @override
  $MastodonApiStatusCopyWith<$Res>? get status;
}

/// @nodoc
class __$MastodonApiNotificationCopyWithImpl<$Res>
    extends _$MastodonApiNotificationCopyWithImpl<$Res>
    implements _$MastodonApiNotificationCopyWith<$Res> {
  __$MastodonApiNotificationCopyWithImpl(_MastodonApiNotification _value,
      $Res Function(_MastodonApiNotification) _then)
      : super(_value, (v) => _then(v as _MastodonApiNotification));

  @override
  _MastodonApiNotification get _value =>
      super._value as _MastodonApiNotification;

  @override
  $Res call({
    Object? account = freezed,
    Object? createdAt = freezed,
    Object? id = freezed,
    Object? type = freezed,
    Object? status = freezed,
  }) {
    return _then(_MastodonApiNotification(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccount?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MastodonApiStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiNotification implements _MastodonApiNotification {
  const _$_MastodonApiNotification(
      {@HiveField(0) required this.account,
      @HiveField(2) @JsonKey(name: 'created_at') required this.createdAt,
      @HiveField(3) required this.id,
      @HiveField(4) required this.type,
      @HiveField(5) required this.status});

  factory _$_MastodonApiNotification.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiNotificationFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiAccount? account;
  @override
  @HiveField(2)
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @HiveField(3)
  final String id;
  @override
  @HiveField(4)
  final String type;
  @override
  @HiveField(5)
  final MastodonApiStatus? status;

  @override
  String toString() {
    return 'MastodonApiNotification(account: $account, createdAt: $createdAt, id: $id, type: $type, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiNotification &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, account, createdAt, id, type, status);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiNotificationCopyWith<_MastodonApiNotification> get copyWith =>
      __$MastodonApiNotificationCopyWithImpl<_MastodonApiNotification>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiNotificationToJson(this);
  }
}

abstract class _MastodonApiNotification implements MastodonApiNotification {
  const factory _MastodonApiNotification(
      {@HiveField(0)
          required MastodonApiAccount? account,
      @HiveField(2)
      @JsonKey(name: 'created_at')
          required DateTime createdAt,
      @HiveField(3)
          required String id,
      @HiveField(4)
          required String type,
      @HiveField(5)
          required MastodonApiStatus? status}) = _$_MastodonApiNotification;

  factory _MastodonApiNotification.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiNotification.fromJson;

  @override
  @HiveField(0)
  MastodonApiAccount? get account;
  @override
  @HiveField(2)
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @HiveField(3)
  String get id;
  @override
  @HiveField(4)
  String get type;
  @override
  @HiveField(5)
  MastodonApiStatus? get status;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiNotificationCopyWith<_MastodonApiNotification> get copyWith =>
      throw _privateConstructorUsedError;
}
