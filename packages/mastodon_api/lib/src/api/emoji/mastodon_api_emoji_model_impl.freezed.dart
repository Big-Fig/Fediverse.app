// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_emoji_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiEmoji _$MastodonApiEmojiFromJson(Map<String, dynamic> json) {
  return _MastodonApiEmoji.fromJson(json);
}

/// @nodoc
class _$MastodonApiEmojiTearOff {
  const _$MastodonApiEmojiTearOff();

  _MastodonApiEmoji call(
      {@HiveField(0)
          required String shortcode,
      @HiveField(1)
          required String? url,
      @HiveField(2)
      @JsonKey(name: 'static_url')
          required String? staticUrl,
      @JsonKey(name: 'visible_in_picker')
      @HiveField(3)
          required bool? visibleInPicker,
      @override
      @HiveField(4)
          required String? category}) {
    return _MastodonApiEmoji(
      shortcode: shortcode,
      url: url,
      staticUrl: staticUrl,
      visibleInPicker: visibleInPicker,
      category: category,
    );
  }

  MastodonApiEmoji fromJson(Map<String, Object?> json) {
    return MastodonApiEmoji.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiEmoji = _$MastodonApiEmojiTearOff();

/// @nodoc
mixin _$MastodonApiEmoji {
  @HiveField(0)
  String get shortcode => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get url => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'static_url')
  String? get staticUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'visible_in_picker')
  @HiveField(3)
  bool? get visibleInPicker => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  String? get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiEmojiCopyWith<MastodonApiEmoji> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiEmojiCopyWith<$Res> {
  factory $MastodonApiEmojiCopyWith(
          MastodonApiEmoji value, $Res Function(MastodonApiEmoji) then) =
      _$MastodonApiEmojiCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String shortcode,
      @HiveField(1) String? url,
      @HiveField(2) @JsonKey(name: 'static_url') String? staticUrl,
      @JsonKey(name: 'visible_in_picker') @HiveField(3) bool? visibleInPicker,
      @override @HiveField(4) String? category});
}

/// @nodoc
class _$MastodonApiEmojiCopyWithImpl<$Res>
    implements $MastodonApiEmojiCopyWith<$Res> {
  _$MastodonApiEmojiCopyWithImpl(this._value, this._then);

  final MastodonApiEmoji _value;
  // ignore: unused_field
  final $Res Function(MastodonApiEmoji) _then;

  @override
  $Res call({
    Object? shortcode = freezed,
    Object? url = freezed,
    Object? staticUrl = freezed,
    Object? visibleInPicker = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      shortcode: shortcode == freezed
          ? _value.shortcode
          : shortcode // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      staticUrl: staticUrl == freezed
          ? _value.staticUrl
          : staticUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      visibleInPicker: visibleInPicker == freezed
          ? _value.visibleInPicker
          : visibleInPicker // ignore: cast_nullable_to_non_nullable
              as bool?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MastodonApiEmojiCopyWith<$Res>
    implements $MastodonApiEmojiCopyWith<$Res> {
  factory _$MastodonApiEmojiCopyWith(
          _MastodonApiEmoji value, $Res Function(_MastodonApiEmoji) then) =
      __$MastodonApiEmojiCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String shortcode,
      @HiveField(1) String? url,
      @HiveField(2) @JsonKey(name: 'static_url') String? staticUrl,
      @JsonKey(name: 'visible_in_picker') @HiveField(3) bool? visibleInPicker,
      @override @HiveField(4) String? category});
}

/// @nodoc
class __$MastodonApiEmojiCopyWithImpl<$Res>
    extends _$MastodonApiEmojiCopyWithImpl<$Res>
    implements _$MastodonApiEmojiCopyWith<$Res> {
  __$MastodonApiEmojiCopyWithImpl(
      _MastodonApiEmoji _value, $Res Function(_MastodonApiEmoji) _then)
      : super(_value, (v) => _then(v as _MastodonApiEmoji));

  @override
  _MastodonApiEmoji get _value => super._value as _MastodonApiEmoji;

  @override
  $Res call({
    Object? shortcode = freezed,
    Object? url = freezed,
    Object? staticUrl = freezed,
    Object? visibleInPicker = freezed,
    Object? category = freezed,
  }) {
    return _then(_MastodonApiEmoji(
      shortcode: shortcode == freezed
          ? _value.shortcode
          : shortcode // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      staticUrl: staticUrl == freezed
          ? _value.staticUrl
          : staticUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      visibleInPicker: visibleInPicker == freezed
          ? _value.visibleInPicker
          : visibleInPicker // ignore: cast_nullable_to_non_nullable
              as bool?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiEmoji implements _MastodonApiEmoji {
  const _$_MastodonApiEmoji(
      {@HiveField(0)
          required this.shortcode,
      @HiveField(1)
          required this.url,
      @HiveField(2)
      @JsonKey(name: 'static_url')
          required this.staticUrl,
      @JsonKey(name: 'visible_in_picker')
      @HiveField(3)
          required this.visibleInPicker,
      @override
      @HiveField(4)
          required this.category});

  factory _$_MastodonApiEmoji.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiEmojiFromJson(json);

  @override
  @HiveField(0)
  final String shortcode;
  @override
  @HiveField(1)
  final String? url;
  @override
  @HiveField(2)
  @JsonKey(name: 'static_url')
  final String? staticUrl;
  @override
  @JsonKey(name: 'visible_in_picker')
  @HiveField(3)
  final bool? visibleInPicker;
  @override
  @override
  @HiveField(4)
  final String? category;

  @override
  String toString() {
    return 'MastodonApiEmoji(shortcode: $shortcode, url: $url, staticUrl: $staticUrl, visibleInPicker: $visibleInPicker, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiEmoji &&
            (identical(other.shortcode, shortcode) ||
                other.shortcode == shortcode) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.staticUrl, staticUrl) ||
                other.staticUrl == staticUrl) &&
            (identical(other.visibleInPicker, visibleInPicker) ||
                other.visibleInPicker == visibleInPicker) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, shortcode, url, staticUrl, visibleInPicker, category);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiEmojiCopyWith<_MastodonApiEmoji> get copyWith =>
      __$MastodonApiEmojiCopyWithImpl<_MastodonApiEmoji>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiEmojiToJson(this);
  }
}

abstract class _MastodonApiEmoji implements MastodonApiEmoji {
  const factory _MastodonApiEmoji(
      {@HiveField(0)
          required String shortcode,
      @HiveField(1)
          required String? url,
      @HiveField(2)
      @JsonKey(name: 'static_url')
          required String? staticUrl,
      @JsonKey(name: 'visible_in_picker')
      @HiveField(3)
          required bool? visibleInPicker,
      @override
      @HiveField(4)
          required String? category}) = _$_MastodonApiEmoji;

  factory _MastodonApiEmoji.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiEmoji.fromJson;

  @override
  @HiveField(0)
  String get shortcode;
  @override
  @HiveField(1)
  String? get url;
  @override
  @HiveField(2)
  @JsonKey(name: 'static_url')
  String? get staticUrl;
  @override
  @JsonKey(name: 'visible_in_picker')
  @HiveField(3)
  bool? get visibleInPicker;
  @override
  @override
  @HiveField(4)
  String? get category;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiEmojiCopyWith<_MastodonApiEmoji> get copyWith =>
      throw _privateConstructorUsedError;
}
