// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_conversation_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiConversationPleromaPart _$PleromaApiConversationPleromaPartFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiConversationPleromaPart.fromJson(json);
}

/// @nodoc
class _$PleromaApiConversationPleromaPartTearOff {
  const _$PleromaApiConversationPleromaPartTearOff();

  _PleromaApiConversationPleromaPart call(
      {@HiveField(0) required List<PleromaApiAccount>? recipients}) {
    return _PleromaApiConversationPleromaPart(
      recipients: recipients,
    );
  }

  PleromaApiConversationPleromaPart fromJson(Map<String, Object> json) {
    return PleromaApiConversationPleromaPart.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiConversationPleromaPart =
    _$PleromaApiConversationPleromaPartTearOff();

/// @nodoc
mixin _$PleromaApiConversationPleromaPart {
  @HiveField(0)
  List<PleromaApiAccount>? get recipients => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiConversationPleromaPartCopyWith<PleromaApiConversationPleromaPart>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiConversationPleromaPartCopyWith<$Res> {
  factory $PleromaApiConversationPleromaPartCopyWith(
          PleromaApiConversationPleromaPart value,
          $Res Function(PleromaApiConversationPleromaPart) then) =
      _$PleromaApiConversationPleromaPartCopyWithImpl<$Res>;
  $Res call({@HiveField(0) List<PleromaApiAccount>? recipients});
}

/// @nodoc
class _$PleromaApiConversationPleromaPartCopyWithImpl<$Res>
    implements $PleromaApiConversationPleromaPartCopyWith<$Res> {
  _$PleromaApiConversationPleromaPartCopyWithImpl(this._value, this._then);

  final PleromaApiConversationPleromaPart _value;
  // ignore: unused_field
  final $Res Function(PleromaApiConversationPleromaPart) _then;

  @override
  $Res call({
    Object? recipients = freezed,
  }) {
    return _then(_value.copyWith(
      recipients: recipients == freezed
          ? _value.recipients
          : recipients // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiAccount>?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiConversationPleromaPartCopyWith<$Res>
    implements $PleromaApiConversationPleromaPartCopyWith<$Res> {
  factory _$PleromaApiConversationPleromaPartCopyWith(
          _PleromaApiConversationPleromaPart value,
          $Res Function(_PleromaApiConversationPleromaPart) then) =
      __$PleromaApiConversationPleromaPartCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) List<PleromaApiAccount>? recipients});
}

/// @nodoc
class __$PleromaApiConversationPleromaPartCopyWithImpl<$Res>
    extends _$PleromaApiConversationPleromaPartCopyWithImpl<$Res>
    implements _$PleromaApiConversationPleromaPartCopyWith<$Res> {
  __$PleromaApiConversationPleromaPartCopyWithImpl(
      _PleromaApiConversationPleromaPart _value,
      $Res Function(_PleromaApiConversationPleromaPart) _then)
      : super(_value, (v) => _then(v as _PleromaApiConversationPleromaPart));

  @override
  _PleromaApiConversationPleromaPart get _value =>
      super._value as _PleromaApiConversationPleromaPart;

  @override
  $Res call({
    Object? recipients = freezed,
  }) {
    return _then(_PleromaApiConversationPleromaPart(
      recipients: recipients == freezed
          ? _value.recipients
          : recipients // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiAccount>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiConversationPleromaPart
    implements _PleromaApiConversationPleromaPart {
  const _$_PleromaApiConversationPleromaPart(
      {@HiveField(0) required this.recipients});

  factory _$_PleromaApiConversationPleromaPart.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiConversationPleromaPartFromJson(json);

  @override
  @HiveField(0)
  final List<PleromaApiAccount>? recipients;

  @override
  String toString() {
    return 'PleromaApiConversationPleromaPart(recipients: $recipients)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiConversationPleromaPart &&
            (identical(other.recipients, recipients) ||
                const DeepCollectionEquality()
                    .equals(other.recipients, recipients)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(recipients);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiConversationPleromaPartCopyWith<
          _PleromaApiConversationPleromaPart>
      get copyWith => __$PleromaApiConversationPleromaPartCopyWithImpl<
          _PleromaApiConversationPleromaPart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiConversationPleromaPartToJson(this);
  }
}

abstract class _PleromaApiConversationPleromaPart
    implements PleromaApiConversationPleromaPart {
  const factory _PleromaApiConversationPleromaPart(
          {@HiveField(0) required List<PleromaApiAccount>? recipients}) =
      _$_PleromaApiConversationPleromaPart;

  factory _PleromaApiConversationPleromaPart.fromJson(
          Map<String, dynamic> json) =
      _$_PleromaApiConversationPleromaPart.fromJson;

  @override
  @HiveField(0)
  List<PleromaApiAccount>? get recipients => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiConversationPleromaPartCopyWith<
          _PleromaApiConversationPleromaPart>
      get copyWith => throw _privateConstructorUsedError;
}

PleromaApiConversation _$PleromaApiConversationFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiConversation.fromJson(json);
}

/// @nodoc
class _$PleromaApiConversationTearOff {
  const _$PleromaApiConversationTearOff();

  _PleromaApiConversation call(
      {@HiveField(0)
          required bool? unread,
      @HiveField(1)
      @JsonKey(name: 'last_status')
          required PleromaApiStatus? lastStatus,
      @HiveField(2)
          required String id,
      @HiveField(3)
          required List<PleromaApiAccount> accounts,
      @HiveField(4)
          required PleromaApiConversationPleromaPart? pleroma}) {
    return _PleromaApiConversation(
      unread: unread,
      lastStatus: lastStatus,
      id: id,
      accounts: accounts,
      pleroma: pleroma,
    );
  }

  PleromaApiConversation fromJson(Map<String, Object> json) {
    return PleromaApiConversation.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiConversation = _$PleromaApiConversationTearOff();

/// @nodoc
mixin _$PleromaApiConversation {
  @HiveField(0)
  bool? get unread => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'last_status')
  PleromaApiStatus? get lastStatus => throw _privateConstructorUsedError;
  @HiveField(2)
  String get id => throw _privateConstructorUsedError;
  @HiveField(3)
  List<PleromaApiAccount> get accounts => throw _privateConstructorUsedError;
  @HiveField(4)
  PleromaApiConversationPleromaPart? get pleroma =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiConversationCopyWith<PleromaApiConversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiConversationCopyWith<$Res> {
  factory $PleromaApiConversationCopyWith(PleromaApiConversation value,
          $Res Function(PleromaApiConversation) then) =
      _$PleromaApiConversationCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) bool? unread,
      @HiveField(1) @JsonKey(name: 'last_status') PleromaApiStatus? lastStatus,
      @HiveField(2) String id,
      @HiveField(3) List<PleromaApiAccount> accounts,
      @HiveField(4) PleromaApiConversationPleromaPart? pleroma});

  $PleromaApiStatusCopyWith<$Res>? get lastStatus;
  $PleromaApiConversationPleromaPartCopyWith<$Res>? get pleroma;
}

/// @nodoc
class _$PleromaApiConversationCopyWithImpl<$Res>
    implements $PleromaApiConversationCopyWith<$Res> {
  _$PleromaApiConversationCopyWithImpl(this._value, this._then);

  final PleromaApiConversation _value;
  // ignore: unused_field
  final $Res Function(PleromaApiConversation) _then;

  @override
  $Res call({
    Object? unread = freezed,
    Object? lastStatus = freezed,
    Object? id = freezed,
    Object? accounts = freezed,
    Object? pleroma = freezed,
  }) {
    return _then(_value.copyWith(
      unread: unread == freezed
          ? _value.unread
          : unread // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastStatus: lastStatus == freezed
          ? _value.lastStatus
          : lastStatus // ignore: cast_nullable_to_non_nullable
              as PleromaApiStatus?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accounts: accounts == freezed
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiAccount>,
      pleroma: pleroma == freezed
          ? _value.pleroma
          : pleroma // ignore: cast_nullable_to_non_nullable
              as PleromaApiConversationPleromaPart?,
    ));
  }

  @override
  $PleromaApiStatusCopyWith<$Res>? get lastStatus {
    if (_value.lastStatus == null) {
      return null;
    }

    return $PleromaApiStatusCopyWith<$Res>(_value.lastStatus!, (value) {
      return _then(_value.copyWith(lastStatus: value));
    });
  }

  @override
  $PleromaApiConversationPleromaPartCopyWith<$Res>? get pleroma {
    if (_value.pleroma == null) {
      return null;
    }

    return $PleromaApiConversationPleromaPartCopyWith<$Res>(_value.pleroma!,
        (value) {
      return _then(_value.copyWith(pleroma: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiConversationCopyWith<$Res>
    implements $PleromaApiConversationCopyWith<$Res> {
  factory _$PleromaApiConversationCopyWith(_PleromaApiConversation value,
          $Res Function(_PleromaApiConversation) then) =
      __$PleromaApiConversationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) bool? unread,
      @HiveField(1) @JsonKey(name: 'last_status') PleromaApiStatus? lastStatus,
      @HiveField(2) String id,
      @HiveField(3) List<PleromaApiAccount> accounts,
      @HiveField(4) PleromaApiConversationPleromaPart? pleroma});

  @override
  $PleromaApiStatusCopyWith<$Res>? get lastStatus;
  @override
  $PleromaApiConversationPleromaPartCopyWith<$Res>? get pleroma;
}

/// @nodoc
class __$PleromaApiConversationCopyWithImpl<$Res>
    extends _$PleromaApiConversationCopyWithImpl<$Res>
    implements _$PleromaApiConversationCopyWith<$Res> {
  __$PleromaApiConversationCopyWithImpl(_PleromaApiConversation _value,
      $Res Function(_PleromaApiConversation) _then)
      : super(_value, (v) => _then(v as _PleromaApiConversation));

  @override
  _PleromaApiConversation get _value => super._value as _PleromaApiConversation;

  @override
  $Res call({
    Object? unread = freezed,
    Object? lastStatus = freezed,
    Object? id = freezed,
    Object? accounts = freezed,
    Object? pleroma = freezed,
  }) {
    return _then(_PleromaApiConversation(
      unread: unread == freezed
          ? _value.unread
          : unread // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastStatus: lastStatus == freezed
          ? _value.lastStatus
          : lastStatus // ignore: cast_nullable_to_non_nullable
              as PleromaApiStatus?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accounts: accounts == freezed
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiAccount>,
      pleroma: pleroma == freezed
          ? _value.pleroma
          : pleroma // ignore: cast_nullable_to_non_nullable
              as PleromaApiConversationPleromaPart?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiConversation implements _PleromaApiConversation {
  const _$_PleromaApiConversation(
      {@HiveField(0) required this.unread,
      @HiveField(1) @JsonKey(name: 'last_status') required this.lastStatus,
      @HiveField(2) required this.id,
      @HiveField(3) required this.accounts,
      @HiveField(4) required this.pleroma});

  factory _$_PleromaApiConversation.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiConversationFromJson(json);

  @override
  @HiveField(0)
  final bool? unread;
  @override
  @HiveField(1)
  @JsonKey(name: 'last_status')
  final PleromaApiStatus? lastStatus;
  @override
  @HiveField(2)
  final String id;
  @override
  @HiveField(3)
  final List<PleromaApiAccount> accounts;
  @override
  @HiveField(4)
  final PleromaApiConversationPleromaPart? pleroma;

  @override
  String toString() {
    return 'PleromaApiConversation(unread: $unread, lastStatus: $lastStatus, id: $id, accounts: $accounts, pleroma: $pleroma)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiConversation &&
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
            (identical(other.pleroma, pleroma) ||
                const DeepCollectionEquality().equals(other.pleroma, pleroma)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(unread) ^
      const DeepCollectionEquality().hash(lastStatus) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(accounts) ^
      const DeepCollectionEquality().hash(pleroma);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiConversationCopyWith<_PleromaApiConversation> get copyWith =>
      __$PleromaApiConversationCopyWithImpl<_PleromaApiConversation>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiConversationToJson(this);
  }
}

abstract class _PleromaApiConversation implements PleromaApiConversation {
  const factory _PleromaApiConversation(
          {@HiveField(0)
              required bool? unread,
          @HiveField(1)
          @JsonKey(name: 'last_status')
              required PleromaApiStatus? lastStatus,
          @HiveField(2)
              required String id,
          @HiveField(3)
              required List<PleromaApiAccount> accounts,
          @HiveField(4)
              required PleromaApiConversationPleromaPart? pleroma}) =
      _$_PleromaApiConversation;

  factory _PleromaApiConversation.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiConversation.fromJson;

  @override
  @HiveField(0)
  bool? get unread => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'last_status')
  PleromaApiStatus? get lastStatus => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  List<PleromaApiAccount> get accounts => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  PleromaApiConversationPleromaPart? get pleroma =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiConversationCopyWith<_PleromaApiConversation> get copyWith =>
      throw _privateConstructorUsedError;
}
