// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'upload_media_attachment_metadata_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UploadMediaAttachmentMetadataTearOff {
  const _$UploadMediaAttachmentMetadataTearOff();

  _UploadMediaAttachmentMetadata call({required String? description}) {
    return _UploadMediaAttachmentMetadata(
      description: description,
    );
  }
}

/// @nodoc
const $UploadMediaAttachmentMetadata = _$UploadMediaAttachmentMetadataTearOff();

/// @nodoc
mixin _$UploadMediaAttachmentMetadata {
  String? get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UploadMediaAttachmentMetadataCopyWith<UploadMediaAttachmentMetadata>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadMediaAttachmentMetadataCopyWith<$Res> {
  factory $UploadMediaAttachmentMetadataCopyWith(
          UploadMediaAttachmentMetadata value,
          $Res Function(UploadMediaAttachmentMetadata) then) =
      _$UploadMediaAttachmentMetadataCopyWithImpl<$Res>;
  $Res call({String? description});
}

/// @nodoc
class _$UploadMediaAttachmentMetadataCopyWithImpl<$Res>
    implements $UploadMediaAttachmentMetadataCopyWith<$Res> {
  _$UploadMediaAttachmentMetadataCopyWithImpl(this._value, this._then);

  final UploadMediaAttachmentMetadata _value;
  // ignore: unused_field
  final $Res Function(UploadMediaAttachmentMetadata) _then;

  @override
  $Res call({
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UploadMediaAttachmentMetadataCopyWith<$Res>
    implements $UploadMediaAttachmentMetadataCopyWith<$Res> {
  factory _$UploadMediaAttachmentMetadataCopyWith(
          _UploadMediaAttachmentMetadata value,
          $Res Function(_UploadMediaAttachmentMetadata) then) =
      __$UploadMediaAttachmentMetadataCopyWithImpl<$Res>;
  @override
  $Res call({String? description});
}

/// @nodoc
class __$UploadMediaAttachmentMetadataCopyWithImpl<$Res>
    extends _$UploadMediaAttachmentMetadataCopyWithImpl<$Res>
    implements _$UploadMediaAttachmentMetadataCopyWith<$Res> {
  __$UploadMediaAttachmentMetadataCopyWithImpl(
      _UploadMediaAttachmentMetadata _value,
      $Res Function(_UploadMediaAttachmentMetadata) _then)
      : super(_value, (v) => _then(v as _UploadMediaAttachmentMetadata));

  @override
  _UploadMediaAttachmentMetadata get _value =>
      super._value as _UploadMediaAttachmentMetadata;

  @override
  $Res call({
    Object? description = freezed,
  }) {
    return _then(_UploadMediaAttachmentMetadata(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_UploadMediaAttachmentMetadata extends _UploadMediaAttachmentMetadata {
  const _$_UploadMediaAttachmentMetadata({required this.description})
      : super._();

  @override
  final String? description;

  @override
  String toString() {
    return 'UploadMediaAttachmentMetadata(description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UploadMediaAttachmentMetadata &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(description);

  @JsonKey(ignore: true)
  @override
  _$UploadMediaAttachmentMetadataCopyWith<_UploadMediaAttachmentMetadata>
      get copyWith => __$UploadMediaAttachmentMetadataCopyWithImpl<
          _UploadMediaAttachmentMetadata>(this, _$identity);
}

abstract class _UploadMediaAttachmentMetadata
    extends UploadMediaAttachmentMetadata {
  const factory _UploadMediaAttachmentMetadata({required String? description}) =
      _$_UploadMediaAttachmentMetadata;
  const _UploadMediaAttachmentMetadata._() : super._();

  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UploadMediaAttachmentMetadataCopyWith<_UploadMediaAttachmentMetadata>
      get copyWith => throw _privateConstructorUsedError;
}
