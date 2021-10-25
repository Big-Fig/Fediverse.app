// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_status_emoji_reaction_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiStatusEmojiReaction _$PleromaApiStatusEmojiReactionFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiStatusEmojiReaction.fromJson(json);
}

/// @nodoc
class _$PleromaApiStatusEmojiReactionTearOff {
  const _$PleromaApiStatusEmojiReactionTearOff();

  _PleromaApiStatusEmojiReaction call(
      {@HiveField(0) required String name,
      @HiveField(1) required int count,
      @HiveField(2) required bool me,
      @HiveField(3) required List<PleromaApiAccount>? accounts,
      @HiveField(4) required String? url,
      @HiveField(5) required String? staticUrl}) {
    return _PleromaApiStatusEmojiReaction(
      name: name,
      count: count,
      me: me,
      accounts: accounts,
      url: url,
      staticUrl: staticUrl,
    );
  }

  PleromaApiStatusEmojiReaction fromJson(Map<String, Object> json) {
    return PleromaApiStatusEmojiReaction.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiStatusEmojiReaction = _$PleromaApiStatusEmojiReactionTearOff();

/// @nodoc
mixin _$PleromaApiStatusEmojiReaction {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  int get count => throw _privateConstructorUsedError;
  @HiveField(2)
  bool get me => throw _privateConstructorUsedError;
  @HiveField(3)
  List<PleromaApiAccount>? get accounts => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get url => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get staticUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiStatusEmojiReactionCopyWith<PleromaApiStatusEmojiReaction>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiStatusEmojiReactionCopyWith<$Res> {
  factory $PleromaApiStatusEmojiReactionCopyWith(
          PleromaApiStatusEmojiReaction value,
          $Res Function(PleromaApiStatusEmojiReaction) then) =
      _$PleromaApiStatusEmojiReactionCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) int count,
      @HiveField(2) bool me,
      @HiveField(3) List<PleromaApiAccount>? accounts,
      @HiveField(4) String? url,
      @HiveField(5) String? staticUrl});
}

/// @nodoc
class _$PleromaApiStatusEmojiReactionCopyWithImpl<$Res>
    implements $PleromaApiStatusEmojiReactionCopyWith<$Res> {
  _$PleromaApiStatusEmojiReactionCopyWithImpl(this._value, this._then);

  final PleromaApiStatusEmojiReaction _value;
  // ignore: unused_field
  final $Res Function(PleromaApiStatusEmojiReaction) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? count = freezed,
    Object? me = freezed,
    Object? accounts = freezed,
    Object? url = freezed,
    Object? staticUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      me: me == freezed
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as bool,
      accounts: accounts == freezed
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiAccount>?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      staticUrl: staticUrl == freezed
          ? _value.staticUrl
          : staticUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiStatusEmojiReactionCopyWith<$Res>
    implements $PleromaApiStatusEmojiReactionCopyWith<$Res> {
  factory _$PleromaApiStatusEmojiReactionCopyWith(
          _PleromaApiStatusEmojiReaction value,
          $Res Function(_PleromaApiStatusEmojiReaction) then) =
      __$PleromaApiStatusEmojiReactionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) int count,
      @HiveField(2) bool me,
      @HiveField(3) List<PleromaApiAccount>? accounts,
      @HiveField(4) String? url,
      @HiveField(5) String? staticUrl});
}

/// @nodoc
class __$PleromaApiStatusEmojiReactionCopyWithImpl<$Res>
    extends _$PleromaApiStatusEmojiReactionCopyWithImpl<$Res>
    implements _$PleromaApiStatusEmojiReactionCopyWith<$Res> {
  __$PleromaApiStatusEmojiReactionCopyWithImpl(
      _PleromaApiStatusEmojiReaction _value,
      $Res Function(_PleromaApiStatusEmojiReaction) _then)
      : super(_value, (v) => _then(v as _PleromaApiStatusEmojiReaction));

  @override
  _PleromaApiStatusEmojiReaction get _value =>
      super._value as _PleromaApiStatusEmojiReaction;

  @override
  $Res call({
    Object? name = freezed,
    Object? count = freezed,
    Object? me = freezed,
    Object? accounts = freezed,
    Object? url = freezed,
    Object? staticUrl = freezed,
  }) {
    return _then(_PleromaApiStatusEmojiReaction(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      me: me == freezed
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as bool,
      accounts: accounts == freezed
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiAccount>?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      staticUrl: staticUrl == freezed
          ? _value.staticUrl
          : staticUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiStatusEmojiReaction
    implements _PleromaApiStatusEmojiReaction {
  const _$_PleromaApiStatusEmojiReaction(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.count,
      @HiveField(2) required this.me,
      @HiveField(3) required this.accounts,
      @HiveField(4) required this.url,
      @HiveField(5) required this.staticUrl});

  factory _$_PleromaApiStatusEmojiReaction.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiStatusEmojiReactionFromJson(json);

  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final int count;
  @override
  @HiveField(2)
  final bool me;
  @override
  @HiveField(3)
  final List<PleromaApiAccount>? accounts;
  @override
  @HiveField(4)
  final String? url;
  @override
  @HiveField(5)
  final String? staticUrl;

  @override
  String toString() {
    return 'PleromaApiStatusEmojiReaction(name: $name, count: $count, me: $me, accounts: $accounts, url: $url, staticUrl: $staticUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiStatusEmojiReaction &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.me, me) ||
                const DeepCollectionEquality().equals(other.me, me)) &&
            (identical(other.accounts, accounts) ||
                const DeepCollectionEquality()
                    .equals(other.accounts, accounts)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.staticUrl, staticUrl) ||
                const DeepCollectionEquality()
                    .equals(other.staticUrl, staticUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(me) ^
      const DeepCollectionEquality().hash(accounts) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(staticUrl);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiStatusEmojiReactionCopyWith<_PleromaApiStatusEmojiReaction>
      get copyWith => __$PleromaApiStatusEmojiReactionCopyWithImpl<
          _PleromaApiStatusEmojiReaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiStatusEmojiReactionToJson(this);
  }
}

abstract class _PleromaApiStatusEmojiReaction
    implements PleromaApiStatusEmojiReaction {
  const factory _PleromaApiStatusEmojiReaction(
          {@HiveField(0) required String name,
          @HiveField(1) required int count,
          @HiveField(2) required bool me,
          @HiveField(3) required List<PleromaApiAccount>? accounts,
          @HiveField(4) required String? url,
          @HiveField(5) required String? staticUrl}) =
      _$_PleromaApiStatusEmojiReaction;

  factory _PleromaApiStatusEmojiReaction.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiStatusEmojiReaction.fromJson;

  @override
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  int get count => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  bool get me => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  List<PleromaApiAccount>? get accounts => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  String? get url => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  String? get staticUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiStatusEmojiReactionCopyWith<_PleromaApiStatusEmojiReaction>
      get copyWith => throw _privateConstructorUsedError;
}
