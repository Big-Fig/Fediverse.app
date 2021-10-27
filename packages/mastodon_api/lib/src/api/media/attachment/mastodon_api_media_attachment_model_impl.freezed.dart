// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_media_attachment_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiMediaAttachment _$MastodonApiMediaAttachmentFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiMediaAttachment.fromJson(json);
}

/// @nodoc
class _$MastodonApiMediaAttachmentTearOff {
  const _$MastodonApiMediaAttachmentTearOff();

  _MastodonApiMediaAttachment call(
      {@HiveField(0) required String? description,
      @HiveField(1) required String id,
      @HiveField(2) @JsonKey(name: 'preview_url') required String? previewUrl,
      @HiveField(3) @JsonKey(name: 'remote_url') required String? remoteUrl,
      @HiveField(5) @JsonKey(name: 'text_url') required String? textUrl,
      @HiveField(6) @JsonKey(name: 'type') required String type,
      @HiveField(7) required String? url,
      @HiveField(8) required String? blurhash,
      @HiveField(9) required MastodonApiMediaAttachmentMeta? meta}) {
    return _MastodonApiMediaAttachment(
      description: description,
      id: id,
      previewUrl: previewUrl,
      remoteUrl: remoteUrl,
      textUrl: textUrl,
      type: type,
      url: url,
      blurhash: blurhash,
      meta: meta,
    );
  }

  MastodonApiMediaAttachment fromJson(Map<String, Object?> json) {
    return MastodonApiMediaAttachment.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiMediaAttachment = _$MastodonApiMediaAttachmentTearOff();

/// @nodoc
mixin _$MastodonApiMediaAttachment {
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
  MastodonApiMediaAttachmentMeta? get meta =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiMediaAttachmentCopyWith<MastodonApiMediaAttachment>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiMediaAttachmentCopyWith<$Res> {
  factory $MastodonApiMediaAttachmentCopyWith(MastodonApiMediaAttachment value,
          $Res Function(MastodonApiMediaAttachment) then) =
      _$MastodonApiMediaAttachmentCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String? description,
      @HiveField(1) String id,
      @HiveField(2) @JsonKey(name: 'preview_url') String? previewUrl,
      @HiveField(3) @JsonKey(name: 'remote_url') String? remoteUrl,
      @HiveField(5) @JsonKey(name: 'text_url') String? textUrl,
      @HiveField(6) @JsonKey(name: 'type') String type,
      @HiveField(7) String? url,
      @HiveField(8) String? blurhash,
      @HiveField(9) MastodonApiMediaAttachmentMeta? meta});

  $MastodonApiMediaAttachmentMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$MastodonApiMediaAttachmentCopyWithImpl<$Res>
    implements $MastodonApiMediaAttachmentCopyWith<$Res> {
  _$MastodonApiMediaAttachmentCopyWithImpl(this._value, this._then);

  final MastodonApiMediaAttachment _value;
  // ignore: unused_field
  final $Res Function(MastodonApiMediaAttachment) _then;

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
              as MastodonApiMediaAttachmentMeta?,
    ));
  }

  @override
  $MastodonApiMediaAttachmentMetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $MastodonApiMediaAttachmentMetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value));
    });
  }
}

/// @nodoc
abstract class _$MastodonApiMediaAttachmentCopyWith<$Res>
    implements $MastodonApiMediaAttachmentCopyWith<$Res> {
  factory _$MastodonApiMediaAttachmentCopyWith(
          _MastodonApiMediaAttachment value,
          $Res Function(_MastodonApiMediaAttachment) then) =
      __$MastodonApiMediaAttachmentCopyWithImpl<$Res>;
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
      @HiveField(9) MastodonApiMediaAttachmentMeta? meta});

  @override
  $MastodonApiMediaAttachmentMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$MastodonApiMediaAttachmentCopyWithImpl<$Res>
    extends _$MastodonApiMediaAttachmentCopyWithImpl<$Res>
    implements _$MastodonApiMediaAttachmentCopyWith<$Res> {
  __$MastodonApiMediaAttachmentCopyWithImpl(_MastodonApiMediaAttachment _value,
      $Res Function(_MastodonApiMediaAttachment) _then)
      : super(_value, (v) => _then(v as _MastodonApiMediaAttachment));

  @override
  _MastodonApiMediaAttachment get _value =>
      super._value as _MastodonApiMediaAttachment;

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
  }) {
    return _then(_MastodonApiMediaAttachment(
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
              as MastodonApiMediaAttachmentMeta?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiMediaAttachment implements _MastodonApiMediaAttachment {
  const _$_MastodonApiMediaAttachment(
      {@HiveField(0) required this.description,
      @HiveField(1) required this.id,
      @HiveField(2) @JsonKey(name: 'preview_url') required this.previewUrl,
      @HiveField(3) @JsonKey(name: 'remote_url') required this.remoteUrl,
      @HiveField(5) @JsonKey(name: 'text_url') required this.textUrl,
      @HiveField(6) @JsonKey(name: 'type') required this.type,
      @HiveField(7) required this.url,
      @HiveField(8) required this.blurhash,
      @HiveField(9) required this.meta});

  factory _$_MastodonApiMediaAttachment.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiMediaAttachmentFromJson(json);

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
  final MastodonApiMediaAttachmentMeta? meta;

  @override
  String toString() {
    return 'MastodonApiMediaAttachment(description: $description, id: $id, previewUrl: $previewUrl, remoteUrl: $remoteUrl, textUrl: $textUrl, type: $type, url: $url, blurhash: $blurhash, meta: $meta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiMediaAttachment &&
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
            (identical(other.meta, meta) || other.meta == meta));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description, id, previewUrl,
      remoteUrl, textUrl, type, url, blurhash, meta);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiMediaAttachmentCopyWith<_MastodonApiMediaAttachment>
      get copyWith => __$MastodonApiMediaAttachmentCopyWithImpl<
          _MastodonApiMediaAttachment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiMediaAttachmentToJson(this);
  }
}

abstract class _MastodonApiMediaAttachment
    implements MastodonApiMediaAttachment {
  const factory _MastodonApiMediaAttachment(
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
              required MastodonApiMediaAttachmentMeta? meta}) =
      _$_MastodonApiMediaAttachment;

  factory _MastodonApiMediaAttachment.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiMediaAttachment.fromJson;

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
  MastodonApiMediaAttachmentMeta? get meta;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiMediaAttachmentCopyWith<_MastodonApiMediaAttachment>
      get copyWith => throw _privateConstructorUsedError;
}
