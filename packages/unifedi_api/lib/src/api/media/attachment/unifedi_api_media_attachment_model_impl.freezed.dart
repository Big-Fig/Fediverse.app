// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_media_attachment_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiMediaAttachment _$UnifediApiMediaAttachmentFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiMediaAttachment.fromJson(json);
}

/// @nodoc
class _$UnifediApiMediaAttachmentTearOff {
  const _$UnifediApiMediaAttachmentTearOff();

  _UnifediApiMediaAttachment call(
      {@HiveField(0)
          required String? description,
      @HiveField(1)
          required String id,
      @HiveField(2)
      @JsonKey(name: 'preview_url')
          required String? previewUrl,
      @HiveField(3)
      @JsonKey(name: 'remote_url')
          required String? remoteUrl,
      @HiveField(5)
      @JsonKey(name: 'text_url')
          required String? textUrl,
      @HiveField(6)
      @JsonKey(name: 'type')
          required String type,
      @HiveField(7)
          required String? url,
      @HiveField(8)
          required String? blurhash,
      @HiveField(9)
          required UnifediApiMediaAttachmentMeta? meta,
      @HiveField(10 + 0)
      @JsonKey(name: 'mime_type')
          required String? mimeType}) {
    return _UnifediApiMediaAttachment(
      description: description,
      id: id,
      previewUrl: previewUrl,
      remoteUrl: remoteUrl,
      textUrl: textUrl,
      type: type,
      url: url,
      blurhash: blurhash,
      meta: meta,
      mimeType: mimeType,
    );
  }

