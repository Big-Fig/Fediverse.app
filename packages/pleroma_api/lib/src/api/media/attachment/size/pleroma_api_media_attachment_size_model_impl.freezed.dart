// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_media_attachment_size_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiMediaAttachmentSize _$PleromaApiMediaAttachmentSizeFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiMediaAttachmentSize.fromJson(json);
}

/// @nodoc
class _$PleromaApiMediaAttachmentSizeTearOff {
  const _$PleromaApiMediaAttachmentSizeTearOff();

  _PleromaApiMediaAttachmentSize call(
      {@HiveField(0) required int width,
      @HiveField(1) required int height,
      @HiveField(2) required String? size,
      @HiveField(3) required double? aspect}) {
    return _PleromaApiMediaAttachmentSize(
      width: width,
      height: height,
      size: size,
      aspect: aspect,
    );
  }

  PleromaApiMediaAttachmentSize fromJson(Map<String, Object> json) {
    return PleromaApiMediaAttachmentSize.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiMediaAttachmentSize = _$PleromaApiMediaAttachmentSizeTearOff();

/// @nodoc
mixin _$PleromaApiMediaAttachmentSize {
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
  $PleromaApiMediaAttachmentSizeCopyWith<PleromaApiMediaAttachmentSize>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiMediaAttachmentSizeCopyWith<$Res> {
  factory $PleromaApiMediaAttachmentSizeCopyWith(
          PleromaApiMediaAttachmentSize value,
          $Res Function(PleromaApiMediaAttachmentSize) then) =
      _$PleromaApiMediaAttachmentSizeCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int width,
      @HiveField(1) int height,
      @HiveField(2) String? size,
      @HiveField(3) double? aspect});
}

/// @nodoc
class _$PleromaApiMediaAttachmentSizeCopyWithImpl<$Res>
    implements $PleromaApiMediaAttachmentSizeCopyWith<$Res> {
  _$PleromaApiMediaAttachmentSizeCopyWithImpl(this._value, this._then);

  final PleromaApiMediaAttachmentSize _value;
  // ignore: unused_field
  final $Res Function(PleromaApiMediaAttachmentSize) _then;

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
abstract class _$PleromaApiMediaAttachmentSizeCopyWith<$Res>
    implements $PleromaApiMediaAttachmentSizeCopyWith<$Res> {
  factory _$PleromaApiMediaAttachmentSizeCopyWith(
          _PleromaApiMediaAttachmentSize value,
          $Res Function(_PleromaApiMediaAttachmentSize) then) =
      __$PleromaApiMediaAttachmentSizeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int width,
      @HiveField(1) int height,
      @HiveField(2) String? size,
      @HiveField(3) double? aspect});
}

/// @nodoc
class __$PleromaApiMediaAttachmentSizeCopyWithImpl<$Res>
    extends _$PleromaApiMediaAttachmentSizeCopyWithImpl<$Res>
    implements _$PleromaApiMediaAttachmentSizeCopyWith<$Res> {
  __$PleromaApiMediaAttachmentSizeCopyWithImpl(
      _PleromaApiMediaAttachmentSize _value,
      $Res Function(_PleromaApiMediaAttachmentSize) _then)
      : super(_value, (v) => _then(v as _PleromaApiMediaAttachmentSize));

  @override
  _PleromaApiMediaAttachmentSize get _value =>
      super._value as _PleromaApiMediaAttachmentSize;

  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? size = freezed,
    Object? aspect = freezed,
  }) {
    return _then(_PleromaApiMediaAttachmentSize(
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
class _$_PleromaApiMediaAttachmentSize
    implements _PleromaApiMediaAttachmentSize {
  const _$_PleromaApiMediaAttachmentSize(
      {@HiveField(0) required this.width,
      @HiveField(1) required this.height,
      @HiveField(2) required this.size,
      @HiveField(3) required this.aspect});

  factory _$_PleromaApiMediaAttachmentSize.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiMediaAttachmentSizeFromJson(json);

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
    return 'PleromaApiMediaAttachmentSize(width: $width, height: $height, size: $size, aspect: $aspect)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiMediaAttachmentSize &&
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
  _$PleromaApiMediaAttachmentSizeCopyWith<_PleromaApiMediaAttachmentSize>
      get copyWith => __$PleromaApiMediaAttachmentSizeCopyWithImpl<
          _PleromaApiMediaAttachmentSize>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiMediaAttachmentSizeToJson(this);
  }
}

abstract class _PleromaApiMediaAttachmentSize
    implements PleromaApiMediaAttachmentSize {
  const factory _PleromaApiMediaAttachmentSize(
          {@HiveField(0) required int width,
          @HiveField(1) required int height,
          @HiveField(2) required String? size,
          @HiveField(3) required double? aspect}) =
      _$_PleromaApiMediaAttachmentSize;

  factory _PleromaApiMediaAttachmentSize.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiMediaAttachmentSize.fromJson;

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
  _$PleromaApiMediaAttachmentSizeCopyWith<_PleromaApiMediaAttachmentSize>
      get copyWith => throw _privateConstructorUsedError;
}
