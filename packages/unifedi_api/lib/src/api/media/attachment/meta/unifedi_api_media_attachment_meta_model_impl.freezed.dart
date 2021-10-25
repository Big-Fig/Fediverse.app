// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_media_attachment_meta_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiMediaAttachmentMeta _$UnifediApiMediaAttachmentMetaFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiMediaAttachmentMeta.fromJson(json);
}

/// @nodoc
class _$UnifediApiMediaAttachmentMetaTearOff {
  const _$UnifediApiMediaAttachmentMetaTearOff();

  _UnifediApiMediaAttachmentMeta call(
      {@HiveField(0) required UnifediApiMediaAttachmentFocus? focus,
      @HiveField(1) required UnifediApiMediaAttachmentSize? original,
      @HiveField(2) required UnifediApiMediaAttachmentSize? small}) {
    return _UnifediApiMediaAttachmentMeta(
      focus: focus,
      original: original,
      small: small,
    );
  }

  UnifediApiMediaAttachmentMeta fromJson(Map<String, Object> json) {
    return UnifediApiMediaAttachmentMeta.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiMediaAttachmentMeta = _$UnifediApiMediaAttachmentMetaTearOff();

/// @nodoc
mixin _$UnifediApiMediaAttachmentMeta {
  @HiveField(0)
  UnifediApiMediaAttachmentFocus? get focus =>
      throw _privateConstructorUsedError;
  @HiveField(1)
  UnifediApiMediaAttachmentSize? get original =>
      throw _privateConstructorUsedError;
  @HiveField(2)
  UnifediApiMediaAttachmentSize? get small =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiMediaAttachmentMetaCopyWith<UnifediApiMediaAttachmentMeta>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiMediaAttachmentMetaCopyWith<$Res> {
  factory $UnifediApiMediaAttachmentMetaCopyWith(
          UnifediApiMediaAttachmentMeta value,
          $Res Function(UnifediApiMediaAttachmentMeta) then) =
      _$UnifediApiMediaAttachmentMetaCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) UnifediApiMediaAttachmentFocus? focus,
      @HiveField(1) UnifediApiMediaAttachmentSize? original,
      @HiveField(2) UnifediApiMediaAttachmentSize? small});

  $UnifediApiMediaAttachmentFocusCopyWith<$Res>? get focus;
  $UnifediApiMediaAttachmentSizeCopyWith<$Res>? get original;
  $UnifediApiMediaAttachmentSizeCopyWith<$Res>? get small;
}

