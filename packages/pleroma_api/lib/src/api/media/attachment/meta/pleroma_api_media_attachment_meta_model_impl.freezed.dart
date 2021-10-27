// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_media_attachment_meta_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiMediaAttachmentMeta _$PleromaApiMediaAttachmentMetaFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiMediaAttachmentMeta.fromJson(json);
}

/// @nodoc
class _$PleromaApiMediaAttachmentMetaTearOff {
  const _$PleromaApiMediaAttachmentMetaTearOff();

  _PleromaApiMediaAttachmentMeta call(
      {@HiveField(0) required PleromaApiMediaAttachmentFocus? focus,
      @HiveField(1) required PleromaApiMediaAttachmentSize? original,
      @HiveField(2) required PleromaApiMediaAttachmentSize? small}) {
    return _PleromaApiMediaAttachmentMeta(
      focus: focus,
      original: original,
      small: small,
    );
  }

  PleromaApiMediaAttachmentMeta fromJson(Map<String, Object?> json) {
    return PleromaApiMediaAttachmentMeta.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiMediaAttachmentMeta = _$PleromaApiMediaAttachmentMetaTearOff();

/// @nodoc
mixin _$PleromaApiMediaAttachmentMeta {
  @HiveField(0)
  PleromaApiMediaAttachmentFocus? get focus =>
      throw _privateConstructorUsedError;
  @HiveField(1)
  PleromaApiMediaAttachmentSize? get original =>
      throw _privateConstructorUsedError;
  @HiveField(2)
  PleromaApiMediaAttachmentSize? get small =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiMediaAttachmentMetaCopyWith<PleromaApiMediaAttachmentMeta>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiMediaAttachmentMetaCopyWith<$Res> {
  factory $PleromaApiMediaAttachmentMetaCopyWith(
          PleromaApiMediaAttachmentMeta value,
          $Res Function(PleromaApiMediaAttachmentMeta) then) =
      _$PleromaApiMediaAttachmentMetaCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) PleromaApiMediaAttachmentFocus? focus,
      @HiveField(1) PleromaApiMediaAttachmentSize? original,
      @HiveField(2) PleromaApiMediaAttachmentSize? small});

  $PleromaApiMediaAttachmentFocusCopyWith<$Res>? get focus;
  $PleromaApiMediaAttachmentSizeCopyWith<$Res>? get original;
  $PleromaApiMediaAttachmentSizeCopyWith<$Res>? get small;
}

