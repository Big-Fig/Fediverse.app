// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_emoji_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiEmoji _$PleromaApiEmojiFromJson(Map<String, dynamic> json) {
  return _PleromaApiEmoji.fromJson(json);
}

/// @nodoc
class _$PleromaApiEmojiTearOff {
  const _$PleromaApiEmojiTearOff();

  _PleromaApiEmoji call(
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
      @HiveField(4)
          required String? category}) {
    return _PleromaApiEmoji(
      shortcode: shortcode,
      url: url,
      staticUrl: staticUrl,
      visibleInPicker: visibleInPicker,
      category: category,
    );
  }

  PleromaApiEmoji fromJson(Map<String, Object> json) {
    return PleromaApiEmoji.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiEmoji = _$PleromaApiEmojiTearOff();

/// @nodoc
mixin _$PleromaApiEmoji {
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
  @HiveField(4)
  String? get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiEmojiCopyWith<PleromaApiEmoji> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiEmojiCopyWith<$Res> {
  factory $PleromaApiEmojiCopyWith(
          PleromaApiEmoji value, $Res Function(PleromaApiEmoji) then) =
      _$PleromaApiEmojiCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String shortcode,
      @HiveField(1) String? url,
      @HiveField(2) @JsonKey(name: 'static_url') String? staticUrl,
      @JsonKey(name: 'visible_in_picker') @HiveField(3) bool? visibleInPicker,
      @HiveField(4) String? category});
}

/// @nodoc
class _$PleromaApiEmojiCopyWithImpl<$Res>
    implements $PleromaApiEmojiCopyWith<$Res> {
  _$PleromaApiEmojiCopyWithImpl(this._value, this._then);

  final PleromaApiEmoji _value;
  // ignore: unused_field
  final $Res Function(PleromaApiEmoji) _then;

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
abstract class _$PleromaApiEmojiCopyWith<$Res>
    implements $PleromaApiEmojiCopyWith<$Res> {
  factory _$PleromaApiEmojiCopyWith(
          _PleromaApiEmoji value, $Res Function(_PleromaApiEmoji) then) =
      __$PleromaApiEmojiCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String shortcode,
      @HiveField(1) String? url,
      @HiveField(2) @JsonKey(name: 'static_url') String? staticUrl,
      @JsonKey(name: 'visible_in_picker') @HiveField(3) bool? visibleInPicker,
      @HiveField(4) String? category});
}

/// @nodoc
class __$PleromaApiEmojiCopyWithImpl<$Res>
    extends _$PleromaApiEmojiCopyWithImpl<$Res>
    implements _$PleromaApiEmojiCopyWith<$Res> {
  __$PleromaApiEmojiCopyWithImpl(
      _PleromaApiEmoji _value, $Res Function(_PleromaApiEmoji) _then)
      : super(_value, (v) => _then(v as _PleromaApiEmoji));

  @override
  _PleromaApiEmoji get _value => super._value as _PleromaApiEmoji;

  @override
  $Res call({
    Object? shortcode = freezed,
    Object? url = freezed,
    Object? staticUrl = freezed,
    Object? visibleInPicker = freezed,
    Object? category = freezed,
  }) {
    return _then(_PleromaApiEmoji(
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
class _$_PleromaApiEmoji implements _PleromaApiEmoji {
  const _$_PleromaApiEmoji(
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
      @HiveField(4)
          required this.category});

  factory _$_PleromaApiEmoji.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiEmojiFromJson(json);

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
  @HiveField(4)
  final String? category;

  @override
  String toString() {
    return 'PleromaApiEmoji(shortcode: $shortcode, url: $url, staticUrl: $staticUrl, visibleInPicker: $visibleInPicker, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiEmoji &&
            (identical(other.shortcode, shortcode) ||
                const DeepCollectionEquality()
                    .equals(other.shortcode, shortcode)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.staticUrl, staticUrl) ||
                const DeepCollectionEquality()
                    .equals(other.staticUrl, staticUrl)) &&
            (identical(other.visibleInPicker, visibleInPicker) ||
                const DeepCollectionEquality()
                    .equals(other.visibleInPicker, visibleInPicker)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(shortcode) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(staticUrl) ^
      const DeepCollectionEquality().hash(visibleInPicker) ^
      const DeepCollectionEquality().hash(category);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiEmojiCopyWith<_PleromaApiEmoji> get copyWith =>
      __$PleromaApiEmojiCopyWithImpl<_PleromaApiEmoji>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiEmojiToJson(this);
  }
}

abstract class _PleromaApiEmoji implements PleromaApiEmoji {
  const factory _PleromaApiEmoji(
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
      @HiveField(4)
          required String? category}) = _$_PleromaApiEmoji;

  factory _PleromaApiEmoji.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiEmoji.fromJson;

  @override
  @HiveField(0)
  String get shortcode => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String? get url => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'static_url')
  String? get staticUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'visible_in_picker')
  @HiveField(3)
  bool? get visibleInPicker => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  String? get category => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiEmojiCopyWith<_PleromaApiEmoji> get copyWith =>
      throw _privateConstructorUsedError;
}
