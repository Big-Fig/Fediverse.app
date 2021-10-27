// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_chat_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiChat _$PleromaApiChatFromJson(Map<String, dynamic> json) {
  return _PleromaApiChat.fromJson(json);
}

/// @nodoc
class _$PleromaApiChatTearOff {
  const _$PleromaApiChatTearOff();

  _PleromaApiChat call(
      {@HiveField(0)
          required String id,
      @HiveField(1)
          required int unread,
      @HiveField(2)
      @JsonKey(name: 'updated_at')
          required DateTime? updatedAt,
      @HiveField(3)
          required PleromaApiAccount account,
      @HiveField(4)
      @JsonKey(name: 'last_message')
          required PleromaApiChatMessage? lastMessage}) {
    return _PleromaApiChat(
      id: id,
      unread: unread,
      updatedAt: updatedAt,
      account: account,
      lastMessage: lastMessage,
    );
  }

  PleromaApiChat fromJson(Map<String, Object?> json) {
    return PleromaApiChat.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiChat = _$PleromaApiChatTearOff();

/// @nodoc
mixin _$PleromaApiChat {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  int get unread => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @HiveField(3)
  PleromaApiAccount get account => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'last_message')
  PleromaApiChatMessage? get lastMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiChatCopyWith<PleromaApiChat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiChatCopyWith<$Res> {
  factory $PleromaApiChatCopyWith(
          PleromaApiChat value, $Res Function(PleromaApiChat) then) =
      _$PleromaApiChatCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          String id,
      @HiveField(1)
          int unread,
      @HiveField(2)
      @JsonKey(name: 'updated_at')
          DateTime? updatedAt,
      @HiveField(3)
          PleromaApiAccount account,
      @HiveField(4)
      @JsonKey(name: 'last_message')
          PleromaApiChatMessage? lastMessage});

  $PleromaApiAccountCopyWith<$Res> get account;
  $PleromaApiChatMessageCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class _$PleromaApiChatCopyWithImpl<$Res>
    implements $PleromaApiChatCopyWith<$Res> {
  _$PleromaApiChatCopyWithImpl(this._value, this._then);

  final PleromaApiChat _value;
  // ignore: unused_field
  final $Res Function(PleromaApiChat) _then;

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
              as PleromaApiAccount,
      lastMessage: lastMessage == freezed
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as PleromaApiChatMessage?,
    ));
  }

  @override
  $PleromaApiAccountCopyWith<$Res> get account {
    return $PleromaApiAccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value));
    });
  }

  @override
  $PleromaApiChatMessageCopyWith<$Res>? get lastMessage {
    if (_value.lastMessage == null) {
      return null;
    }

    return $PleromaApiChatMessageCopyWith<$Res>(_value.lastMessage!, (value) {
      return _then(_value.copyWith(lastMessage: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiChatCopyWith<$Res>
    implements $PleromaApiChatCopyWith<$Res> {
  factory _$PleromaApiChatCopyWith(
          _PleromaApiChat value, $Res Function(_PleromaApiChat) then) =
      __$PleromaApiChatCopyWithImpl<$Res>;
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
          PleromaApiAccount account,
      @HiveField(4)
      @JsonKey(name: 'last_message')
          PleromaApiChatMessage? lastMessage});

  @override
  $PleromaApiAccountCopyWith<$Res> get account;
  @override
  $PleromaApiChatMessageCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class __$PleromaApiChatCopyWithImpl<$Res>
    extends _$PleromaApiChatCopyWithImpl<$Res>
    implements _$PleromaApiChatCopyWith<$Res> {
  __$PleromaApiChatCopyWithImpl(
      _PleromaApiChat _value, $Res Function(_PleromaApiChat) _then)
      : super(_value, (v) => _then(v as _PleromaApiChat));

  @override
  _PleromaApiChat get _value => super._value as _PleromaApiChat;

  @override
  $Res call({
    Object? id = freezed,
    Object? unread = freezed,
    Object? updatedAt = freezed,
    Object? account = freezed,
    Object? lastMessage = freezed,
  }) {
    return _then(_PleromaApiChat(
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
              as PleromaApiAccount,
      lastMessage: lastMessage == freezed
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as PleromaApiChatMessage?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiChat implements _PleromaApiChat {
  const _$_PleromaApiChat(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.unread,
      @HiveField(2) @JsonKey(name: 'updated_at') required this.updatedAt,
      @HiveField(3) required this.account,
      @HiveField(4) @JsonKey(name: 'last_message') required this.lastMessage});

  factory _$_PleromaApiChat.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiChatFromJson(json);

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
  final PleromaApiAccount account;
  @override
  @HiveField(4)
  @JsonKey(name: 'last_message')
  final PleromaApiChatMessage? lastMessage;

  @override
  String toString() {
    return 'PleromaApiChat(id: $id, unread: $unread, updatedAt: $updatedAt, account: $account, lastMessage: $lastMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiChat &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.unread, unread) || other.unread == unread) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, unread, updatedAt, account, lastMessage);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiChatCopyWith<_PleromaApiChat> get copyWith =>
      __$PleromaApiChatCopyWithImpl<_PleromaApiChat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiChatToJson(this);
  }
}

abstract class _PleromaApiChat implements PleromaApiChat {
  const factory _PleromaApiChat(
      {@HiveField(0)
          required String id,
      @HiveField(1)
          required int unread,
      @HiveField(2)
      @JsonKey(name: 'updated_at')
          required DateTime? updatedAt,
      @HiveField(3)
          required PleromaApiAccount account,
      @HiveField(4)
      @JsonKey(name: 'last_message')
          required PleromaApiChatMessage? lastMessage}) = _$_PleromaApiChat;

  factory _PleromaApiChat.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiChat.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  int get unread;
  @override
  @HiveField(2)
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @HiveField(3)
  PleromaApiAccount get account;
  @override
  @HiveField(4)
  @JsonKey(name: 'last_message')
  PleromaApiChatMessage? get lastMessage;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiChatCopyWith<_PleromaApiChat> get copyWith =>
      throw _privateConstructorUsedError;
}
