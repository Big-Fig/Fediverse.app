// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'custom_emoji_picker_code_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomEmojiPickerCodeItem _$CustomEmojiPickerCodeItemFromJson(
    Map<String, dynamic> json) {
  return _CustomEmojiPickerCodeItem.fromJson(json);
}

/// @nodoc
class _$CustomEmojiPickerCodeItemTearOff {
  const _$CustomEmojiPickerCodeItemTearOff();

  _CustomEmojiPickerCodeItem call(
      {@HiveField(0) required String name,
      @HiveField(1) required String code}) {
    return _CustomEmojiPickerCodeItem(
      name: name,
      code: code,
    );
  }

  CustomEmojiPickerCodeItem fromJson(Map<String, Object> json) {
    return CustomEmojiPickerCodeItem.fromJson(json);
  }
}

/// @nodoc
const $CustomEmojiPickerCodeItem = _$CustomEmojiPickerCodeItemTearOff();

/// @nodoc
mixin _$CustomEmojiPickerCodeItem {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomEmojiPickerCodeItemCopyWith<CustomEmojiPickerCodeItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomEmojiPickerCodeItemCopyWith<$Res> {
  factory $CustomEmojiPickerCodeItemCopyWith(CustomEmojiPickerCodeItem value,
          $Res Function(CustomEmojiPickerCodeItem) then) =
      _$CustomEmojiPickerCodeItemCopyWithImpl<$Res>;
  $Res call({@HiveField(0) String name, @HiveField(1) String code});
}

/// @nodoc
class _$CustomEmojiPickerCodeItemCopyWithImpl<$Res>
    implements $CustomEmojiPickerCodeItemCopyWith<$Res> {
  _$CustomEmojiPickerCodeItemCopyWithImpl(this._value, this._then);

  final CustomEmojiPickerCodeItem _value;
  // ignore: unused_field
  final $Res Function(CustomEmojiPickerCodeItem) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CustomEmojiPickerCodeItemCopyWith<$Res>
    implements $CustomEmojiPickerCodeItemCopyWith<$Res> {
  factory _$CustomEmojiPickerCodeItemCopyWith(_CustomEmojiPickerCodeItem value,
          $Res Function(_CustomEmojiPickerCodeItem) then) =
      __$CustomEmojiPickerCodeItemCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) String name, @HiveField(1) String code});
}

/// @nodoc
class __$CustomEmojiPickerCodeItemCopyWithImpl<$Res>
    extends _$CustomEmojiPickerCodeItemCopyWithImpl<$Res>
    implements _$CustomEmojiPickerCodeItemCopyWith<$Res> {
  __$CustomEmojiPickerCodeItemCopyWithImpl(_CustomEmojiPickerCodeItem _value,
      $Res Function(_CustomEmojiPickerCodeItem) _then)
      : super(_value, (v) => _then(v as _CustomEmojiPickerCodeItem));

  @override
  _CustomEmojiPickerCodeItem get _value =>
      super._value as _CustomEmojiPickerCodeItem;

  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
  }) {
    return _then(_CustomEmojiPickerCodeItem(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomEmojiPickerCodeItem extends _CustomEmojiPickerCodeItem {
  const _$_CustomEmojiPickerCodeItem(
      {@HiveField(0) required this.name, @HiveField(1) required this.code})
      : super._();

  factory _$_CustomEmojiPickerCodeItem.fromJson(Map<String, dynamic> json) =>
      _$$_CustomEmojiPickerCodeItemFromJson(json);

  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final String code;

  @override
  String toString() {
    return 'CustomEmojiPickerCodeItem(name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CustomEmojiPickerCodeItem &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(code);

  @JsonKey(ignore: true)
  @override
  _$CustomEmojiPickerCodeItemCopyWith<_CustomEmojiPickerCodeItem>
      get copyWith =>
          __$CustomEmojiPickerCodeItemCopyWithImpl<_CustomEmojiPickerCodeItem>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomEmojiPickerCodeItemToJson(this);
  }
}

abstract class _CustomEmojiPickerCodeItem extends CustomEmojiPickerCodeItem {
  const factory _CustomEmojiPickerCodeItem(
      {@HiveField(0) required String name,
      @HiveField(1) required String code}) = _$_CustomEmojiPickerCodeItem;
  const _CustomEmojiPickerCodeItem._() : super._();

  factory _CustomEmojiPickerCodeItem.fromJson(Map<String, dynamic> json) =
      _$_CustomEmojiPickerCodeItem.fromJson;

  @override
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CustomEmojiPickerCodeItemCopyWith<_CustomEmojiPickerCodeItem>
      get copyWith => throw _privateConstructorUsedError;
}
