// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_media_attachment_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiMediaAttachment _$PleromaApiMediaAttachmentFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiMediaAttachment.fromJson(json);
}

/// @nodoc
class _$PleromaApiMediaAttachmentTearOff {
  const _$PleromaApiMediaAttachmentTearOff();

  _PleromaApiMediaAttachment call(
      {@HiveField(0) required String? description,
      @HiveField(1) required String id,
      @HiveField(2) @JsonKey(name: 'preview_url') required String? previewUrl,
      @HiveField(3) @JsonKey(name: 'remote_url') required String? remoteUrl,
      @HiveField(5) @JsonKey(name: 'text_url') required String? textUrl,
      @HiveField(6) @JsonKey(name: 'type') required String type,
      @HiveField(7) required String? url,
      @HiveField(8) required String? blurhash,
      @HiveField(9) required PleromaApiMediaAttachmentMeta? meta,
      @HiveField(10) required PleromaApiMediaAttachmentPleromaPart? pleroma}) {
    return _PleromaApiMediaAttachment(
      description: description,
      id: id,
      previewUrl: previewUrl,
      remoteUrl: remoteUrl,
      textUrl: textUrl,
      type: type,
      url: url,
      blurhash: blurhash,
      meta: meta,
      pleroma: pleroma,
    );
  }