  UnifediApiMediaAttachment fromJson(Map<String, Object?> json) {
    return UnifediApiMediaAttachment.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiMediaAttachment = _$UnifediApiMediaAttachmentTearOff();

/// @nodoc
mixin _$UnifediApiMediaAttachment {
  @HiveField(0)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(1)
  String get id => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'preview_url')
  String? get previewUrl => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'remote_url')
  String? get remoteUrl => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'text_url')
  String? get textUrl => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get url => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get blurhash => throw _privateConstructorUsedError;
  @HiveField(9)
  UnifediApiMediaAttachmentMeta? get meta => throw _privateConstructorUsedError;
  @HiveField(10 + 0)
  @JsonKey(name: 'mime_type')
  String? get mimeType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiMediaAttachmentCopyWith<UnifediApiMediaAttachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiMediaAttachmentCopyWith<$Res> {
  factory $UnifediApiMediaAttachmentCopyWith(UnifediApiMediaAttachment value,
          $Res Function(UnifediApiMediaAttachment) then) =
      _$UnifediApiMediaAttachmentCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String? description,
      @HiveField(1) String id,
      @HiveField(2) @JsonKey(name: 'preview_url') String? previewUrl,
      @HiveField(3) @JsonKey(name: 'remote_url') String? remoteUrl,
      @HiveField(5) @JsonKey(name: 'text_url') String? textUrl,
      @HiveField(6) @JsonKey(name: 'type') String type,
      @HiveField(7) String? url,
      @HiveField(8) String? blurhash,
      @HiveField(9) UnifediApiMediaAttachmentMeta? meta,
      @HiveField(10 + 0) @JsonKey(name: 'mime_type') String? mimeType});

  $UnifediApiMediaAttachmentMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$UnifediApiMediaAttachmentCopyWithImpl<$Res>
    implements $UnifediApiMediaAttachmentCopyWith<$Res> {
  _$UnifediApiMediaAttachmentCopyWithImpl(this._value, this._then);

  final UnifediApiMediaAttachment _value;
  // ignore: unused_field
  final $Res Function(UnifediApiMediaAttachment) _then;

  @override
  $Res call({
    Object? description = freezed,
    Object? id = freezed,
    Object? previewUrl = freezed,
    Object? remoteUrl = freezed,
    Object? textUrl = freezed,
    Object? type = freezed,
    Object? url = freezed,
    Object? blurhash = freezed,
    Object? meta = freezed,
    Object? mimeType = freezed,
  }) {
    return _then(_value.copyWith(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      previewUrl: previewUrl == freezed
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      remoteUrl: remoteUrl == freezed
          ? _value.remoteUrl
          : remoteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      textUrl: textUrl == freezed
          ? _value.textUrl
          : textUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      blurhash: blurhash == freezed
          ? _value.blurhash
          : blurhash // ignore: cast_nullable_to_non_nullable
              as String?,
      meta: meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as UnifediApiMediaAttachmentMeta?,
      mimeType: mimeType == freezed
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $UnifediApiMediaAttachmentMetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $UnifediApiMediaAttachmentMetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiMediaAttachmentCopyWith<$Res>
    implements $UnifediApiMediaAttachmentCopyWith<$Res> {
  factory _$UnifediApiMediaAttachmentCopyWith(_UnifediApiMediaAttachment value,
          $Res Function(_UnifediApiMediaAttachment) then) =
      __$UnifediApiMediaAttachmentCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String? description,
      @HiveField(1) String id,
      @HiveField(2) @JsonKey(name: 'preview_url') String? previewUrl,
      @HiveField(3) @JsonKey(name: 'remote_url') String? remoteUrl,
      @HiveField(5) @JsonKey(name: 'text_url') String? textUrl,
      @HiveField(6) @JsonKey(name: 'type') String type,
      @HiveField(7) String? url,
      @HiveField(8) String? blurhash,
      @HiveField(9) UnifediApiMediaAttachmentMeta? meta,
      @HiveField(10 + 0) @JsonKey(name: 'mime_type') String? mimeType});

  @override
  $UnifediApiMediaAttachmentMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$UnifediApiMediaAttachmentCopyWithImpl<$Res>
    extends _$UnifediApiMediaAttachmentCopyWithImpl<$Res>
    implements _$UnifediApiMediaAttachmentCopyWith<$Res> {
  __$UnifediApiMediaAttachmentCopyWithImpl(_UnifediApiMediaAttachment _value,
      $Res Function(_UnifediApiMediaAttachment) _then)
      : super(_value, (v) => _then(v as _UnifediApiMediaAttachment));

  @override
  _UnifediApiMediaAttachment get _value =>
      super._value as _UnifediApiMediaAttachment;

  @override
  $Res call({
    Object? description = freezed,
    Object? id = freezed,
    Object? previewUrl = freezed,
    Object? remoteUrl = freezed,
    Object? textUrl = freezed,
    Object? type = freezed,
    Object? url = freezed,
    Object? blurhash = freezed,
    Object? meta = freezed,
    Object? mimeType = freezed,
  }) {
    return _then(_UnifediApiMediaAttachment(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      previewUrl: previewUrl == freezed
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      remoteUrl: remoteUrl == freezed
          ? _value.remoteUrl
          : remoteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      textUrl: textUrl == freezed
          ? _value.textUrl
          : textUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      blurhash: blurhash == freezed
          ? _value.blurhash
          : blurhash // ignore: cast_nullable_to_non_nullable
              as String?,
      meta: meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as UnifediApiMediaAttachmentMeta?,
      mimeType: mimeType == freezed
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiMediaAttachment implements _UnifediApiMediaAttachment {
  const _$_UnifediApiMediaAttachment(
      {@HiveField(0) required this.description,
      @HiveField(1) required this.id,
      @HiveField(2) @JsonKey(name: 'preview_url') required this.previewUrl,
      @HiveField(3) @JsonKey(name: 'remote_url') required this.remoteUrl,
      @HiveField(5) @JsonKey(name: 'text_url') required this.textUrl,
      @HiveField(6) @JsonKey(name: 'type') required this.type,
      @HiveField(7) required this.url,
      @HiveField(8) required this.blurhash,
      @HiveField(9) required this.meta,
      @HiveField(10 + 0) @JsonKey(name: 'mime_type') required this.mimeType});

  factory _$_UnifediApiMediaAttachment.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiMediaAttachmentFromJson(json);

  @override
  @HiveField(0)
  final String? description;
  @override
  @HiveField(1)
  final String id;
  @override
  @HiveField(2)
  @JsonKey(name: 'preview_url')
  final String? previewUrl;
  @override
  @HiveField(3)
  @JsonKey(name: 'remote_url')
  final String? remoteUrl;
  @override
  @HiveField(5)
  @JsonKey(name: 'text_url')
  final String? textUrl;
  @override
  @HiveField(6)
  @JsonKey(name: 'type')
  final String type;
  @override
  @HiveField(7)
  final String? url;
  @override
  @HiveField(8)
  final String? blurhash;
  @override
  @HiveField(9)
  final UnifediApiMediaAttachmentMeta? meta;
  @override
  @HiveField(10 + 0)
  @JsonKey(name: 'mime_type')
  final String? mimeType;

  @override
  String toString() {
    return 'UnifediApiMediaAttachment(description: $description, id: $id, previewUrl: $previewUrl, remoteUrl: $remoteUrl, textUrl: $textUrl, type: $type, url: $url, blurhash: $blurhash, meta: $meta, mimeType: $mimeType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiMediaAttachment &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.previewUrl, previewUrl) ||
                other.previewUrl == previewUrl) &&
            (identical(other.remoteUrl, remoteUrl) ||
                other.remoteUrl == remoteUrl) &&
            (identical(other.textUrl, textUrl) || other.textUrl == textUrl) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.blurhash, blurhash) ||
                other.blurhash == blurhash) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description, id, previewUrl,
      remoteUrl, textUrl, type, url, blurhash, meta, mimeType);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiMediaAttachmentCopyWith<_UnifediApiMediaAttachment>
      get copyWith =>
          __$UnifediApiMediaAttachmentCopyWithImpl<_UnifediApiMediaAttachment>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiMediaAttachmentToJson(this);
  }
}

abstract class _UnifediApiMediaAttachment implements UnifediApiMediaAttachment {
  const factory _UnifediApiMediaAttachment(
      {@HiveField(0)
          required String? description,
      @HiveField(1)
          required String id,
      @HiveField(2)
      @JsonKey(name: 'preview_url')
          required String? previewUrl,
      @HiveField(3)
      @JsonKey(name: 'remote_url')
          required String? remoteUrl,
      @HiveField(5)
      @JsonKey(name: 'text_url')
          required String? textUrl,
      @HiveField(6)
      @JsonKey(name: 'type')
          required String type,
      @HiveField(7)
          required String? url,
      @HiveField(8)
          required String? blurhash,
      @HiveField(9)
          required UnifediApiMediaAttachmentMeta? meta,
      @HiveField(10 + 0)
      @JsonKey(name: 'mime_type')
          required String? mimeType}) = _$_UnifediApiMediaAttachment;

  factory _UnifediApiMediaAttachment.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiMediaAttachment.fromJson;

  @override
  @HiveField(0)
  String? get description;
  @override
  @HiveField(1)
  String get id;
  @override
  @HiveField(2)
  @JsonKey(name: 'preview_url')
  String? get previewUrl;
  @override
  @HiveField(3)
  @JsonKey(name: 'remote_url')
  String? get remoteUrl;
  @override
  @HiveField(5)
  @JsonKey(name: 'text_url')
  String? get textUrl;
  @override
  @HiveField(6)
  @JsonKey(name: 'type')
  String get type;
  @override
  @HiveField(7)
  String? get url;
  @override
  @HiveField(8)
  String? get blurhash;
  @override
  @HiveField(9)
  UnifediApiMediaAttachmentMeta? get meta;
  @override
  @HiveField(10 + 0)
  @JsonKey(name: 'mime_type')
  String? get mimeType;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiMediaAttachmentCopyWith<_UnifediApiMediaAttachment>
      get copyWith => throw _privateConstructorUsedError;
}
