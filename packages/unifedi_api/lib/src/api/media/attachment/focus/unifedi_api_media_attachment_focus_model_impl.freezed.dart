// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_media_attachment_focus_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiMediaAttachmentFocus _$UnifediApiMediaAttachmentFocusFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiMediaAttachmentFocus.fromJson(json);
}

/// @nodoc
class _$UnifediApiMediaAttachmentFocusTearOff {
  const _$UnifediApiMediaAttachmentFocusTearOff();

  _UnifediApiMediaAttachmentFocus call(
      {@HiveField(0) required double x, @HiveField(1) required double y}) {
    return _UnifediApiMediaAttachmentFocus(
      x: x,
      y: y,
    );
  }

  UnifediApiMediaAttachmentFocus fromJson(Map<String, Object> json) {
    return UnifediApiMediaAttachmentFocus.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiMediaAttachmentFocus =
    _$UnifediApiMediaAttachmentFocusTearOff();

/// @nodoc
mixin _$UnifediApiMediaAttachmentFocus {
  @HiveField(0)
  double get x => throw _privateConstructorUsedError;
  @HiveField(1)
  double get y => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiMediaAttachmentFocusCopyWith<UnifediApiMediaAttachmentFocus>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiMediaAttachmentFocusCopyWith<$Res> {
  factory $UnifediApiMediaAttachmentFocusCopyWith(
          UnifediApiMediaAttachmentFocus value,
          $Res Function(UnifediApiMediaAttachmentFocus) then) =
      _$UnifediApiMediaAttachmentFocusCopyWithImpl<$Res>;
  $Res call({@HiveField(0) double x, @HiveField(1) double y});
}

/// @nodoc
class _$UnifediApiMediaAttachmentFocusCopyWithImpl<$Res>
    implements $UnifediApiMediaAttachmentFocusCopyWith<$Res> {
  _$UnifediApiMediaAttachmentFocusCopyWithImpl(this._value, this._then);

  final UnifediApiMediaAttachmentFocus _value;
  // ignore: unused_field
  final $Res Function(UnifediApiMediaAttachmentFocus) _then;

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
abstract class _$UnifediApiMediaAttachmentFocusCopyWith<$Res>
    implements $UnifediApiMediaAttachmentFocusCopyWith<$Res> {
  factory _$UnifediApiMediaAttachmentFocusCopyWith(
          _UnifediApiMediaAttachmentFocus value,
          $Res Function(_UnifediApiMediaAttachmentFocus) then) =
      __$UnifediApiMediaAttachmentFocusCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) double x, @HiveField(1) double y});
}

/// @nodoc
class __$UnifediApiMediaAttachmentFocusCopyWithImpl<$Res>
    extends _$UnifediApiMediaAttachmentFocusCopyWithImpl<$Res>
    implements _$UnifediApiMediaAttachmentFocusCopyWith<$Res> {
  __$UnifediApiMediaAttachmentFocusCopyWithImpl(
      _UnifediApiMediaAttachmentFocus _value,
      $Res Function(_UnifediApiMediaAttachmentFocus) _then)
      : super(_value, (v) => _then(v as _UnifediApiMediaAttachmentFocus));

  @override
  _UnifediApiMediaAttachmentFocus get _value =>
      super._value as _UnifediApiMediaAttachmentFocus;

  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_UnifediApiMediaAttachmentFocus(
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
class _$_UnifediApiMediaAttachmentFocus
    implements _UnifediApiMediaAttachmentFocus {
  const _$_UnifediApiMediaAttachmentFocus(
      {@HiveField(0) required this.x, @HiveField(1) required this.y})
      : assert(
          x >= -1 && x <= 1,
        ),
        assert(
          y >= -1 && y <= 1,
        );

  factory _$_UnifediApiMediaAttachmentFocus.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiMediaAttachmentFocusFromJson(json);

  @override
  @HiveField(0)
  final double x;
  @override
  @HiveField(1)
  final double y;

  @override
  String toString() {
    return 'UnifediApiMediaAttachmentFocus(x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiMediaAttachmentFocus &&
            (identical(other.x, x) ||
                const DeepCollectionEquality().equals(other.x, x)) &&
            (identical(other.y, y) ||
                const DeepCollectionEquality().equals(other.y, y)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(x) ^
      const DeepCollectionEquality().hash(y);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiMediaAttachmentFocusCopyWith<_UnifediApiMediaAttachmentFocus>
      get copyWith => __$UnifediApiMediaAttachmentFocusCopyWithImpl<
          _UnifediApiMediaAttachmentFocus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiMediaAttachmentFocusToJson(this);
  }
}

abstract class _UnifediApiMediaAttachmentFocus
    implements UnifediApiMediaAttachmentFocus {
  const factory _UnifediApiMediaAttachmentFocus(
      {@HiveField(0) required double x,
      @HiveField(1) required double y}) = _$_UnifediApiMediaAttachmentFocus;

  factory _UnifediApiMediaAttachmentFocus.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiMediaAttachmentFocus.fromJson;

  @override
  @HiveField(0)
  double get x => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  double get y => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiMediaAttachmentFocusCopyWith<_UnifediApiMediaAttachmentFocus>
      get copyWith => throw _privateConstructorUsedError;
}
