// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_conversation_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiConversation _$UnifediApiConversationFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiConversation.fromJson(json);
}

/// @nodoc
class _$UnifediApiConversationTearOff {
  const _$UnifediApiConversationTearOff();

  _UnifediApiConversation call(
      {@HiveField(0)
          required bool? unread,
      @HiveField(1)
      @JsonKey(name: 'last_status')
          required UnifediApiStatus? lastStatus,
      @HiveField(2)
          required String id,
      @HiveField(3)
          required List<UnifediApiAccount> accounts,
      @HiveField(4)
          required List<UnifediApiAccount>? recipients}) {
    return _UnifediApiConversation(
      unread: unread,
      lastStatus: lastStatus,
      id: id,
      accounts: accounts,
      recipients: recipients,
    );
  }

  UnifediApiConversation fromJson(Map<String, Object> json) {
    return UnifediApiConversation.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiConversation = _$UnifediApiConversationTearOff();

/// @nodoc
mixin _$UnifediApiConversation {
  @HiveField(0)
  bool? get unread => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'last_status')
  UnifediApiStatus? get lastStatus => throw _privateConstructorUsedError;
  @HiveField(2)
  String get id => throw _privateConstructorUsedError;
  @HiveField(3)
  List<UnifediApiAccount> get accounts => throw _privateConstructorUsedError;
  @HiveField(4)
  List<UnifediApiAccount>? get recipients => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiConversationCopyWith<UnifediApiConversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiConversationCopyWith<$Res> {
  factory $UnifediApiConversationCopyWith(UnifediApiConversation value,
          $Res Function(UnifediApiConversation) then) =
      _$UnifediApiConversationCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) bool? unread,
      @HiveField(1) @JsonKey(name: 'last_status') UnifediApiStatus? lastStatus,
      @HiveField(2) String id,
      @HiveField(3) List<UnifediApiAccount> accounts,
      @HiveField(4) List<UnifediApiAccount>? recipients});

  $UnifediApiStatusCopyWith<$Res>? get lastStatus;
}

