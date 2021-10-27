// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_custom_emoji_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiCustomEmoji _$PleromaApiCustomEmojiFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiCustomEmoji.fromJson(json);
}

/// @nodoc
class _$PleromaApiCustomEmojiTearOff {
  const _$PleromaApiCustomEmojiTearOff();

  _PleromaApiCustomEmoji call(
      {@HiveField(0) required List<String>? tags,
      @HiveField(1) @JsonKey(name: 'image_url') required String imageUrl,
      @HiveField(2) required String name}) {
    return _PleromaApiCustomEmoji(
      tags: tags,
      imageUrl: imageUrl,
      name: name,
    );
  }

  PleromaApiCustomEmoji fromJson(Map<String, Object?> json) {
    return PleromaApiCustomEmoji.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiCustomEmoji = _$PleromaApiCustomEmojiTearOff();

/// @nodoc
mixin _$PleromaApiCustomEmoji {
  @HiveField(0)
  List<String>? get tags => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;
  @HiveField(2)
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiCustomEmojiCopyWith<PleromaApiCustomEmoji> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiCustomEmojiCopyWith<$Res> {
  factory $PleromaApiCustomEmojiCopyWith(PleromaApiCustomEmoji value,
          $Res Function(PleromaApiCustomEmoji) then) =
      _$PleromaApiCustomEmojiCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) List<String>? tags,
      @HiveField(1) @JsonKey(name: 'image_url') String imageUrl,
      @HiveField(2) String name});
}

/// @nodoc
class _$PleromaApiCustomEmojiCopyWithImpl<$Res>
    implements $PleromaApiCustomEmojiCopyWith<$Res> {
  _$PleromaApiCustomEmojiCopyWithImpl(this._value, this._then);

  final PleromaApiCustomEmoji _value;
  // ignore: unused_field
  final $Res Function(PleromaApiCustomEmoji) _then;

  @override
  $Res call({
    Object? tags = freezed,
    Object? imageUrl = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiCustomEmojiCopyWith<$Res>
    implements $PleromaApiCustomEmojiCopyWith<$Res> {
  factory _$PleromaApiCustomEmojiCopyWith(_PleromaApiCustomEmoji value,
          $Res Function(_PleromaApiCustomEmoji) then) =
      __$PleromaApiCustomEmojiCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) List<String>? tags,
      @HiveField(1) @JsonKey(name: 'image_url') String imageUrl,
      @HiveField(2) String name});
}

/// @nodoc
class __$PleromaApiCustomEmojiCopyWithImpl<$Res>
    extends _$PleromaApiCustomEmojiCopyWithImpl<$Res>
    implements _$PleromaApiCustomEmojiCopyWith<$Res> {
  __$PleromaApiCustomEmojiCopyWithImpl(_PleromaApiCustomEmoji _value,
      $Res Function(_PleromaApiCustomEmoji) _then)
      : super(_value, (v) => _then(v as _PleromaApiCustomEmoji));

  @override
  _PleromaApiCustomEmoji get _value => super._value as _PleromaApiCustomEmoji;

  @override
  $Res call({
    Object? tags = freezed,
    Object? imageUrl = freezed,
    Object? name = freezed,
  }) {
    return _then(_PleromaApiCustomEmoji(
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiCustomEmoji implements _PleromaApiCustomEmoji {
  const _$_PleromaApiCustomEmoji(
      {@HiveField(0) required this.tags,
      @HiveField(1) @JsonKey(name: 'image_url') required this.imageUrl,
      @HiveField(2) required this.name});

  factory _$_PleromaApiCustomEmoji.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiCustomEmojiFromJson(json);

  @override
  @HiveField(0)
  final List<String>? tags;
  @override
  @HiveField(1)
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @override
  @HiveField(2)
  final String name;

  @override
  String toString() {
    return 'PleromaApiCustomEmoji(tags: $tags, imageUrl: $imageUrl, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiCustomEmoji &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(tags), imageUrl, name);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiCustomEmojiCopyWith<_PleromaApiCustomEmoji> get copyWith =>
      __$PleromaApiCustomEmojiCopyWithImpl<_PleromaApiCustomEmoji>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiCustomEmojiToJson(this);
  }
}

abstract class _PleromaApiCustomEmoji implements PleromaApiCustomEmoji {
  const factory _PleromaApiCustomEmoji(
      {@HiveField(0) required List<String>? tags,
      @HiveField(1) @JsonKey(name: 'image_url') required String imageUrl,
      @HiveField(2) required String name}) = _$_PleromaApiCustomEmoji;

  factory _PleromaApiCustomEmoji.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiCustomEmoji.fromJson;

  @override
  @HiveField(0)
  List<String>? get tags;
  @override
  @HiveField(1)
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @override
  @HiveField(2)
  String get name;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiCustomEmojiCopyWith<_PleromaApiCustomEmoji> get copyWith =>
      throw _privateConstructorUsedError;
}
