// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_media_attachment_meta_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiMediaAttachmentMeta _$MastodonApiMediaAttachmentMetaFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiMediaAttachmentMeta.fromJson(json);
}

/// @nodoc
class _$MastodonApiMediaAttachmentMetaTearOff {
  const _$MastodonApiMediaAttachmentMetaTearOff();

  _MastodonApiMediaAttachmentMeta call(
      {@HiveField(0) required MastodonApiMediaAttachmentFocus? focus,
      @HiveField(1) required MastodonApiMediaAttachmentSize? original,
      @HiveField(2) required MastodonApiMediaAttachmentSize? small}) {
    return _MastodonApiMediaAttachmentMeta(
      focus: focus,
      original: original,
      small: small,
    );
  }

  MastodonApiMediaAttachmentMeta fromJson(Map<String, Object?> json) {
    return MastodonApiMediaAttachmentMeta.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiMediaAttachmentMeta =
    _$MastodonApiMediaAttachmentMetaTearOff();

/// @nodoc
mixin _$MastodonApiMediaAttachmentMeta {
  @HiveField(0)
  MastodonApiMediaAttachmentFocus? get focus =>
      throw _privateConstructorUsedError;
  @HiveField(1)
  MastodonApiMediaAttachmentSize? get original =>
      throw _privateConstructorUsedError;
  @HiveField(2)
  MastodonApiMediaAttachmentSize? get small =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiMediaAttachmentMetaCopyWith<MastodonApiMediaAttachmentMeta>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiMediaAttachmentMetaCopyWith<$Res> {
  factory $MastodonApiMediaAttachmentMetaCopyWith(
          MastodonApiMediaAttachmentMeta value,
          $Res Function(MastodonApiMediaAttachmentMeta) then) =
      _$MastodonApiMediaAttachmentMetaCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) MastodonApiMediaAttachmentFocus? focus,
      @HiveField(1) MastodonApiMediaAttachmentSize? original,
      @HiveField(2) MastodonApiMediaAttachmentSize? small});

  $MastodonApiMediaAttachmentFocusCopyWith<$Res>? get focus;
  $MastodonApiMediaAttachmentSizeCopyWith<$Res>? get original;
  $MastodonApiMediaAttachmentSizeCopyWith<$Res>? get small;
}

/// @nodoc
class _$MastodonApiMediaAttachmentMetaCopyWithImpl<$Res>
    implements $MastodonApiMediaAttachmentMetaCopyWith<$Res> {
  _$MastodonApiMediaAttachmentMetaCopyWithImpl(this._value, this._then);

  final MastodonApiMediaAttachmentMeta _value;
  // ignore: unused_field
  final $Res Function(MastodonApiMediaAttachmentMeta) _then;

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
              as MastodonApiMediaAttachmentFocus?,
      original: original == freezed
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as MastodonApiMediaAttachmentSize?,
      small: small == freezed
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as MastodonApiMediaAttachmentSize?,
    ));
  }

  @override
  $MastodonApiMediaAttachmentFocusCopyWith<$Res>? get focus {
    if (_value.focus == null) {
      return null;
    }

    return $MastodonApiMediaAttachmentFocusCopyWith<$Res>(_value.focus!,
        (value) {
      return _then(_value.copyWith(focus: value));
    });
  }

  @override
  $MastodonApiMediaAttachmentSizeCopyWith<$Res>? get original {
    if (_value.original == null) {
      return null;
    }

    return $MastodonApiMediaAttachmentSizeCopyWith<$Res>(_value.original!,
        (value) {
      return _then(_value.copyWith(original: value));
    });
  }

  @override
  $MastodonApiMediaAttachmentSizeCopyWith<$Res>? get small {
    if (_value.small == null) {
      return null;
    }

    return $MastodonApiMediaAttachmentSizeCopyWith<$Res>(_value.small!,
        (value) {
      return _then(_value.copyWith(small: value));
    });
  }
}