/// @nodoc
class _$PleromaApiMediaAttachmentMetaCopyWithImpl<$Res>
    implements $PleromaApiMediaAttachmentMetaCopyWith<$Res> {
  _$PleromaApiMediaAttachmentMetaCopyWithImpl(this._value, this._then);

  final PleromaApiMediaAttachmentMeta _value;
  // ignore: unused_field
  final $Res Function(PleromaApiMediaAttachmentMeta) _then;

  @override
  $Res call({
    Object? focus = freezed,
    Object? original = freezed,
    Object? small = freezed,
  }) {
    return _then(_value.copyWith(
      focus: focus == freezed
          ? _value.focus
          : focus // ignore: cast_nullable_to_non_nullable
              as PleromaApiMediaAttachmentFocus?,
      original: original == freezed
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as PleromaApiMediaAttachmentSize?,
      small: small == freezed
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as PleromaApiMediaAttachmentSize?,
    ));
  }

  @override
  $PleromaApiMediaAttachmentFocusCopyWith<$Res>? get focus {
    if (_value.focus == null) {
      return null;
    }

    return $PleromaApiMediaAttachmentFocusCopyWith<$Res>(_value.focus!,
        (value) {
      return _then(_value.copyWith(focus: value));
    });
  }

  @override
  $PleromaApiMediaAttachmentSizeCopyWith<$Res>? get original {
    if (_value.original == null) {
      return null;
    }

    return $PleromaApiMediaAttachmentSizeCopyWith<$Res>(_value.original!,
        (value) {
      return _then(_value.copyWith(original: value));
    });
  }

  @override
  $PleromaApiMediaAttachmentSizeCopyWith<$Res>? get small {
    if (_value.small == null) {
      return null;
    }

    return $PleromaApiMediaAttachmentSizeCopyWith<$Res>(_value.small!, (value) {
      return _then(_value.copyWith(small: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiMediaAttachmentMetaCopyWith<$Res>
    implements $PleromaApiMediaAttachmentMetaCopyWith<$Res> {
  factory _$PleromaApiMediaAttachmentMetaCopyWith(
          _PleromaApiMediaAttachmentMeta value,
          $Res Function(_PleromaApiMediaAttachmentMeta) then) =
      __$PleromaApiMediaAttachmentMetaCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) PleromaApiMediaAttachmentFocus? focus,
      @HiveField(1) PleromaApiMediaAttachmentSize? original,
      @HiveField(2) PleromaApiMediaAttachmentSize? small});

  @override
  $PleromaApiMediaAttachmentFocusCopyWith<$Res>? get focus;
  @override
  $PleromaApiMediaAttachmentSizeCopyWith<$Res>? get original;
  @override
  $PleromaApiMediaAttachmentSizeCopyWith<$Res>? get small;
}

/// @nodoc
class __$PleromaApiMediaAttachmentMetaCopyWithImpl<$Res>
    extends _$PleromaApiMediaAttachmentMetaCopyWithImpl<$Res>
    implements _$PleromaApiMediaAttachmentMetaCopyWith<$Res> {
  __$PleromaApiMediaAttachmentMetaCopyWithImpl(
      _PleromaApiMediaAttachmentMeta _value,
      $Res Function(_PleromaApiMediaAttachmentMeta) _then)
      : super(_value, (v) => _then(v as _PleromaApiMediaAttachmentMeta));

  @override
  _PleromaApiMediaAttachmentMeta get _value =>
      super._value as _PleromaApiMediaAttachmentMeta;

  @override
  $Res call({
    Object? focus = freezed,
    Object? original = freezed,
    Object? small = freezed,
  }) {
    return _then(_PleromaApiMediaAttachmentMeta(
      focus: focus == freezed
          ? _value.focus
          : focus // ignore: cast_nullable_to_non_nullable
              as PleromaApiMediaAttachmentFocus?,
      original: original == freezed
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as PleromaApiMediaAttachmentSize?,
      small: small == freezed
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as PleromaApiMediaAttachmentSize?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiMediaAttachmentMeta
    implements _PleromaApiMediaAttachmentMeta {
  const _$_PleromaApiMediaAttachmentMeta(
      {@HiveField(0) required this.focus,
      @HiveField(1) required this.original,
      @HiveField(2) required this.small});

  factory _$_PleromaApiMediaAttachmentMeta.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiMediaAttachmentMetaFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiMediaAttachmentFocus? focus;
  @override
  @HiveField(1)
  final PleromaApiMediaAttachmentSize? original;
  @override
  @HiveField(2)
  final PleromaApiMediaAttachmentSize? small;

  @override
  String toString() {
    return 'PleromaApiMediaAttachmentMeta(focus: $focus, original: $original, small: $small)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiMediaAttachmentMeta &&
            (identical(other.focus, focus) || other.focus == focus) &&
            (identical(other.original, original) ||
                other.original == original) &&
            (identical(other.small, small) || other.small == small));
  }

  @override
  int get hashCode => Object.hash(runtimeType, focus, original, small);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiMediaAttachmentMetaCopyWith<_PleromaApiMediaAttachmentMeta>
      get copyWith => __$PleromaApiMediaAttachmentMetaCopyWithImpl<
          _PleromaApiMediaAttachmentMeta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiMediaAttachmentMetaToJson(this);
  }
}

abstract class _PleromaApiMediaAttachmentMeta
    implements PleromaApiMediaAttachmentMeta {
  const factory _PleromaApiMediaAttachmentMeta(
          {@HiveField(0) required PleromaApiMediaAttachmentFocus? focus,
          @HiveField(1) required PleromaApiMediaAttachmentSize? original,
          @HiveField(2) required PleromaApiMediaAttachmentSize? small}) =
      _$_PleromaApiMediaAttachmentMeta;

  factory _PleromaApiMediaAttachmentMeta.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiMediaAttachmentMeta.fromJson;

  @override
  @HiveField(0)
  PleromaApiMediaAttachmentFocus? get focus;
  @override
  @HiveField(1)
  PleromaApiMediaAttachmentSize? get original;
  @override
  @HiveField(2)
  PleromaApiMediaAttachmentSize? get small;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiMediaAttachmentMetaCopyWith<_PleromaApiMediaAttachmentMeta>
      get copyWith => throw _privateConstructorUsedError;
}
