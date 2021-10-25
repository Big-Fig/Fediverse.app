// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_emoji_reaction_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiEmojiReaction _$UnifediApiEmojiReactionFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiEmojiReaction.fromJson(json);
}

/// @nodoc
class _$UnifediApiEmojiReactionTearOff {
  const _$UnifediApiEmojiReactionTearOff();

  _UnifediApiEmojiReaction call(
      {@HiveField(0) required String name,
      @HiveField(1) required int count,
      @HiveField(2) required bool me,
      @HiveField(3) required List<UnifediApiAccount>? accounts,
      @HiveField(4) required String? url,
      @HiveField(5) required String? staticUrl}) {
    return _UnifediApiEmojiReaction(
      name: name,
      count: count,
      me: me,
      accounts: accounts,
      url: url,
      staticUrl: staticUrl,
    );
  }

  UnifediApiEmojiReaction fromJson(Map<String, Object> json) {
    return UnifediApiEmojiReaction.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiEmojiReaction = _$UnifediApiEmojiReactionTearOff();

/// @nodoc
mixin _$UnifediApiEmojiReaction {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  int get count => throw _privateConstructorUsedError;
  @HiveField(2)
  bool get me => throw _privateConstructorUsedError;
  @HiveField(3)
  List<UnifediApiAccount>? get accounts => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get url => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get staticUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiEmojiReactionCopyWith<UnifediApiEmojiReaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiEmojiReactionCopyWith<$Res> {
  factory $UnifediApiEmojiReactionCopyWith(UnifediApiEmojiReaction value,
          $Res Function(UnifediApiEmojiReaction) then) =
      _$UnifediApiEmojiReactionCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) int count,
      @HiveField(2) bool me,
      @HiveField(3) List<UnifediApiAccount>? accounts,
      @HiveField(4) String? url,
      @HiveField(5) String? staticUrl});
}

/// @nodoc
class _$UnifediApiEmojiReactionCopyWithImpl<$Res>
    implements $UnifediApiEmojiReactionCopyWith<$Res> {
  _$UnifediApiEmojiReactionCopyWithImpl(this._value, this._then);

  final UnifediApiEmojiReaction _value;
  // ignore: unused_field
  final $Res Function(UnifediApiEmojiReaction) _then;

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
              as List<UnifediApiAccount>?,
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
abstract class _$UnifediApiEmojiReactionCopyWith<$Res>
    implements $UnifediApiEmojiReactionCopyWith<$Res> {
  factory _$UnifediApiEmojiReactionCopyWith(_UnifediApiEmojiReaction value,
          $Res Function(_UnifediApiEmojiReaction) then) =
      __$UnifediApiEmojiReactionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) int count,
      @HiveField(2) bool me,
      @HiveField(3) List<UnifediApiAccount>? accounts,
      @HiveField(4) String? url,
      @HiveField(5) String? staticUrl});
}

/// @nodoc
class __$UnifediApiEmojiReactionCopyWithImpl<$Res>
    extends _$UnifediApiEmojiReactionCopyWithImpl<$Res>
    implements _$UnifediApiEmojiReactionCopyWith<$Res> {
  __$UnifediApiEmojiReactionCopyWithImpl(_UnifediApiEmojiReaction _value,
      $Res Function(_UnifediApiEmojiReaction) _then)
      : super(_value, (v) => _then(v as _UnifediApiEmojiReaction));

  @override
  _UnifediApiEmojiReaction get _value =>
      super._value as _UnifediApiEmojiReaction;

  @override
  $Res call({
    Object? name = freezed,
    Object? count = freezed,
    Object? me = freezed,
    Object? accounts = freezed,
    Object? url = freezed,
    Object? staticUrl = freezed,
  }) {
    return _then(_UnifediApiEmojiReaction(
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
              as List<UnifediApiAccount>?,
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
class _$_UnifediApiEmojiReaction implements _UnifediApiEmojiReaction {
  const _$_UnifediApiEmojiReaction(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.count,
      @HiveField(2) required this.me,
      @HiveField(3) required this.accounts,
      @HiveField(4) required this.url,
      @HiveField(5) required this.staticUrl});

  factory _$_UnifediApiEmojiReaction.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiEmojiReactionFromJson(json);

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
  final List<UnifediApiAccount>? accounts;
  @override
  @HiveField(4)
  final String? url;
  @override
  @HiveField(5)
  final String? staticUrl;

  @override
  String toString() {
    return 'UnifediApiEmojiReaction(name: $name, count: $count, me: $me, accounts: $accounts, url: $url, staticUrl: $staticUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiEmojiReaction &&
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
  _$UnifediApiEmojiReactionCopyWith<_UnifediApiEmojiReaction> get copyWith =>
      __$UnifediApiEmojiReactionCopyWithImpl<_UnifediApiEmojiReaction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiEmojiReactionToJson(this);
  }
}

abstract class _UnifediApiEmojiReaction implements UnifediApiEmojiReaction {
  const factory _UnifediApiEmojiReaction(
      {@HiveField(0) required String name,
      @HiveField(1) required int count,
      @HiveField(2) required bool me,
      @HiveField(3) required List<UnifediApiAccount>? accounts,
      @HiveField(4) required String? url,
      @HiveField(5) required String? staticUrl}) = _$_UnifediApiEmojiReaction;

  factory _UnifediApiEmojiReaction.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiEmojiReaction.fromJson;

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
  List<UnifediApiAccount>? get accounts => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  String? get url => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  String? get staticUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiEmojiReactionCopyWith<_UnifediApiEmojiReaction> get copyWith =>
      throw _privateConstructorUsedError;
}
