// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_media_attachment_size_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiMediaAttachmentSize _$UnifediApiMediaAttachmentSizeFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiMediaAttachmentSize.fromJson(json);
}

/// @nodoc
class _$UnifediApiMediaAttachmentSizeTearOff {
  const _$UnifediApiMediaAttachmentSizeTearOff();

  _UnifediApiMediaAttachmentSize call(
      {@HiveField(0) required int width,
      @HiveField(1) required int height,
      @HiveField(2) required String? size,
      @HiveField(3) required double? aspect}) {
    return _UnifediApiMediaAttachmentSize(
      width: width,
      height: height,
      size: size,
      aspect: aspect,
    );
  }

  UnifediApiMediaAttachmentSize fromJson(Map<String, Object> json) {
    return UnifediApiMediaAttachmentSize.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiMediaAttachmentSize = _$UnifediApiMediaAttachmentSizeTearOff();

/// @nodoc
mixin _$UnifediApiMediaAttachmentSize {
  @HiveField(0)
  int get width => throw _privateConstructorUsedError;
  @HiveField(1)
  int get height => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get size => throw _privateConstructorUsedError;
  @HiveField(3)
  double? get aspect => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiMediaAttachmentSizeCopyWith<UnifediApiMediaAttachmentSize>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiMediaAttachmentSizeCopyWith<$Res> {
  factory $UnifediApiMediaAttachmentSizeCopyWith(
          UnifediApiMediaAttachmentSize value,
          $Res Function(UnifediApiMediaAttachmentSize) then) =
      _$UnifediApiMediaAttachmentSizeCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int width,
      @HiveField(1) int height,
      @HiveField(2) String? size,
      @HiveField(3) double? aspect});
}

/// @nodoc
class _$UnifediApiMediaAttachmentSizeCopyWithImpl<$Res>
    implements $UnifediApiMediaAttachmentSizeCopyWith<$Res> {
  _$UnifediApiMediaAttachmentSizeCopyWithImpl(this._value, this._then);

  final UnifediApiMediaAttachmentSize _value;
  // ignore: unused_field
  final $Res Function(UnifediApiMediaAttachmentSize) _then;

  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? size = freezed,
    Object? aspect = freezed,
  }) {
    return _then(_value.copyWith(
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String?,
      aspect: aspect == freezed
          ? _value.aspect
          : aspect // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiMediaAttachmentSizeCopyWith<$Res>
    implements $UnifediApiMediaAttachmentSizeCopyWith<$Res> {
  factory _$UnifediApiMediaAttachmentSizeCopyWith(
          _UnifediApiMediaAttachmentSize value,
          $Res Function(_UnifediApiMediaAttachmentSize) then) =
      __$UnifediApiMediaAttachmentSizeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int width,
      @HiveField(1) int height,
      @HiveField(2) String? size,
      @HiveField(3) double? aspect});
}

/// @nodoc
class __$UnifediApiMediaAttachmentSizeCopyWithImpl<$Res>
    extends _$UnifediApiMediaAttachmentSizeCopyWithImpl<$Res>
    implements _$UnifediApiMediaAttachmentSizeCopyWith<$Res> {
  __$UnifediApiMediaAttachmentSizeCopyWithImpl(
      _UnifediApiMediaAttachmentSize _value,
      $Res Function(_UnifediApiMediaAttachmentSize) _then)
      : super(_value, (v) => _then(v as _UnifediApiMediaAttachmentSize));

  @override
  _UnifediApiMediaAttachmentSize get _value =>
      super._value as _UnifediApiMediaAttachmentSize;

  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? size = freezed,
    Object? aspect = freezed,
  }) {
    return _then(_UnifediApiMediaAttachmentSize(
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String?,
      aspect: aspect == freezed
          ? _value.aspect
          : aspect // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiMediaAttachmentSize
    implements _UnifediApiMediaAttachmentSize {
  const _$_UnifediApiMediaAttachmentSize(
      {@HiveField(0) required this.width,
      @HiveField(1) required this.height,
      @HiveField(2) required this.size,
      @HiveField(3) required this.aspect});

  factory _$_UnifediApiMediaAttachmentSize.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiMediaAttachmentSizeFromJson(json);

  @override
  @HiveField(0)
  final int width;
  @override
  @HiveField(1)
  final int height;
  @override
  @HiveField(2)
  final String? size;
  @override
  @HiveField(3)
  final double? aspect;

  @override
  String toString() {
    return 'UnifediApiMediaAttachmentSize(width: $width, height: $height, size: $size, aspect: $aspect)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiMediaAttachmentSize &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.aspect, aspect) ||
                const DeepCollectionEquality().equals(other.aspect, aspect)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(width) ^
      const DeepCollectionEquality().hash(height) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(aspect);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiMediaAttachmentSizeCopyWith<_UnifediApiMediaAttachmentSize>
      get copyWith => __$UnifediApiMediaAttachmentSizeCopyWithImpl<
          _UnifediApiMediaAttachmentSize>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiMediaAttachmentSizeToJson(this);
  }
}

abstract class _UnifediApiMediaAttachmentSize
    implements UnifediApiMediaAttachmentSize {
  const factory _UnifediApiMediaAttachmentSize(
          {@HiveField(0) required int width,
          @HiveField(1) required int height,
          @HiveField(2) required String? size,
          @HiveField(3) required double? aspect}) =
      _$_UnifediApiMediaAttachmentSize;

  factory _UnifediApiMediaAttachmentSize.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiMediaAttachmentSize.fromJson;

  @override
  @HiveField(0)
  int get width => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  int get height => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String? get size => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  double? get aspect => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiMediaAttachmentSizeCopyWith<_UnifediApiMediaAttachmentSize>
      get copyWith => throw _privateConstructorUsedError;
}
