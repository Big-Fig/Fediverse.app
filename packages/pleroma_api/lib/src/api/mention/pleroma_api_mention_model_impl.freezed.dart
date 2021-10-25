// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_mention_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiMention _$PleromaApiMentionFromJson(Map<String, dynamic> json) {
  return _PleromaApiMention.fromJson(json);
}

/// @nodoc
class _$PleromaApiMentionTearOff {
  const _$PleromaApiMentionTearOff();

  _PleromaApiMention call(
      {@HiveField(0) required String acct,
      @HiveField(1) required String id,
      @HiveField(2) required String url,
      @HiveField(3) required String? username}) {
    return _PleromaApiMention(
      acct: acct,
      id: id,
      url: url,
      username: username,
    );
  }

  PleromaApiMention fromJson(Map<String, Object> json) {
    return PleromaApiMention.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiMention = _$PleromaApiMentionTearOff();

/// @nodoc
mixin _$PleromaApiMention {
  @HiveField(0)
  String get acct => throw _privateConstructorUsedError;
  @HiveField(1)
  String get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String get url => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiMentionCopyWith<PleromaApiMention> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiMentionCopyWith<$Res> {
  factory $PleromaApiMentionCopyWith(
          PleromaApiMention value, $Res Function(PleromaApiMention) then) =
      _$PleromaApiMentionCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String acct,
      @HiveField(1) String id,
      @HiveField(2) String url,
      @HiveField(3) String? username});
}

/// @nodoc
class _$PleromaApiMentionCopyWithImpl<$Res>
    implements $PleromaApiMentionCopyWith<$Res> {
  _$PleromaApiMentionCopyWithImpl(this._value, this._then);

  final PleromaApiMention _value;
  // ignore: unused_field
  final $Res Function(PleromaApiMention) _then;

  @override
  $Res call({
    Object? acct = freezed,
    Object? id = freezed,
    Object? url = freezed,
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      acct: acct == freezed
          ? _value.acct
          : acct // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiMentionCopyWith<$Res>
    implements $PleromaApiMentionCopyWith<$Res> {
  factory _$PleromaApiMentionCopyWith(
          _PleromaApiMention value, $Res Function(_PleromaApiMention) then) =
      __$PleromaApiMentionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String acct,
      @HiveField(1) String id,
      @HiveField(2) String url,
      @HiveField(3) String? username});
}

/// @nodoc
class __$PleromaApiMentionCopyWithImpl<$Res>
    extends _$PleromaApiMentionCopyWithImpl<$Res>
    implements _$PleromaApiMentionCopyWith<$Res> {
  __$PleromaApiMentionCopyWithImpl(
      _PleromaApiMention _value, $Res Function(_PleromaApiMention) _then)
      : super(_value, (v) => _then(v as _PleromaApiMention));

  @override
  _PleromaApiMention get _value => super._value as _PleromaApiMention;

  @override
  $Res call({
    Object? acct = freezed,
    Object? id = freezed,
    Object? url = freezed,
    Object? username = freezed,
  }) {
    return _then(_PleromaApiMention(
      acct: acct == freezed
          ? _value.acct
          : acct // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiMention implements _PleromaApiMention {
  const _$_PleromaApiMention(
      {@HiveField(0) required this.acct,
      @HiveField(1) required this.id,
      @HiveField(2) required this.url,
      @HiveField(3) required this.username});

  factory _$_PleromaApiMention.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiMentionFromJson(json);

  @override
  @HiveField(0)
  final String acct;
  @override
  @HiveField(1)
  final String id;
  @override
  @HiveField(2)
  final String url;
  @override
  @HiveField(3)
  final String? username;

  @override
  String toString() {
    return 'PleromaApiMention(acct: $acct, id: $id, url: $url, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiMention &&
            (identical(other.acct, acct) ||
                const DeepCollectionEquality().equals(other.acct, acct)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(acct) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(username);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiMentionCopyWith<_PleromaApiMention> get copyWith =>
      __$PleromaApiMentionCopyWithImpl<_PleromaApiMention>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiMentionToJson(this);
  }
}

abstract class _PleromaApiMention implements PleromaApiMention {
  const factory _PleromaApiMention(
      {@HiveField(0) required String acct,
      @HiveField(1) required String id,
      @HiveField(2) required String url,
      @HiveField(3) required String? username}) = _$_PleromaApiMention;

  factory _PleromaApiMention.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiMention.fromJson;

  @override
  @HiveField(0)
  String get acct => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String get url => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  String? get username => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiMentionCopyWith<_PleromaApiMention> get copyWith =>
      throw _privateConstructorUsedError;
}
