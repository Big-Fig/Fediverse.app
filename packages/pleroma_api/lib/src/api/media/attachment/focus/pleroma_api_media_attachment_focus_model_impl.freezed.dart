// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_media_attachment_focus_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiMediaAttachmentFocus _$PleromaApiMediaAttachmentFocusFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiMediaAttachmentFocus.fromJson(json);
}

/// @nodoc
class _$PleromaApiMediaAttachmentFocusTearOff {
  const _$PleromaApiMediaAttachmentFocusTearOff();

  _PleromaApiMediaAttachmentFocus call(
      {@HiveField(0) required double x, @HiveField(1) required double y}) {
    return _PleromaApiMediaAttachmentFocus(
      x: x,
      y: y,
    );
  }

  PleromaApiMediaAttachmentFocus fromJson(Map<String, Object?> json) {
    return PleromaApiMediaAttachmentFocus.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiMediaAttachmentFocus =
    _$PleromaApiMediaAttachmentFocusTearOff();

/// @nodoc
mixin _$PleromaApiMediaAttachmentFocus {
  @HiveField(0)
  double get x => throw _privateConstructorUsedError;
  @HiveField(1)
  double get y => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiMediaAttachmentFocusCopyWith<PleromaApiMediaAttachmentFocus>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiMediaAttachmentFocusCopyWith<$Res> {
  factory $PleromaApiMediaAttachmentFocusCopyWith(
          PleromaApiMediaAttachmentFocus value,
          $Res Function(PleromaApiMediaAttachmentFocus) then) =
      _$PleromaApiMediaAttachmentFocusCopyWithImpl<$Res>;
  $Res call({@HiveField(0) double x, @HiveField(1) double y});
}

/// @nodoc
class _$PleromaApiMediaAttachmentFocusCopyWithImpl<$Res>
    implements $PleromaApiMediaAttachmentFocusCopyWith<$Res> {
  _$PleromaApiMediaAttachmentFocusCopyWithImpl(this._value, this._then);

  final PleromaApiMediaAttachmentFocus _value;
  // ignore: unused_field
  final $Res Function(PleromaApiMediaAttachmentFocus) _then;

  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_value.copyWith(
      x: x == freezed
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: y == freezed
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiMediaAttachmentFocusCopyWith<$Res>
    implements $PleromaApiMediaAttachmentFocusCopyWith<$Res> {
  factory _$PleromaApiMediaAttachmentFocusCopyWith(
          _PleromaApiMediaAttachmentFocus value,
          $Res Function(_PleromaApiMediaAttachmentFocus) then) =
      __$PleromaApiMediaAttachmentFocusCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) double x, @HiveField(1) double y});
}

/// @nodoc
class __$PleromaApiMediaAttachmentFocusCopyWithImpl<$Res>
    extends _$PleromaApiMediaAttachmentFocusCopyWithImpl<$Res>
    implements _$PleromaApiMediaAttachmentFocusCopyWith<$Res> {
  __$PleromaApiMediaAttachmentFocusCopyWithImpl(
      _PleromaApiMediaAttachmentFocus _value,
      $Res Function(_PleromaApiMediaAttachmentFocus) _then)
      : super(_value, (v) => _then(v as _PleromaApiMediaAttachmentFocus));

  @override
  _PleromaApiMediaAttachmentFocus get _value =>
      super._value as _PleromaApiMediaAttachmentFocus;

  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_PleromaApiMediaAttachmentFocus(
      x: x == freezed
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: y == freezed
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiMediaAttachmentFocus
    implements _PleromaApiMediaAttachmentFocus {
  const _$_PleromaApiMediaAttachmentFocus(
      {@HiveField(0) required this.x, @HiveField(1) required this.y})
      : assert(
          x >= -1 && x <= 1,
        ),
        assert(
          y >= -1 && y <= 1,
        );

  factory _$_PleromaApiMediaAttachmentFocus.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiMediaAttachmentFocusFromJson(json);

  @override
  @HiveField(0)
  final double x;
  @override
  @HiveField(1)
  final double y;

  @override
  String toString() {
    return 'PleromaApiMediaAttachmentFocus(x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiMediaAttachmentFocus &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @override
  int get hashCode => Object.hash(runtimeType, x, y);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiMediaAttachmentFocusCopyWith<_PleromaApiMediaAttachmentFocus>
      get copyWith => __$PleromaApiMediaAttachmentFocusCopyWithImpl<
          _PleromaApiMediaAttachmentFocus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiMediaAttachmentFocusToJson(this);
  }
}

abstract class _PleromaApiMediaAttachmentFocus
    implements PleromaApiMediaAttachmentFocus {
  const factory _PleromaApiMediaAttachmentFocus(
      {@HiveField(0) required double x,
      @HiveField(1) required double y}) = _$_PleromaApiMediaAttachmentFocus;

  factory _PleromaApiMediaAttachmentFocus.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiMediaAttachmentFocus.fromJson;

  @override
  @HiveField(0)
  double get x;
  @override
  @HiveField(1)
  double get y;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiMediaAttachmentFocusCopyWith<_PleromaApiMediaAttachmentFocus>
      get copyWith => throw _privateConstructorUsedError;
}
