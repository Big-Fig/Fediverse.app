// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_emoji_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiEmoji _$UnifediApiEmojiFromJson(Map<String, dynamic> json) {
  return _UnifediApiEmoji.fromJson(json);
}

/// @nodoc
class _$UnifediApiEmojiTearOff {
  const _$UnifediApiEmojiTearOff();

  _UnifediApiEmoji call(
      {@HiveField(0)
          required String name,
      @HiveField(1)
          required String? url,
      @HiveField(2)
      @JsonKey(name: 'static_url')
          required String? staticUrl,
      @JsonKey(name: 'visible_in_picker')
      @HiveField(3)
          required bool? visibleInPicker,
      @HiveField(4)
          required List<String>? tags}) {
    return _UnifediApiEmoji(
      name: name,
      url: url,
      staticUrl: staticUrl,
      visibleInPicker: visibleInPicker,
      tags: tags,
    );
  }

  UnifediApiEmoji fromJson(Map<String, Object> json) {
    return UnifediApiEmoji.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiEmoji = _$UnifediApiEmojiTearOff();

/// @nodoc
mixin _$UnifediApiEmoji {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get url => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'static_url')
  String? get staticUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'visible_in_picker')
  @HiveField(3)
  bool? get visibleInPicker => throw _privateConstructorUsedError;
  @HiveField(4)
  List<String>? get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiEmojiCopyWith<UnifediApiEmoji> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiEmojiCopyWith<$Res> {
  factory $UnifediApiEmojiCopyWith(
          UnifediApiEmoji value, $Res Function(UnifediApiEmoji) then) =
      _$UnifediApiEmojiCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String? url,
      @HiveField(2) @JsonKey(name: 'static_url') String? staticUrl,
      @JsonKey(name: 'visible_in_picker') @HiveField(3) bool? visibleInPicker,
      @HiveField(4) List<String>? tags});
}

/// @nodoc
class _$UnifediApiEmojiCopyWithImpl<$Res>
    implements $UnifediApiEmojiCopyWith<$Res> {
  _$UnifediApiEmojiCopyWithImpl(this._value, this._then);

  final UnifediApiEmoji _value;
  // ignore: unused_field
  final $Res Function(UnifediApiEmoji) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
    Object? staticUrl = freezed,
    Object? visibleInPicker = freezed,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
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
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiEmojiCopyWith<$Res>
    implements $UnifediApiEmojiCopyWith<$Res> {
  factory _$UnifediApiEmojiCopyWith(
          _UnifediApiEmoji value, $Res Function(_UnifediApiEmoji) then) =
      __$UnifediApiEmojiCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String? url,
      @HiveField(2) @JsonKey(name: 'static_url') String? staticUrl,
      @JsonKey(name: 'visible_in_picker') @HiveField(3) bool? visibleInPicker,
      @HiveField(4) List<String>? tags});
}

/// @nodoc
class __$UnifediApiEmojiCopyWithImpl<$Res>
    extends _$UnifediApiEmojiCopyWithImpl<$Res>
    implements _$UnifediApiEmojiCopyWith<$Res> {
  __$UnifediApiEmojiCopyWithImpl(
      _UnifediApiEmoji _value, $Res Function(_UnifediApiEmoji) _then)
      : super(_value, (v) => _then(v as _UnifediApiEmoji));

  @override
  _UnifediApiEmoji get _value => super._value as _UnifediApiEmoji;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
    Object? staticUrl = freezed,
    Object? visibleInPicker = freezed,
    Object? tags = freezed,
  }) {
    return _then(_UnifediApiEmoji(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
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
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiEmoji implements _UnifediApiEmoji {
  const _$_UnifediApiEmoji(
      {@HiveField(0)
          required this.name,
      @HiveField(1)
          required this.url,
      @HiveField(2)
      @JsonKey(name: 'static_url')
          required this.staticUrl,
      @JsonKey(name: 'visible_in_picker')
      @HiveField(3)
          required this.visibleInPicker,
      @HiveField(4)
          required this.tags});

  factory _$_UnifediApiEmoji.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiEmojiFromJson(json);

  @override
  @HiveField(0)
  final String name;
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
  final List<String>? tags;

  @override
  String toString() {
    return 'UnifediApiEmoji(name: $name, url: $url, staticUrl: $staticUrl, visibleInPicker: $visibleInPicker, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiEmoji &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.staticUrl, staticUrl) ||
                const DeepCollectionEquality()
                    .equals(other.staticUrl, staticUrl)) &&
            (identical(other.visibleInPicker, visibleInPicker) ||
                const DeepCollectionEquality()
                    .equals(other.visibleInPicker, visibleInPicker)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(staticUrl) ^
      const DeepCollectionEquality().hash(visibleInPicker) ^
      const DeepCollectionEquality().hash(tags);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiEmojiCopyWith<_UnifediApiEmoji> get copyWith =>
      __$UnifediApiEmojiCopyWithImpl<_UnifediApiEmoji>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiEmojiToJson(this);
  }
}

abstract class _UnifediApiEmoji implements UnifediApiEmoji {
  const factory _UnifediApiEmoji(
      {@HiveField(0)
          required String name,
      @HiveField(1)
          required String? url,
      @HiveField(2)
      @JsonKey(name: 'static_url')
          required String? staticUrl,
      @JsonKey(name: 'visible_in_picker')
      @HiveField(3)
          required bool? visibleInPicker,
      @HiveField(4)
          required List<String>? tags}) = _$_UnifediApiEmoji;

  factory _UnifediApiEmoji.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiEmoji.fromJson;

  @override
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
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
  List<String>? get tags => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiEmojiCopyWith<_UnifediApiEmoji> get copyWith =>
      throw _privateConstructorUsedError;
}
