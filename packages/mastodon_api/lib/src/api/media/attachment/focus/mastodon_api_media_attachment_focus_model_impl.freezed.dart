// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_media_attachment_focus_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiMediaAttachmentFocus _$MastodonApiMediaAttachmentFocusFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiMediaAttachmentFocus.fromJson(json);
}

/// @nodoc
class _$MastodonApiMediaAttachmentFocusTearOff {
  const _$MastodonApiMediaAttachmentFocusTearOff();

  _MastodonApiMediaAttachmentFocus call(
      {@HiveField(0) required double x, @HiveField(1) required double y}) {
    return _MastodonApiMediaAttachmentFocus(
      x: x,
      y: y,
    );
  }

  MastodonApiMediaAttachmentFocus fromJson(Map<String, Object?> json) {
    return MastodonApiMediaAttachmentFocus.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiMediaAttachmentFocus =
    _$MastodonApiMediaAttachmentFocusTearOff();

/// @nodoc
mixin _$MastodonApiMediaAttachmentFocus {
  @HiveField(0)
  double get x => throw _privateConstructorUsedError;
  @HiveField(1)
  double get y => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiMediaAttachmentFocusCopyWith<MastodonApiMediaAttachmentFocus>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiMediaAttachmentFocusCopyWith<$Res> {
  factory $MastodonApiMediaAttachmentFocusCopyWith(
          MastodonApiMediaAttachmentFocus value,
          $Res Function(MastodonApiMediaAttachmentFocus) then) =
      _$MastodonApiMediaAttachmentFocusCopyWithImpl<$Res>;
  $Res call({@HiveField(0) double x, @HiveField(1) double y});
}

/// @nodoc
class _$MastodonApiMediaAttachmentFocusCopyWithImpl<$Res>
    implements $MastodonApiMediaAttachmentFocusCopyWith<$Res> {
  _$MastodonApiMediaAttachmentFocusCopyWithImpl(this._value, this._then);

  final MastodonApiMediaAttachmentFocus _value;
  // ignore: unused_field
  final $Res Function(MastodonApiMediaAttachmentFocus) _then;

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
abstract class _$MastodonApiMediaAttachmentFocusCopyWith<$Res>
    implements $MastodonApiMediaAttachmentFocusCopyWith<$Res> {
  factory _$MastodonApiMediaAttachmentFocusCopyWith(
          _MastodonApiMediaAttachmentFocus value,
          $Res Function(_MastodonApiMediaAttachmentFocus) then) =
      __$MastodonApiMediaAttachmentFocusCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) double x, @HiveField(1) double y});
}

/// @nodoc
class __$MastodonApiMediaAttachmentFocusCopyWithImpl<$Res>
    extends _$MastodonApiMediaAttachmentFocusCopyWithImpl<$Res>
    implements _$MastodonApiMediaAttachmentFocusCopyWith<$Res> {
  __$MastodonApiMediaAttachmentFocusCopyWithImpl(
      _MastodonApiMediaAttachmentFocus _value,
      $Res Function(_MastodonApiMediaAttachmentFocus) _then)
      : super(_value, (v) => _then(v as _MastodonApiMediaAttachmentFocus));

  @override
  _MastodonApiMediaAttachmentFocus get _value =>
      super._value as _MastodonApiMediaAttachmentFocus;

  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_MastodonApiMediaAttachmentFocus(
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
class _$_MastodonApiMediaAttachmentFocus
    implements _MastodonApiMediaAttachmentFocus {
  const _$_MastodonApiMediaAttachmentFocus(
      {@HiveField(0) required this.x, @HiveField(1) required this.y})
      : assert(
          x >= -1 && x <= -1,
        ),
        assert(
          y >= -1 && y <= -1,
        );

  factory _$_MastodonApiMediaAttachmentFocus.fromJson(
          Map<String, dynamic> json) =>
      _$$_MastodonApiMediaAttachmentFocusFromJson(json);

  @override
  @HiveField(0)
  final double x;
  @override
  @HiveField(1)
  final double y;

  @override
  String toString() {
    return 'MastodonApiMediaAttachmentFocus(x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiMediaAttachmentFocus &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @override
  int get hashCode => Object.hash(runtimeType, x, y);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiMediaAttachmentFocusCopyWith<_MastodonApiMediaAttachmentFocus>
      get copyWith => __$MastodonApiMediaAttachmentFocusCopyWithImpl<
          _MastodonApiMediaAttachmentFocus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiMediaAttachmentFocusToJson(this);
  }
}

abstract class _MastodonApiMediaAttachmentFocus
    implements MastodonApiMediaAttachmentFocus {
  const factory _MastodonApiMediaAttachmentFocus(
      {@HiveField(0) required double x,
      @HiveField(1) required double y}) = _$_MastodonApiMediaAttachmentFocus;

  factory _MastodonApiMediaAttachmentFocus.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiMediaAttachmentFocus.fromJson;

  @override
  @HiveField(0)
  double get x;
  @override
  @HiveField(1)
  double get y;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiMediaAttachmentFocusCopyWith<_MastodonApiMediaAttachmentFocus>
      get copyWith => throw _privateConstructorUsedError;
}
