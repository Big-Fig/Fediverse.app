// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'custom_emoji_picker_image_url_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomEmojiPickerImageUrlItem _$CustomEmojiPickerImageUrlItemFromJson(
    Map<String, dynamic> json) {
  return _CustomEmojiPickerImageUrlItem.fromJson(json);
}

/// @nodoc
class _$CustomEmojiPickerImageUrlItemTearOff {
  const _$CustomEmojiPickerImageUrlItemTearOff();

  _CustomEmojiPickerImageUrlItem call(
      {@HiveField(0) required String name,
      @HiveField(1) @JsonKey(name: 'image_url') required String imageUrl}) {
    return _CustomEmojiPickerImageUrlItem(
      name: name,
      imageUrl: imageUrl,
    );
  }

  CustomEmojiPickerImageUrlItem fromJson(Map<String, Object> json) {
    return CustomEmojiPickerImageUrlItem.fromJson(json);
  }
}

/// @nodoc
const $CustomEmojiPickerImageUrlItem = _$CustomEmojiPickerImageUrlItemTearOff();

/// @nodoc
mixin _$CustomEmojiPickerImageUrlItem {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomEmojiPickerImageUrlItemCopyWith<CustomEmojiPickerImageUrlItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomEmojiPickerImageUrlItemCopyWith<$Res> {
  factory $CustomEmojiPickerImageUrlItemCopyWith(
          CustomEmojiPickerImageUrlItem value,
          $Res Function(CustomEmojiPickerImageUrlItem) then) =
      _$CustomEmojiPickerImageUrlItemCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) @JsonKey(name: 'image_url') String imageUrl});
}

/// @nodoc
class _$CustomEmojiPickerImageUrlItemCopyWithImpl<$Res>
    implements $CustomEmojiPickerImageUrlItemCopyWith<$Res> {
  _$CustomEmojiPickerImageUrlItemCopyWithImpl(this._value, this._then);

  final CustomEmojiPickerImageUrlItem _value;
  // ignore: unused_field
  final $Res Function(CustomEmojiPickerImageUrlItem) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CustomEmojiPickerImageUrlItemCopyWith<$Res>
    implements $CustomEmojiPickerImageUrlItemCopyWith<$Res> {
  factory _$CustomEmojiPickerImageUrlItemCopyWith(
          _CustomEmojiPickerImageUrlItem value,
          $Res Function(_CustomEmojiPickerImageUrlItem) then) =
      __$CustomEmojiPickerImageUrlItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) @JsonKey(name: 'image_url') String imageUrl});
}

/// @nodoc
class __$CustomEmojiPickerImageUrlItemCopyWithImpl<$Res>
    extends _$CustomEmojiPickerImageUrlItemCopyWithImpl<$Res>
    implements _$CustomEmojiPickerImageUrlItemCopyWith<$Res> {
  __$CustomEmojiPickerImageUrlItemCopyWithImpl(
      _CustomEmojiPickerImageUrlItem _value,
      $Res Function(_CustomEmojiPickerImageUrlItem) _then)
      : super(_value, (v) => _then(v as _CustomEmojiPickerImageUrlItem));

  @override
  _CustomEmojiPickerImageUrlItem get _value =>
      super._value as _CustomEmojiPickerImageUrlItem;

  @override
  $Res call({
    Object? name = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_CustomEmojiPickerImageUrlItem(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomEmojiPickerImageUrlItem extends _CustomEmojiPickerImageUrlItem {
  const _$_CustomEmojiPickerImageUrlItem(
      {@HiveField(0) required this.name,
      @HiveField(1) @JsonKey(name: 'image_url') required this.imageUrl})
      : super._();

  factory _$_CustomEmojiPickerImageUrlItem.fromJson(
          Map<String, dynamic> json) =>
      _$$_CustomEmojiPickerImageUrlItemFromJson(json);

  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  @JsonKey(name: 'image_url')
  final String imageUrl;

  @override
  String toString() {
    return 'CustomEmojiPickerImageUrlItem(name: $name, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CustomEmojiPickerImageUrlItem &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(imageUrl);

  @JsonKey(ignore: true)
  @override
  _$CustomEmojiPickerImageUrlItemCopyWith<_CustomEmojiPickerImageUrlItem>
      get copyWith => __$CustomEmojiPickerImageUrlItemCopyWithImpl<
          _CustomEmojiPickerImageUrlItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomEmojiPickerImageUrlItemToJson(this);
  }
}

abstract class _CustomEmojiPickerImageUrlItem
    extends CustomEmojiPickerImageUrlItem {
  const factory _CustomEmojiPickerImageUrlItem(
          {@HiveField(0) required String name,
          @HiveField(1) @JsonKey(name: 'image_url') required String imageUrl}) =
      _$_CustomEmojiPickerImageUrlItem;
  const _CustomEmojiPickerImageUrlItem._() : super._();

  factory _CustomEmojiPickerImageUrlItem.fromJson(Map<String, dynamic> json) =
      _$_CustomEmojiPickerImageUrlItem.fromJson;

  @override
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CustomEmojiPickerImageUrlItemCopyWith<_CustomEmojiPickerImageUrlItem>
      get copyWith => throw _privateConstructorUsedError;
}
