// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_conversation_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiConversation _$MastodonApiConversationFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiConversation.fromJson(json);
}

/// @nodoc
class _$MastodonApiConversationTearOff {
  const _$MastodonApiConversationTearOff();

  _MastodonApiConversation call(
      {@HiveField(0)
          required bool? unread,
      @HiveField(1)
      @JsonKey(name: 'last_status')
          required MastodonApiStatus? lastStatus,
      @HiveField(2)
          required String id,
      @HiveField(3)
          required List<MastodonApiAccount> accounts}) {
    return _MastodonApiConversation(
      unread: unread,
      lastStatus: lastStatus,
      id: id,
      accounts: accounts,
    );
  }

  MastodonApiConversation fromJson(Map<String, Object?> json) {
    return MastodonApiConversation.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiConversation = _$MastodonApiConversationTearOff();

/// @nodoc
mixin _$MastodonApiConversation {
  @HiveField(0)
  bool? get unread => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'last_status')
  MastodonApiStatus? get lastStatus => throw _privateConstructorUsedError;
  @HiveField(2)
  String get id => throw _privateConstructorUsedError;
  @HiveField(3)
  List<MastodonApiAccount> get accounts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiConversationCopyWith<MastodonApiConversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiConversationCopyWith<$Res> {
  factory $MastodonApiConversationCopyWith(MastodonApiConversation value,
          $Res Function(MastodonApiConversation) then) =
      _$MastodonApiConversationCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) bool? unread,
      @HiveField(1) @JsonKey(name: 'last_status') MastodonApiStatus? lastStatus,
      @HiveField(2) String id,
      @HiveField(3) List<MastodonApiAccount> accounts});

  $MastodonApiStatusCopyWith<$Res>? get lastStatus;
}

/// @nodoc
class _$MastodonApiConversationCopyWithImpl<$Res>
    implements $MastodonApiConversationCopyWith<$Res> {
  _$MastodonApiConversationCopyWithImpl(this._value, this._then);

  final MastodonApiConversation _value;
  // ignore: unused_field
  final $Res Function(MastodonApiConversation) _then;

  @override
  $Res call({
    Object? unread = freezed,
    Object? lastStatus = freezed,
    Object? id = freezed,
    Object? accounts = freezed,
  }) {
    return _then(_value.copyWith(
      unread: unread == freezed
          ? _value.unread
          : unread // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastStatus: lastStatus == freezed
          ? _value.lastStatus
          : lastStatus // ignore: cast_nullable_to_non_nullable
              as MastodonApiStatus?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accounts: accounts == freezed
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiAccount>,
    ));
  }

  @override
  $MastodonApiStatusCopyWith<$Res>? get lastStatus {
    if (_value.lastStatus == null) {
      return null;
    }

    return $MastodonApiStatusCopyWith<$Res>(_value.lastStatus!, (value) {
      return _then(_value.copyWith(lastStatus: value));
    });
  }
}

/// @nodoc
abstract class _$MastodonApiConversationCopyWith<$Res>
    implements $MastodonApiConversationCopyWith<$Res> {
  factory _$MastodonApiConversationCopyWith(_MastodonApiConversation value,
          $Res Function(_MastodonApiConversation) then) =
      __$MastodonApiConversationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) bool? unread,
      @HiveField(1) @JsonKey(name: 'last_status') MastodonApiStatus? lastStatus,
      @HiveField(2) String id,
      @HiveField(3) List<MastodonApiAccount> accounts});

  @override
  $MastodonApiStatusCopyWith<$Res>? get lastStatus;
}

/// @nodoc
class __$MastodonApiConversationCopyWithImpl<$Res>
    extends _$MastodonApiConversationCopyWithImpl<$Res>
    implements _$MastodonApiConversationCopyWith<$Res> {
  __$MastodonApiConversationCopyWithImpl(_MastodonApiConversation _value,
      $Res Function(_MastodonApiConversation) _then)
      : super(_value, (v) => _then(v as _MastodonApiConversation));

  @override
  _MastodonApiConversation get _value =>
      super._value as _MastodonApiConversation;

  @override
  $Res call({
    Object? unread = freezed,
    Object? lastStatus = freezed,
    Object? id = freezed,
    Object? accounts = freezed,
  }) {
    return _then(_MastodonApiConversation(
      unread: unread == freezed
          ? _value.unread
          : unread // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastStatus: lastStatus == freezed
          ? _value.lastStatus
          : lastStatus // ignore: cast_nullable_to_non_nullable
              as MastodonApiStatus?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accounts: accounts == freezed
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiAccount>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiConversation implements _MastodonApiConversation {
  const _$_MastodonApiConversation(
      {@HiveField(0) required this.unread,
      @HiveField(1) @JsonKey(name: 'last_status') required this.lastStatus,
      @HiveField(2) required this.id,
      @HiveField(3) required this.accounts});

  factory _$_MastodonApiConversation.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiConversationFromJson(json);

  @override
  @HiveField(0)
  final bool? unread;
  @override
  @HiveField(1)
  @JsonKey(name: 'last_status')
  final MastodonApiStatus? lastStatus;
  @override
  @HiveField(2)
  final String id;
  @override
  @HiveField(3)
  final List<MastodonApiAccount> accounts;

  @override
  String toString() {
    return 'MastodonApiConversation(unread: $unread, lastStatus: $lastStatus, id: $id, accounts: $accounts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiConversation &&
            (identical(other.unread, unread) || other.unread == unread) &&
            (identical(other.lastStatus, lastStatus) ||
                other.lastStatus == lastStatus) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.accounts, accounts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, unread, lastStatus, id,
      const DeepCollectionEquality().hash(accounts));

  @JsonKey(ignore: true)
  @override
  _$MastodonApiConversationCopyWith<_MastodonApiConversation> get copyWith =>
      __$MastodonApiConversationCopyWithImpl<_MastodonApiConversation>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiConversationToJson(this);
  }
}

abstract class _MastodonApiConversation implements MastodonApiConversation {
  const factory _MastodonApiConversation(
          {@HiveField(0)
              required bool? unread,
          @HiveField(1)
          @JsonKey(name: 'last_status')
              required MastodonApiStatus? lastStatus,
          @HiveField(2)
              required String id,
          @HiveField(3)
              required List<MastodonApiAccount> accounts}) =
      _$_MastodonApiConversation;

  factory _MastodonApiConversation.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiConversation.fromJson;

  @override
  @HiveField(0)
  bool? get unread;
  @override
  @HiveField(1)
  @JsonKey(name: 'last_status')
  MastodonApiStatus? get lastStatus;
  @override
  @HiveField(2)
  String get id;
  @override
  @HiveField(3)
  List<MastodonApiAccount> get accounts;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiConversationCopyWith<_MastodonApiConversation> get copyWith =>
      throw _privateConstructorUsedError;
}