/// @nodoc
class _$UnifediApiMediaAttachmentMetaCopyWithImpl<$Res>
    implements $UnifediApiMediaAttachmentMetaCopyWith<$Res> {
  _$UnifediApiMediaAttachmentMetaCopyWithImpl(this._value, this._then);

  final UnifediApiMediaAttachmentMeta _value;
  // ignore: unused_field
  final $Res Function(UnifediApiMediaAttachmentMeta) _then;

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
              as UnifediApiMediaAttachmentFocus?,
      original: original == freezed
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as UnifediApiMediaAttachmentSize?,
      small: small == freezed
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as UnifediApiMediaAttachmentSize?,
    ));
  }

  @override
  $UnifediApiMediaAttachmentFocusCopyWith<$Res>? get focus {
    if (_value.focus == null) {
      return null;
    }

    return $UnifediApiMediaAttachmentFocusCopyWith<$Res>(_value.focus!,
        (value) {
      return _then(_value.copyWith(focus: value));
    });
  }

  @override
  $UnifediApiMediaAttachmentSizeCopyWith<$Res>? get original {
    if (_value.original == null) {
      return null;
    }

    return $UnifediApiMediaAttachmentSizeCopyWith<$Res>(_value.original!,
        (value) {
      return _then(_value.copyWith(original: value));
    });
  }

  @override
  $UnifediApiMediaAttachmentSizeCopyWith<$Res>? get small {
    if (_value.small == null) {
      return null;
    }

    return $UnifediApiMediaAttachmentSizeCopyWith<$Res>(_value.small!, (value) {
      return _then(_value.copyWith(small: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiMediaAttachmentMetaCopyWith<$Res>
    implements $UnifediApiMediaAttachmentMetaCopyWith<$Res> {
  factory _$UnifediApiMediaAttachmentMetaCopyWith(
          _UnifediApiMediaAttachmentMeta value,
          $Res Function(_UnifediApiMediaAttachmentMeta) then) =
      __$UnifediApiMediaAttachmentMetaCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) UnifediApiMediaAttachmentFocus? focus,
      @HiveField(1) UnifediApiMediaAttachmentSize? original,
      @HiveField(2) UnifediApiMediaAttachmentSize? small});

  @override
  $UnifediApiMediaAttachmentFocusCopyWith<$Res>? get focus;
  @override
  $UnifediApiMediaAttachmentSizeCopyWith<$Res>? get original;
  @override
  $UnifediApiMediaAttachmentSizeCopyWith<$Res>? get small;
}

/// @nodoc
class __$UnifediApiMediaAttachmentMetaCopyWithImpl<$Res>
    extends _$UnifediApiMediaAttachmentMetaCopyWithImpl<$Res>
    implements _$UnifediApiMediaAttachmentMetaCopyWith<$Res> {
  __$UnifediApiMediaAttachmentMetaCopyWithImpl(
      _UnifediApiMediaAttachmentMeta _value,
      $Res Function(_UnifediApiMediaAttachmentMeta) _then)
      : super(_value, (v) => _then(v as _UnifediApiMediaAttachmentMeta));

  @override
  _UnifediApiMediaAttachmentMeta get _value =>
      super._value as _UnifediApiMediaAttachmentMeta;

  @override
  $Res call({
    Object? focus = freezed,
    Object? original = freezed,
    Object? small = freezed,
  }) {
    return _then(_UnifediApiMediaAttachmentMeta(
      focus: focus == freezed
          ? _value.focus
          : focus // ignore: cast_nullable_to_non_nullable
              as UnifediApiMediaAttachmentFocus?,
      original: original == freezed
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as UnifediApiMediaAttachmentSize?,
      small: small == freezed
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as UnifediApiMediaAttachmentSize?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiMediaAttachmentMeta
    implements _UnifediApiMediaAttachmentMeta {
  const _$_UnifediApiMediaAttachmentMeta(
      {@HiveField(0) required this.focus,
      @HiveField(1) required this.original,
      @HiveField(2) required this.small});

  factory _$_UnifediApiMediaAttachmentMeta.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiMediaAttachmentMetaFromJson(json);

  @override
  @HiveField(0)
  final UnifediApiMediaAttachmentFocus? focus;
  @override
  @HiveField(1)
  final UnifediApiMediaAttachmentSize? original;
  @override
  @HiveField(2)
  final UnifediApiMediaAttachmentSize? small;

  @override
  String toString() {
    return 'UnifediApiMediaAttachmentMeta(focus: $focus, original: $original, small: $small)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiMediaAttachmentMeta &&
            (identical(other.focus, focus) ||
                const DeepCollectionEquality().equals(other.focus, focus)) &&
            (identical(other.original, original) ||
                const DeepCollectionEquality()
                    .equals(other.original, original)) &&
            (identical(other.small, small) ||
                const DeepCollectionEquality().equals(other.small, small)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(focus) ^
      const DeepCollectionEquality().hash(original) ^
      const DeepCollectionEquality().hash(small);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiMediaAttachmentMetaCopyWith<_UnifediApiMediaAttachmentMeta>
      get copyWith => __$UnifediApiMediaAttachmentMetaCopyWithImpl<
          _UnifediApiMediaAttachmentMeta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiMediaAttachmentMetaToJson(this);
  }
}

abstract class _UnifediApiMediaAttachmentMeta
    implements UnifediApiMediaAttachmentMeta {
  const factory _UnifediApiMediaAttachmentMeta(
          {@HiveField(0) required UnifediApiMediaAttachmentFocus? focus,
          @HiveField(1) required UnifediApiMediaAttachmentSize? original,
          @HiveField(2) required UnifediApiMediaAttachmentSize? small}) =
      _$_UnifediApiMediaAttachmentMeta;

  factory _UnifediApiMediaAttachmentMeta.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiMediaAttachmentMeta.fromJson;

  @override
  @HiveField(0)
  UnifediApiMediaAttachmentFocus? get focus =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  UnifediApiMediaAttachmentSize? get original =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  UnifediApiMediaAttachmentSize? get small =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiMediaAttachmentMetaCopyWith<_UnifediApiMediaAttachmentMeta>
      get copyWith => throw _privateConstructorUsedError;
}