/// @nodoc
abstract class _$MastodonApiMediaAttachmentMetaCopyWith<$Res>
    implements $MastodonApiMediaAttachmentMetaCopyWith<$Res> {
  factory _$MastodonApiMediaAttachmentMetaCopyWith(
          _MastodonApiMediaAttachmentMeta value,
          $Res Function(_MastodonApiMediaAttachmentMeta) then) =
      __$MastodonApiMediaAttachmentMetaCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) MastodonApiMediaAttachmentFocus? focus,
      @HiveField(1) MastodonApiMediaAttachmentSize? original,
      @HiveField(2) MastodonApiMediaAttachmentSize? small});

  @override
  $MastodonApiMediaAttachmentFocusCopyWith<$Res>? get focus;
  @override
  $MastodonApiMediaAttachmentSizeCopyWith<$Res>? get original;
  @override
  $MastodonApiMediaAttachmentSizeCopyWith<$Res>? get small;
}

/// @nodoc
class __$MastodonApiMediaAttachmentMetaCopyWithImpl<$Res>
    extends _$MastodonApiMediaAttachmentMetaCopyWithImpl<$Res>
    implements _$MastodonApiMediaAttachmentMetaCopyWith<$Res> {
  __$MastodonApiMediaAttachmentMetaCopyWithImpl(
      _MastodonApiMediaAttachmentMeta _value,
      $Res Function(_MastodonApiMediaAttachmentMeta) _then)
      : super(_value, (v) => _then(v as _MastodonApiMediaAttachmentMeta));

  @override
  _MastodonApiMediaAttachmentMeta get _value =>
      super._value as _MastodonApiMediaAttachmentMeta;

  @override
  $Res call({
    Object? focus = freezed,
    Object? original = freezed,
    Object? small = freezed,
  }) {
    return _then(_MastodonApiMediaAttachmentMeta(
      focus: focus == freezed
          ? _value.focus
          : focus // ignore: cast_nullable_to_non_nullable
              as MastodonApiMediaAttachmentFocus?,
      original: original == freezed
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as MastodonApiMediaAttachmentSize?,
      small: small == freezed
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as MastodonApiMediaAttachmentSize?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiMediaAttachmentMeta
    implements _MastodonApiMediaAttachmentMeta {
  const _$_MastodonApiMediaAttachmentMeta(
      {@HiveField(0) required this.focus,
      @HiveField(1) required this.original,
      @HiveField(2) required this.small});

  factory _$_MastodonApiMediaAttachmentMeta.fromJson(
          Map<String, dynamic> json) =>
      _$$_MastodonApiMediaAttachmentMetaFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiMediaAttachmentFocus? focus;
  @override
  @HiveField(1)
  final MastodonApiMediaAttachmentSize? original;
  @override
  @HiveField(2)
  final MastodonApiMediaAttachmentSize? small;

  @override
  String toString() {
    return 'MastodonApiMediaAttachmentMeta(focus: $focus, original: $original, small: $small)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiMediaAttachmentMeta &&
            (identical(other.focus, focus) || other.focus == focus) &&
            (identical(other.original, original) ||
                other.original == original) &&
            (identical(other.small, small) || other.small == small));
  }

  @override
  int get hashCode => Object.hash(runtimeType, focus, original, small);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiMediaAttachmentMetaCopyWith<_MastodonApiMediaAttachmentMeta>
      get copyWith => __$MastodonApiMediaAttachmentMetaCopyWithImpl<
          _MastodonApiMediaAttachmentMeta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiMediaAttachmentMetaToJson(this);
  }
}

abstract class _MastodonApiMediaAttachmentMeta
    implements MastodonApiMediaAttachmentMeta {
  const factory _MastodonApiMediaAttachmentMeta(
          {@HiveField(0) required MastodonApiMediaAttachmentFocus? focus,
          @HiveField(1) required MastodonApiMediaAttachmentSize? original,
          @HiveField(2) required MastodonApiMediaAttachmentSize? small}) =
      _$_MastodonApiMediaAttachmentMeta;

  factory _MastodonApiMediaAttachmentMeta.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiMediaAttachmentMeta.fromJson;

  @override
  @HiveField(0)
  MastodonApiMediaAttachmentFocus? get focus;
  @override
  @HiveField(1)
  MastodonApiMediaAttachmentSize? get original;
  @override
  @HiveField(2)
  MastodonApiMediaAttachmentSize? get small;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiMediaAttachmentMetaCopyWith<_MastodonApiMediaAttachmentMeta>
      get copyWith => throw _privateConstructorUsedError;
}
