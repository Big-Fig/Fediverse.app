// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_chat_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiChat _$UnifediApiChatFromJson(Map<String, dynamic> json) {
  return _UnifediApiChat.fromJson(json);
}

/// @nodoc
class _$UnifediApiChatTearOff {
  const _$UnifediApiChatTearOff();

  _UnifediApiChat call(
      {@HiveField(0)
          required String id,
      @HiveField(1)
          required int unread,
      @HiveField(2)
      @JsonKey(name: 'updated_at')
          required DateTime? updatedAt,
      @HiveField(3)
          required UnifediApiAccount account,
      @HiveField(4)
      @JsonKey(name: 'last_message')
          required UnifediApiChatMessage? lastMessage}) {
    return _UnifediApiChat(
      id: id,
      unread: unread,
      updatedAt: updatedAt,
      account: account,
      lastMessage: lastMessage,
    );
  }

  UnifediApiChat fromJson(Map<String, Object> json) {
    return UnifediApiChat.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiChat = _$UnifediApiChatTearOff();

/// @nodoc
mixin _$UnifediApiChat {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  int get unread => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @HiveField(3)
  UnifediApiAccount get account => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'last_message')
  UnifediApiChatMessage? get lastMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiChatCopyWith<UnifediApiChat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiChatCopyWith<$Res> {
  factory $UnifediApiChatCopyWith(
          UnifediApiChat value, $Res Function(UnifediApiChat) then) =
      _$UnifediApiChatCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          String id,
      @HiveField(1)
          int unread,
      @HiveField(2)
      @JsonKey(name: 'updated_at')
          DateTime? updatedAt,
      @HiveField(3)
          UnifediApiAccount account,
      @HiveField(4)
      @JsonKey(name: 'last_message')
          UnifediApiChatMessage? lastMessage});

  $UnifediApiAccountCopyWith<$Res> get account;
  $UnifediApiChatMessageCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class _$UnifediApiChatCopyWithImpl<$Res>
    implements $UnifediApiChatCopyWith<$Res> {
  _$UnifediApiChatCopyWithImpl(this._value, this._then);

  final UnifediApiChat _value;
  // ignore: unused_field
  final $Res Function(UnifediApiChat) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? unread = freezed,
    Object? updatedAt = freezed,
    Object? account = freezed,
    Object? lastMessage = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      unread: unread == freezed
          ? _value.unread
          : unread // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccount,
      lastMessage: lastMessage == freezed
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as UnifediApiChatMessage?,
    ));
  }

  @override
  $UnifediApiAccountCopyWith<$Res> get account {
    return $UnifediApiAccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value));
    });
  }

  @override
  $UnifediApiChatMessageCopyWith<$Res>? get lastMessage {
    if (_value.lastMessage == null) {
      return null;
    }

    return $UnifediApiChatMessageCopyWith<$Res>(_value.lastMessage!, (value) {
      return _then(_value.copyWith(lastMessage: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiChatCopyWith<$Res>
    implements $UnifediApiChatCopyWith<$Res> {
  factory _$UnifediApiChatCopyWith(
          _UnifediApiChat value, $Res Function(_UnifediApiChat) then) =
      __$UnifediApiChatCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          String id,
      @HiveField(1)
          int unread,
      @HiveField(2)
      @JsonKey(name: 'updated_at')
          DateTime? updatedAt,
      @HiveField(3)
          UnifediApiAccount account,
      @HiveField(4)
      @JsonKey(name: 'last_message')
          UnifediApiChatMessage? lastMessage});

  @override
  $UnifediApiAccountCopyWith<$Res> get account;
  @override
  $UnifediApiChatMessageCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class __$UnifediApiChatCopyWithImpl<$Res>
    extends _$UnifediApiChatCopyWithImpl<$Res>
    implements _$UnifediApiChatCopyWith<$Res> {
  __$UnifediApiChatCopyWithImpl(
      _UnifediApiChat _value, $Res Function(_UnifediApiChat) _then)
      : super(_value, (v) => _then(v as _UnifediApiChat));

  @override
  _UnifediApiChat get _value => super._value as _UnifediApiChat;

  @override
  $Res call({
    Object? id = freezed,
    Object? unread = freezed,
    Object? updatedAt = freezed,
    Object? account = freezed,
    Object? lastMessage = freezed,
  }) {
    return _then(_UnifediApiChat(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      unread: unread == freezed
          ? _value.unread
          : unread // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccount,
      lastMessage: lastMessage == freezed
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as UnifediApiChatMessage?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiChat implements _UnifediApiChat {
  const _$_UnifediApiChat(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.unread,
      @HiveField(2) @JsonKey(name: 'updated_at') required this.updatedAt,
      @HiveField(3) required this.account,
      @HiveField(4) @JsonKey(name: 'last_message') required this.lastMessage});

  factory _$_UnifediApiChat.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiChatFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final int unread;
  @override
  @HiveField(2)
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @HiveField(3)
  final UnifediApiAccount account;
  @override
  @HiveField(4)
  @JsonKey(name: 'last_message')
  final UnifediApiChatMessage? lastMessage;

  @override
  String toString() {
    return 'UnifediApiChat(id: $id, unread: $unread, updatedAt: $updatedAt, account: $account, lastMessage: $lastMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiChat &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.unread, unread) ||
                const DeepCollectionEquality().equals(other.unread, unread)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.account, account) ||
                const DeepCollectionEquality()
                    .equals(other.account, account)) &&
            (identical(other.lastMessage, lastMessage) ||
                const DeepCollectionEquality()
                    .equals(other.lastMessage, lastMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(unread) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(account) ^
      const DeepCollectionEquality().hash(lastMessage);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiChatCopyWith<_UnifediApiChat> get copyWith =>
      __$UnifediApiChatCopyWithImpl<_UnifediApiChat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiChatToJson(this);
  }
}

abstract class _UnifediApiChat implements UnifediApiChat {
  const factory _UnifediApiChat(
      {@HiveField(0)
          required String id,
      @HiveField(1)
          required int unread,
      @HiveField(2)
      @JsonKey(name: 'updated_at')
          required DateTime? updatedAt,
      @HiveField(3)
          required UnifediApiAccount account,
      @HiveField(4)
      @JsonKey(name: 'last_message')
          required UnifediApiChatMessage? lastMessage}) = _$_UnifediApiChat;

  factory _UnifediApiChat.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiChat.fromJson;

  @override
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  int get unread => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  UnifediApiAccount get account => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  @JsonKey(name: 'last_message')
  UnifediApiChatMessage? get lastMessage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiChatCopyWith<_UnifediApiChat> get copyWith =>
      throw _privateConstructorUsedError;
}
