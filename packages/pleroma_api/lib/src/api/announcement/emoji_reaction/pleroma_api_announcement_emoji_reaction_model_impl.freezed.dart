// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_announcement_emoji_reaction_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiAnnouncementEmojiReaction
    _$PleromaApiAnnouncementEmojiReactionFromJson(Map<String, dynamic> json) {
  return _PleromaApiAnnouncementEmojiReaction.fromJson(json);
}

/// @nodoc
class _$PleromaApiAnnouncementEmojiReactionTearOff {
  const _$PleromaApiAnnouncementEmojiReactionTearOff();

  _PleromaApiAnnouncementEmojiReaction call(
      {@HiveField(0) required String name,
      @HiveField(1) required int count,
      @HiveField(2) required bool me,
      @HiveField(3) required String? url,
      @HiveField(4) @JsonKey(name: 'static_url') required String? staticUrl}) {
    return _PleromaApiAnnouncementEmojiReaction(
      name: name,
      count: count,
      me: me,
      url: url,
      staticUrl: staticUrl,
    );
  }

  PleromaApiAnnouncementEmojiReaction fromJson(Map<String, Object> json) {
    return PleromaApiAnnouncementEmojiReaction.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiAnnouncementEmojiReaction =
    _$PleromaApiAnnouncementEmojiReactionTearOff();

/// @nodoc
mixin _$PleromaApiAnnouncementEmojiReaction {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  int get count => throw _privateConstructorUsedError;
  @HiveField(2)
  bool get me => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get url => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'static_url')
  String? get staticUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiAnnouncementEmojiReactionCopyWith<
          PleromaApiAnnouncementEmojiReaction>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiAnnouncementEmojiReactionCopyWith<$Res> {
  factory $PleromaApiAnnouncementEmojiReactionCopyWith(
          PleromaApiAnnouncementEmojiReaction value,
          $Res Function(PleromaApiAnnouncementEmojiReaction) then) =
      _$PleromaApiAnnouncementEmojiReactionCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) int count,
      @HiveField(2) bool me,
      @HiveField(3) String? url,
      @HiveField(4) @JsonKey(name: 'static_url') String? staticUrl});
}

/// @nodoc
class _$PleromaApiAnnouncementEmojiReactionCopyWithImpl<$Res>
    implements $PleromaApiAnnouncementEmojiReactionCopyWith<$Res> {
  _$PleromaApiAnnouncementEmojiReactionCopyWithImpl(this._value, this._then);

  final PleromaApiAnnouncementEmojiReaction _value;
  // ignore: unused_field
  final $Res Function(PleromaApiAnnouncementEmojiReaction) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? count = freezed,
    Object? me = freezed,
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
abstract class _$PleromaApiAnnouncementEmojiReactionCopyWith<$Res>
    implements $PleromaApiAnnouncementEmojiReactionCopyWith<$Res> {
  factory _$PleromaApiAnnouncementEmojiReactionCopyWith(
          _PleromaApiAnnouncementEmojiReaction value,
          $Res Function(_PleromaApiAnnouncementEmojiReaction) then) =
      __$PleromaApiAnnouncementEmojiReactionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) int count,
      @HiveField(2) bool me,
      @HiveField(3) String? url,
      @HiveField(4) @JsonKey(name: 'static_url') String? staticUrl});
}

/// @nodoc
class __$PleromaApiAnnouncementEmojiReactionCopyWithImpl<$Res>
    extends _$PleromaApiAnnouncementEmojiReactionCopyWithImpl<$Res>
    implements _$PleromaApiAnnouncementEmojiReactionCopyWith<$Res> {
  __$PleromaApiAnnouncementEmojiReactionCopyWithImpl(
      _PleromaApiAnnouncementEmojiReaction _value,
      $Res Function(_PleromaApiAnnouncementEmojiReaction) _then)
      : super(_value, (v) => _then(v as _PleromaApiAnnouncementEmojiReaction));

  @override
  _PleromaApiAnnouncementEmojiReaction get _value =>
      super._value as _PleromaApiAnnouncementEmojiReaction;

  @override
  $Res call({
    Object? name = freezed,
    Object? count = freezed,
    Object? me = freezed,
    Object? url = freezed,
    Object? staticUrl = freezed,
  }) {
    return _then(_PleromaApiAnnouncementEmojiReaction(
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
class _$_PleromaApiAnnouncementEmojiReaction
    implements _PleromaApiAnnouncementEmojiReaction {
  const _$_PleromaApiAnnouncementEmojiReaction(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.count,
      @HiveField(2) required this.me,
      @HiveField(3) required this.url,
      @HiveField(4) @JsonKey(name: 'static_url') required this.staticUrl});

  factory _$_PleromaApiAnnouncementEmojiReaction.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiAnnouncementEmojiReactionFromJson(json);

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
  final String? url;
  @override
  @HiveField(4)
  @JsonKey(name: 'static_url')
  final String? staticUrl;

  @override
  String toString() {
    return 'PleromaApiAnnouncementEmojiReaction(name: $name, count: $count, me: $me, url: $url, staticUrl: $staticUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiAnnouncementEmojiReaction &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.me, me) ||
                const DeepCollectionEquality().equals(other.me, me)) &&
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
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(staticUrl);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiAnnouncementEmojiReactionCopyWith<
          _PleromaApiAnnouncementEmojiReaction>
      get copyWith => __$PleromaApiAnnouncementEmojiReactionCopyWithImpl<
          _PleromaApiAnnouncementEmojiReaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiAnnouncementEmojiReactionToJson(this);
  }
}

abstract class _PleromaApiAnnouncementEmojiReaction
    implements PleromaApiAnnouncementEmojiReaction {
  const factory _PleromaApiAnnouncementEmojiReaction(
      {@HiveField(0)
          required String name,
      @HiveField(1)
          required int count,
      @HiveField(2)
          required bool me,
      @HiveField(3)
          required String? url,
      @HiveField(4)
      @JsonKey(name: 'static_url')
          required String? staticUrl}) = _$_PleromaApiAnnouncementEmojiReaction;

  factory _PleromaApiAnnouncementEmojiReaction.fromJson(
          Map<String, dynamic> json) =
      _$_PleromaApiAnnouncementEmojiReaction.fromJson;

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
  String? get url => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  @JsonKey(name: 'static_url')
  String? get staticUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiAnnouncementEmojiReactionCopyWith<
          _PleromaApiAnnouncementEmojiReaction>
      get copyWith => throw _privateConstructorUsedError;
}
