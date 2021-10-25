// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fediverse_push_toot_relay_message_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FediversePushTootRelayMessage _$FediversePushTootRelayMessageFromJson(
    Map<String, dynamic> json) {
  return _FediversePushTootRelayMessage.fromJson(json);
}

/// @nodoc
class _$FediversePushTootRelayMessageTearOff {
  const _$FediversePushTootRelayMessageTearOff();

  _FediversePushTootRelayMessage call(
      {@HiveField(0) @JsonKey(name: 'crypto_key') required String cryptoKey,
      @HiveField(1) required String salt,
      @HiveField(2) required String payload,
      @HiveField(3) required String account,
      @HiveField(4) required String server}) {
    return _FediversePushTootRelayMessage(
      cryptoKey: cryptoKey,
      salt: salt,
      payload: payload,
      account: account,
      server: server,
    );
  }

  FediversePushTootRelayMessage fromJson(Map<String, Object> json) {
    return FediversePushTootRelayMessage.fromJson(json);
  }
}

/// @nodoc
const $FediversePushTootRelayMessage = _$FediversePushTootRelayMessageTearOff();

/// @nodoc
mixin _$FediversePushTootRelayMessage {
  @HiveField(0)
  @JsonKey(name: 'crypto_key')
  String get cryptoKey => throw _privateConstructorUsedError;
  @HiveField(1)
  String get salt => throw _privateConstructorUsedError;
  @HiveField(2)
  String get payload => throw _privateConstructorUsedError;
  @HiveField(3)
  String get account => throw _privateConstructorUsedError;
  @HiveField(4)
  String get server => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FediversePushTootRelayMessageCopyWith<FediversePushTootRelayMessage>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FediversePushTootRelayMessageCopyWith<$Res> {
  factory $FediversePushTootRelayMessageCopyWith(
          FediversePushTootRelayMessage value,
          $Res Function(FediversePushTootRelayMessage) then) =
      _$FediversePushTootRelayMessageCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) @JsonKey(name: 'crypto_key') String cryptoKey,
      @HiveField(1) String salt,
      @HiveField(2) String payload,
      @HiveField(3) String account,
      @HiveField(4) String server});
}

/// @nodoc
class _$FediversePushTootRelayMessageCopyWithImpl<$Res>
    implements $FediversePushTootRelayMessageCopyWith<$Res> {
  _$FediversePushTootRelayMessageCopyWithImpl(this._value, this._then);

  final FediversePushTootRelayMessage _value;
  // ignore: unused_field
  final $Res Function(FediversePushTootRelayMessage) _then;

  @override
  $Res call({
    Object? cryptoKey = freezed,
    Object? salt = freezed,
    Object? payload = freezed,
    Object? account = freezed,
    Object? server = freezed,
  }) {
    return _then(_value.copyWith(
      cryptoKey: cryptoKey == freezed
          ? _value.cryptoKey
          : cryptoKey // ignore: cast_nullable_to_non_nullable
              as String,
      salt: salt == freezed
          ? _value.salt
          : salt // ignore: cast_nullable_to_non_nullable
              as String,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String,
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      server: server == freezed
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FediversePushTootRelayMessageCopyWith<$Res>
    implements $FediversePushTootRelayMessageCopyWith<$Res> {
  factory _$FediversePushTootRelayMessageCopyWith(
          _FediversePushTootRelayMessage value,
          $Res Function(_FediversePushTootRelayMessage) then) =
      __$FediversePushTootRelayMessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) @JsonKey(name: 'crypto_key') String cryptoKey,
      @HiveField(1) String salt,
      @HiveField(2) String payload,
      @HiveField(3) String account,
      @HiveField(4) String server});
}

/// @nodoc
class __$FediversePushTootRelayMessageCopyWithImpl<$Res>
    extends _$FediversePushTootRelayMessageCopyWithImpl<$Res>
    implements _$FediversePushTootRelayMessageCopyWith<$Res> {
  __$FediversePushTootRelayMessageCopyWithImpl(
      _FediversePushTootRelayMessage _value,
      $Res Function(_FediversePushTootRelayMessage) _then)
      : super(_value, (v) => _then(v as _FediversePushTootRelayMessage));

  @override
  _FediversePushTootRelayMessage get _value =>
      super._value as _FediversePushTootRelayMessage;

  @override
  $Res call({
    Object? cryptoKey = freezed,
    Object? salt = freezed,
    Object? payload = freezed,
    Object? account = freezed,
    Object? server = freezed,
  }) {
    return _then(_FediversePushTootRelayMessage(
      cryptoKey: cryptoKey == freezed
          ? _value.cryptoKey
          : cryptoKey // ignore: cast_nullable_to_non_nullable
              as String,
      salt: salt == freezed
          ? _value.salt
          : salt // ignore: cast_nullable_to_non_nullable
              as String,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String,
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      server: server == freezed
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FediversePushTootRelayMessage
    implements _FediversePushTootRelayMessage {
  const _$_FediversePushTootRelayMessage(
      {@HiveField(0) @JsonKey(name: 'crypto_key') required this.cryptoKey,
      @HiveField(1) required this.salt,
      @HiveField(2) required this.payload,
      @HiveField(3) required this.account,
      @HiveField(4) required this.server});

  factory _$_FediversePushTootRelayMessage.fromJson(
          Map<String, dynamic> json) =>
      _$$_FediversePushTootRelayMessageFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'crypto_key')
  final String cryptoKey;
  @override
  @HiveField(1)
  final String salt;
  @override
  @HiveField(2)
  final String payload;
  @override
  @HiveField(3)
  final String account;
  @override
  @HiveField(4)
  final String server;

  @override
  String toString() {
    return 'FediversePushTootRelayMessage(cryptoKey: $cryptoKey, salt: $salt, payload: $payload, account: $account, server: $server)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FediversePushTootRelayMessage &&
            (identical(other.cryptoKey, cryptoKey) ||
                const DeepCollectionEquality()
                    .equals(other.cryptoKey, cryptoKey)) &&
            (identical(other.salt, salt) ||
                const DeepCollectionEquality().equals(other.salt, salt)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.account, account) ||
                const DeepCollectionEquality()
                    .equals(other.account, account)) &&
            (identical(other.server, server) ||
                const DeepCollectionEquality().equals(other.server, server)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(cryptoKey) ^
      const DeepCollectionEquality().hash(salt) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(account) ^
      const DeepCollectionEquality().hash(server);

  @JsonKey(ignore: true)
  @override
  _$FediversePushTootRelayMessageCopyWith<_FediversePushTootRelayMessage>
      get copyWith => __$FediversePushTootRelayMessageCopyWithImpl<
          _FediversePushTootRelayMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FediversePushTootRelayMessageToJson(this);
  }
}

abstract class _FediversePushTootRelayMessage
    implements FediversePushTootRelayMessage {
  const factory _FediversePushTootRelayMessage(
      {@HiveField(0) @JsonKey(name: 'crypto_key') required String cryptoKey,
      @HiveField(1) required String salt,
      @HiveField(2) required String payload,
      @HiveField(3) required String account,
      @HiveField(4) required String server}) = _$_FediversePushTootRelayMessage;

  factory _FediversePushTootRelayMessage.fromJson(Map<String, dynamic> json) =
      _$_FediversePushTootRelayMessage.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'crypto_key')
  String get cryptoKey => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get salt => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String get payload => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  String get account => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  String get server => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FediversePushTootRelayMessageCopyWith<_FediversePushTootRelayMessage>
      get copyWith => throw _privateConstructorUsedError;
}