  PleromaApiMediaAttachment fromJson(Map<String, Object?> json) {
    return PleromaApiMediaAttachment.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiMediaAttachment = _$PleromaApiMediaAttachmentTearOff();

/// @nodoc
mixin _$PleromaApiMediaAttachment {
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
  PleromaApiMediaAttachmentMeta? get meta => throw _privateConstructorUsedError;
  @HiveField(10)
  PleromaApiMediaAttachmentPleromaPart? get pleroma =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiMediaAttachmentCopyWith<PleromaApiMediaAttachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiMediaAttachmentCopyWith<$Res> {
  factory $PleromaApiMediaAttachmentCopyWith(PleromaApiMediaAttachment value,
          $Res Function(PleromaApiMediaAttachment) then) =
      _$PleromaApiMediaAttachmentCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String? description,
      @HiveField(1) String id,
      @HiveField(2) @JsonKey(name: 'preview_url') String? previewUrl,
      @HiveField(3) @JsonKey(name: 'remote_url') String? remoteUrl,
      @HiveField(5) @JsonKey(name: 'text_url') String? textUrl,
      @HiveField(6) @JsonKey(name: 'type') String type,
      @HiveField(7) String? url,
      @HiveField(8) String? blurhash,
      @HiveField(9) PleromaApiMediaAttachmentMeta? meta,
      @HiveField(10) PleromaApiMediaAttachmentPleromaPart? pleroma});

  $PleromaApiMediaAttachmentMetaCopyWith<$Res>? get meta;
  $PleromaApiMediaAttachmentPleromaPartCopyWith<$Res>? get pleroma;
}

/// @nodoc
class _$PleromaApiMediaAttachmentCopyWithImpl<$Res>
    implements $PleromaApiMediaAttachmentCopyWith<$Res> {
  _$PleromaApiMediaAttachmentCopyWithImpl(this._value, this._then);

  final PleromaApiMediaAttachment _value;
  // ignore: unused_field
  final $Res Function(PleromaApiMediaAttachment) _then;

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
    Object? pleroma = freezed,
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
              as PleromaApiMediaAttachmentMeta?,
      pleroma: pleroma == freezed
          ? _value.pleroma
          : pleroma // ignore: cast_nullable_to_non_nullable
              as PleromaApiMediaAttachmentPleromaPart?,
    ));
  }

  @override
  $PleromaApiMediaAttachmentMetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $PleromaApiMediaAttachmentMetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value));
    });
  }

  @override
  $PleromaApiMediaAttachmentPleromaPartCopyWith<$Res>? get pleroma {
    if (_value.pleroma == null) {
      return null;
    }

    return $PleromaApiMediaAttachmentPleromaPartCopyWith<$Res>(_value.pleroma!,
        (value) {
      return _then(_value.copyWith(pleroma: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiMediaAttachmentCopyWith<$Res>
    implements $PleromaApiMediaAttachmentCopyWith<$Res> {
  factory _$PleromaApiMediaAttachmentCopyWith(_PleromaApiMediaAttachment value,
          $Res Function(_PleromaApiMediaAttachment) then) =
      __$PleromaApiMediaAttachmentCopyWithImpl<$Res>;
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
      @HiveField(9) PleromaApiMediaAttachmentMeta? meta,
      @HiveField(10) PleromaApiMediaAttachmentPleromaPart? pleroma});

  @override
  $PleromaApiMediaAttachmentMetaCopyWith<$Res>? get meta;
  @override
  $PleromaApiMediaAttachmentPleromaPartCopyWith<$Res>? get pleroma;
}

/// @nodoc
class __$PleromaApiMediaAttachmentCopyWithImpl<$Res>
    extends _$PleromaApiMediaAttachmentCopyWithImpl<$Res>
    implements _$PleromaApiMediaAttachmentCopyWith<$Res> {
  __$PleromaApiMediaAttachmentCopyWithImpl(_PleromaApiMediaAttachment _value,
      $Res Function(_PleromaApiMediaAttachment) _then)
      : super(_value, (v) => _then(v as _PleromaApiMediaAttachment));

  @override
  _PleromaApiMediaAttachment get _value =>
      super._value as _PleromaApiMediaAttachment;

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
    Object? pleroma = freezed,
  }) {
    return _then(_PleromaApiMediaAttachment(
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
              as PleromaApiMediaAttachmentMeta?,
      pleroma: pleroma == freezed
          ? _value.pleroma
          : pleroma // ignore: cast_nullable_to_non_nullable
              as PleromaApiMediaAttachmentPleromaPart?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiMediaAttachment implements _PleromaApiMediaAttachment {
  const _$_PleromaApiMediaAttachment(
      {@HiveField(0) required this.description,
      @HiveField(1) required this.id,
      @HiveField(2) @JsonKey(name: 'preview_url') required this.previewUrl,
      @HiveField(3) @JsonKey(name: 'remote_url') required this.remoteUrl,
      @HiveField(5) @JsonKey(name: 'text_url') required this.textUrl,
      @HiveField(6) @JsonKey(name: 'type') required this.type,
      @HiveField(7) required this.url,
      @HiveField(8) required this.blurhash,
      @HiveField(9) required this.meta,
      @HiveField(10) required this.pleroma});

  factory _$_PleromaApiMediaAttachment.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiMediaAttachmentFromJson(json);

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
  final PleromaApiMediaAttachmentMeta? meta;
  @override
  @HiveField(10)
  final PleromaApiMediaAttachmentPleromaPart? pleroma;

  @override
  String toString() {
    return 'PleromaApiMediaAttachment(description: $description, id: $id, previewUrl: $previewUrl, remoteUrl: $remoteUrl, textUrl: $textUrl, type: $type, url: $url, blurhash: $blurhash, meta: $meta, pleroma: $pleroma)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiMediaAttachment &&
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
            (identical(other.pleroma, pleroma) || other.pleroma == pleroma));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description, id, previewUrl,
      remoteUrl, textUrl, type, url, blurhash, meta, pleroma);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiMediaAttachmentCopyWith<_PleromaApiMediaAttachment>
      get copyWith =>
          __$PleromaApiMediaAttachmentCopyWithImpl<_PleromaApiMediaAttachment>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiMediaAttachmentToJson(this);
  }
}

abstract class _PleromaApiMediaAttachment implements PleromaApiMediaAttachment {
  const factory _PleromaApiMediaAttachment(
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
              required PleromaApiMediaAttachmentMeta? meta,
          @HiveField(10)
              required PleromaApiMediaAttachmentPleromaPart? pleroma}) =
      _$_PleromaApiMediaAttachment;

  factory _PleromaApiMediaAttachment.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiMediaAttachment.fromJson;

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
  PleromaApiMediaAttachmentMeta? get meta;
  @override
  @HiveField(10)
  PleromaApiMediaAttachmentPleromaPart? get pleroma;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiMediaAttachmentCopyWith<_PleromaApiMediaAttachment>
      get copyWith => throw _privateConstructorUsedError;
}

PleromaApiMediaAttachmentPleromaPart
    _$PleromaApiMediaAttachmentPleromaPartFromJson(Map<String, dynamic> json) {
  return _PleromaApiMediaAttachmentPleromaPart.fromJson(json);
}

/// @nodoc
class _$PleromaApiMediaAttachmentPleromaPartTearOff {
  const _$PleromaApiMediaAttachmentPleromaPartTearOff();

  _PleromaApiMediaAttachmentPleromaPart call(
      {@HiveField(0) @JsonKey(name: 'mime_type') required String? mimeType}) {
    return _PleromaApiMediaAttachmentPleromaPart(
      mimeType: mimeType,
    );
  }

  PleromaApiMediaAttachmentPleromaPart fromJson(Map<String, Object?> json) {
    return PleromaApiMediaAttachmentPleromaPart.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiMediaAttachmentPleromaPart =
    _$PleromaApiMediaAttachmentPleromaPartTearOff();

/// @nodoc
mixin _$PleromaApiMediaAttachmentPleromaPart {
  @HiveField(0)
  @JsonKey(name: 'mime_type')
  String? get mimeType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiMediaAttachmentPleromaPartCopyWith<
          PleromaApiMediaAttachmentPleromaPart>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiMediaAttachmentPleromaPartCopyWith<$Res> {
  factory $PleromaApiMediaAttachmentPleromaPartCopyWith(
          PleromaApiMediaAttachmentPleromaPart value,
          $Res Function(PleromaApiMediaAttachmentPleromaPart) then) =
      _$PleromaApiMediaAttachmentPleromaPartCopyWithImpl<$Res>;
  $Res call({@HiveField(0) @JsonKey(name: 'mime_type') String? mimeType});
}

/// @nodoc
class _$PleromaApiMediaAttachmentPleromaPartCopyWithImpl<$Res>
    implements $PleromaApiMediaAttachmentPleromaPartCopyWith<$Res> {
  _$PleromaApiMediaAttachmentPleromaPartCopyWithImpl(this._value, this._then);

  final PleromaApiMediaAttachmentPleromaPart _value;
  // ignore: unused_field
  final $Res Function(PleromaApiMediaAttachmentPleromaPart) _then;

  @override
  $Res call({
    Object? mimeType = freezed,
  }) {
    return _then(_value.copyWith(
      mimeType: mimeType == freezed
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiMediaAttachmentPleromaPartCopyWith<$Res>
    implements $PleromaApiMediaAttachmentPleromaPartCopyWith<$Res> {
  factory _$PleromaApiMediaAttachmentPleromaPartCopyWith(
          _PleromaApiMediaAttachmentPleromaPart value,
          $Res Function(_PleromaApiMediaAttachmentPleromaPart) then) =
      __$PleromaApiMediaAttachmentPleromaPartCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) @JsonKey(name: 'mime_type') String? mimeType});
}

/// @nodoc
class __$PleromaApiMediaAttachmentPleromaPartCopyWithImpl<$Res>
    extends _$PleromaApiMediaAttachmentPleromaPartCopyWithImpl<$Res>
    implements _$PleromaApiMediaAttachmentPleromaPartCopyWith<$Res> {
  __$PleromaApiMediaAttachmentPleromaPartCopyWithImpl(
      _PleromaApiMediaAttachmentPleromaPart _value,
      $Res Function(_PleromaApiMediaAttachmentPleromaPart) _then)
      : super(_value, (v) => _then(v as _PleromaApiMediaAttachmentPleromaPart));

  @override
  _PleromaApiMediaAttachmentPleromaPart get _value =>
      super._value as _PleromaApiMediaAttachmentPleromaPart;

  @override
  $Res call({
    Object? mimeType = freezed,
  }) {
    return _then(_PleromaApiMediaAttachmentPleromaPart(
      mimeType: mimeType == freezed
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiMediaAttachmentPleromaPart
    implements _PleromaApiMediaAttachmentPleromaPart {
  const _$_PleromaApiMediaAttachmentPleromaPart(
      {@HiveField(0) @JsonKey(name: 'mime_type') required this.mimeType});

  factory _$_PleromaApiMediaAttachmentPleromaPart.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiMediaAttachmentPleromaPartFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'mime_type')
  final String? mimeType;

  @override
  String toString() {
    return 'PleromaApiMediaAttachmentPleromaPart(mimeType: $mimeType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiMediaAttachmentPleromaPart &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mimeType);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiMediaAttachmentPleromaPartCopyWith<
          _PleromaApiMediaAttachmentPleromaPart>
      get copyWith => __$PleromaApiMediaAttachmentPleromaPartCopyWithImpl<
          _PleromaApiMediaAttachmentPleromaPart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiMediaAttachmentPleromaPartToJson(this);
  }
}

abstract class _PleromaApiMediaAttachmentPleromaPart
    implements PleromaApiMediaAttachmentPleromaPart {
  const factory _PleromaApiMediaAttachmentPleromaPart(
      {@HiveField(0)
      @JsonKey(name: 'mime_type')
          required String? mimeType}) = _$_PleromaApiMediaAttachmentPleromaPart;

  factory _PleromaApiMediaAttachmentPleromaPart.fromJson(
          Map<String, dynamic> json) =
      _$_PleromaApiMediaAttachmentPleromaPart.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'mime_type')
  String? get mimeType;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiMediaAttachmentPleromaPartCopyWith<
          _PleromaApiMediaAttachmentPleromaPart>
      get copyWith => throw _privateConstructorUsedError;
}