/// @nodoc
class _$UnifediApiConversationCopyWithImpl<$Res>
    implements $UnifediApiConversationCopyWith<$Res> {
  _$UnifediApiConversationCopyWithImpl(this._value, this._then);

  final UnifediApiConversation _value;
  // ignore: unused_field
  final $Res Function(UnifediApiConversation) _then;

  @override
  $Res call({
    Object? unread = freezed,
    Object? lastStatus = freezed,
    Object? id = freezed,
    Object? accounts = freezed,
    Object? recipients = freezed,
  }) {
    return _then(_value.copyWith(
      unread: unread == freezed
          ? _value.unread
          : unread // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastStatus: lastStatus == freezed
          ? _value.lastStatus
          : lastStatus // ignore: cast_nullable_to_non_nullable
              as UnifediApiStatus?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accounts: accounts == freezed
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiAccount>,
      recipients: recipients == freezed
          ? _value.recipients
          : recipients // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiAccount>?,
    ));
  }

  @override
  $UnifediApiStatusCopyWith<$Res>? get lastStatus {
    if (_value.lastStatus == null) {
      return null;
    }

    return $UnifediApiStatusCopyWith<$Res>(_value.lastStatus!, (value) {
      return _then(_value.copyWith(lastStatus: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiConversationCopyWith<$Res>
    implements $UnifediApiConversationCopyWith<$Res> {
  factory _$UnifediApiConversationCopyWith(_UnifediApiConversation value,
          $Res Function(_UnifediApiConversation) then) =
      __$UnifediApiConversationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) bool? unread,
      @HiveField(1) @JsonKey(name: 'last_status') UnifediApiStatus? lastStatus,
      @HiveField(2) String id,
      @HiveField(3) List<UnifediApiAccount> accounts,
      @HiveField(4) List<UnifediApiAccount>? recipients});

  @override
  $UnifediApiStatusCopyWith<$Res>? get lastStatus;
}

/// @nodoc
class __$UnifediApiConversationCopyWithImpl<$Res>
    extends _$UnifediApiConversationCopyWithImpl<$Res>
    implements _$UnifediApiConversationCopyWith<$Res> {
  __$UnifediApiConversationCopyWithImpl(_UnifediApiConversation _value,
      $Res Function(_UnifediApiConversation) _then)
      : super(_value, (v) => _then(v as _UnifediApiConversation));

  @override
  _UnifediApiConversation get _value => super._value as _UnifediApiConversation;

  @override
  $Res call({
    Object? unread = freezed,
    Object? lastStatus = freezed,
    Object? id = freezed,
    Object? accounts = freezed,
    Object? recipients = freezed,
  }) {
    return _then(_UnifediApiConversation(
      unread: unread == freezed
          ? _value.unread
          : unread // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastStatus: lastStatus == freezed
          ? _value.lastStatus
          : lastStatus // ignore: cast_nullable_to_non_nullable
              as UnifediApiStatus?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accounts: accounts == freezed
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiAccount>,
      recipients: recipients == freezed
          ? _value.recipients
          : recipients // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiAccount>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiConversation implements _UnifediApiConversation {
  const _$_UnifediApiConversation(
      {@HiveField(0) required this.unread,
      @HiveField(1) @JsonKey(name: 'last_status') required this.lastStatus,
      @HiveField(2) required this.id,
      @HiveField(3) required this.accounts,
      @HiveField(4) required this.recipients});

  factory _$_UnifediApiConversation.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiConversationFromJson(json);

  @override
  @HiveField(0)
  final bool? unread;
  @override
  @HiveField(1)
  @JsonKey(name: 'last_status')
  final UnifediApiStatus? lastStatus;
  @override
  @HiveField(2)
  final String id;
  @override
  @HiveField(3)
  final List<UnifediApiAccount> accounts;
  @override
  @HiveField(4)
  final List<UnifediApiAccount>? recipients;

  @override
  String toString() {
    return 'UnifediApiConversation(unread: $unread, lastStatus: $lastStatus, id: $id, accounts: $accounts, recipients: $recipients)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiConversation &&
            (identical(other.unread, unread) ||
                const DeepCollectionEquality().equals(other.unread, unread)) &&
            (identical(other.lastStatus, lastStatus) ||
                const DeepCollectionEquality()
                    .equals(other.lastStatus, lastStatus)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.accounts, accounts) ||
                const DeepCollectionEquality()
                    .equals(other.accounts, accounts)) &&
            (identical(other.recipients, recipients) ||
                const DeepCollectionEquality()
                    .equals(other.recipients, recipients)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(unread) ^
      const DeepCollectionEquality().hash(lastStatus) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(accounts) ^
      const DeepCollectionEquality().hash(recipients);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiConversationCopyWith<_UnifediApiConversation> get copyWith =>
      __$UnifediApiConversationCopyWithImpl<_UnifediApiConversation>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiConversationToJson(this);
  }
}

abstract class _UnifediApiConversation implements UnifediApiConversation {
  const factory _UnifediApiConversation(
          {@HiveField(0)
              required bool? unread,
          @HiveField(1)
          @JsonKey(name: 'last_status')
              required UnifediApiStatus? lastStatus,
          @HiveField(2)
              required String id,
          @HiveField(3)
              required List<UnifediApiAccount> accounts,
          @HiveField(4)
              required List<UnifediApiAccount>? recipients}) =
      _$_UnifediApiConversation;

  factory _UnifediApiConversation.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiConversation.fromJson;

  @override
  @HiveField(0)
  bool? get unread => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'last_status')
  UnifediApiStatus? get lastStatus => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  List<UnifediApiAccount> get accounts => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  List<UnifediApiAccount>? get recipients => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiConversationCopyWith<_UnifediApiConversation> get copyWith =>
      throw _privateConstructorUsedError;
}
