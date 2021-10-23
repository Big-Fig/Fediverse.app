// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'emoji_picker_custom_image_url_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EmojiPickerCustomImageUrlCategoryItems
    _$EmojiPickerCustomImageUrlCategoryItemsFromJson(
        Map<String, dynamic> json) {
  return _EmojiPickerCustomImageUrlCategoryItems.fromJson(json);
}

/// @nodoc
class _$EmojiPickerCustomImageUrlCategoryItemsTearOff {
  const _$EmojiPickerCustomImageUrlCategoryItemsTearOff();

  _EmojiPickerCustomImageUrlCategoryItems call(
      {@HiveField(0) required List<CustomEmojiPickerImageUrlItem> items}) {
    return _EmojiPickerCustomImageUrlCategoryItems(
      items: items,
    );
  }

  EmojiPickerCustomImageUrlCategoryItems fromJson(Map<String, Object> json) {
    return EmojiPickerCustomImageUrlCategoryItems.fromJson(json);
  }
}

/// @nodoc
const $EmojiPickerCustomImageUrlCategoryItems =
    _$EmojiPickerCustomImageUrlCategoryItemsTearOff();

/// @nodoc
mixin _$EmojiPickerCustomImageUrlCategoryItems {
  @HiveField(0)
  List<CustomEmojiPickerImageUrlItem> get items =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmojiPickerCustomImageUrlCategoryItemsCopyWith<
          EmojiPickerCustomImageUrlCategoryItems>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmojiPickerCustomImageUrlCategoryItemsCopyWith<$Res> {
  factory $EmojiPickerCustomImageUrlCategoryItemsCopyWith(
          EmojiPickerCustomImageUrlCategoryItems value,
          $Res Function(EmojiPickerCustomImageUrlCategoryItems) then) =
      _$EmojiPickerCustomImageUrlCategoryItemsCopyWithImpl<$Res>;
  $Res call({@HiveField(0) List<CustomEmojiPickerImageUrlItem> items});
}

/// @nodoc
class _$EmojiPickerCustomImageUrlCategoryItemsCopyWithImpl<$Res>
    implements $EmojiPickerCustomImageUrlCategoryItemsCopyWith<$Res> {
  _$EmojiPickerCustomImageUrlCategoryItemsCopyWithImpl(this._value, this._then);

  final EmojiPickerCustomImageUrlCategoryItems _value;
  // ignore: unused_field
  final $Res Function(EmojiPickerCustomImageUrlCategoryItems) _then;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CustomEmojiPickerImageUrlItem>,
    ));
  }
}

/// @nodoc
abstract class _$EmojiPickerCustomImageUrlCategoryItemsCopyWith<$Res>
    implements $EmojiPickerCustomImageUrlCategoryItemsCopyWith<$Res> {
  factory _$EmojiPickerCustomImageUrlCategoryItemsCopyWith(
          _EmojiPickerCustomImageUrlCategoryItems value,
          $Res Function(_EmojiPickerCustomImageUrlCategoryItems) then) =
      __$EmojiPickerCustomImageUrlCategoryItemsCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) List<CustomEmojiPickerImageUrlItem> items});
}

/// @nodoc
class __$EmojiPickerCustomImageUrlCategoryItemsCopyWithImpl<$Res>
    extends _$EmojiPickerCustomImageUrlCategoryItemsCopyWithImpl<$Res>
    implements _$EmojiPickerCustomImageUrlCategoryItemsCopyWith<$Res> {
  __$EmojiPickerCustomImageUrlCategoryItemsCopyWithImpl(
      _EmojiPickerCustomImageUrlCategoryItems _value,
      $Res Function(_EmojiPickerCustomImageUrlCategoryItems) _then)
      : super(
            _value, (v) => _then(v as _EmojiPickerCustomImageUrlCategoryItems));

  @override
  _EmojiPickerCustomImageUrlCategoryItems get _value =>
      super._value as _EmojiPickerCustomImageUrlCategoryItems;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_EmojiPickerCustomImageUrlCategoryItems(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CustomEmojiPickerImageUrlItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EmojiPickerCustomImageUrlCategoryItems
    implements _EmojiPickerCustomImageUrlCategoryItems {
  const _$_EmojiPickerCustomImageUrlCategoryItems(
      {@HiveField(0) required this.items});

  factory _$_EmojiPickerCustomImageUrlCategoryItems.fromJson(
          Map<String, dynamic> json) =>
      _$$_EmojiPickerCustomImageUrlCategoryItemsFromJson(json);

  @override
  @HiveField(0)
  final List<CustomEmojiPickerImageUrlItem> items;

  @override
  String toString() {
    return 'EmojiPickerCustomImageUrlCategoryItems(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EmojiPickerCustomImageUrlCategoryItems &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(items);

  @JsonKey(ignore: true)
  @override
  _$EmojiPickerCustomImageUrlCategoryItemsCopyWith<
          _EmojiPickerCustomImageUrlCategoryItems>
      get copyWith => __$EmojiPickerCustomImageUrlCategoryItemsCopyWithImpl<
          _EmojiPickerCustomImageUrlCategoryItems>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmojiPickerCustomImageUrlCategoryItemsToJson(this);
  }
}

abstract class _EmojiPickerCustomImageUrlCategoryItems
    implements EmojiPickerCustomImageUrlCategoryItems {
  const factory _EmojiPickerCustomImageUrlCategoryItems(
          {@HiveField(0) required List<CustomEmojiPickerImageUrlItem> items}) =
      _$_EmojiPickerCustomImageUrlCategoryItems;

  factory _EmojiPickerCustomImageUrlCategoryItems.fromJson(
          Map<String, dynamic> json) =
      _$_EmojiPickerCustomImageUrlCategoryItems.fromJson;

  @override
  @HiveField(0)
  List<CustomEmojiPickerImageUrlItem> get items =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EmojiPickerCustomImageUrlCategoryItemsCopyWith<
          _EmojiPickerCustomImageUrlCategoryItems>
      get copyWith => throw _privateConstructorUsedError;
}
