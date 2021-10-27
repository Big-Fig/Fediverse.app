// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_card_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiCard _$MastodonApiCardFromJson(Map<String, dynamic> json) {
  return _MastodonApiCard.fromJson(json);
}

/// @nodoc
class _$MastodonApiCardTearOff {
  const _$MastodonApiCardTearOff();

  _MastodonApiCard call(
      {@HiveField(0)
      @JsonKey(name: 'author_name')
          required String? authorName,
      @HiveField(1)
      @JsonKey(name: 'author_url')
          required String? authorUrl,
      @HiveField(2)
          required String? description,
      @HiveField(3)
      @JsonKey(name: 'embed_url')
          required String? embedUrl,
      @HiveField(4)
      @JsonKey(fromJson: JsonParseHelper.intFromJsonOrNullOnError)
          required int? height,
      @HiveField(5)
      @JsonKey(fromJson: JsonParseHelper.intFromJsonOrNullOnError)
          required int? width,
      @HiveField(6)
          required String? html,
      @HiveField(7)
          required String? image,
      @HiveField(8)
      @JsonKey(name: 'provider_name')
          required String? providerName,
      @HiveField(9)
      @JsonKey(name: 'provider_url')
          required String? providerUrl,
      @HiveField(10)
          required String? title,
      @HiveField(11)
          required String type,
      @HiveField(12)
          required String? url}) {
    return _MastodonApiCard(
      authorName: authorName,
      authorUrl: authorUrl,
      description: description,
      embedUrl: embedUrl,
      height: height,
      width: width,
      html: html,
      image: image,
      providerName: providerName,
      providerUrl: providerUrl,
      title: title,
      type: type,
      url: url,
    );
  }

  MastodonApiCard fromJson(Map<String, Object?> json) {
    return MastodonApiCard.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiCard = _$MastodonApiCardTearOff();

/// @nodoc
mixin _$MastodonApiCard {
  @HiveField(0)
  @JsonKey(name: 'author_name')
  String? get authorName => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'author_url')
  String? get authorUrl => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'embed_url')
  String? get embedUrl => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(fromJson: JsonParseHelper.intFromJsonOrNullOnError)
  int? get height => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(fromJson: JsonParseHelper.intFromJsonOrNullOnError)
  int? get width => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get html => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get image => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'provider_name')
  String? get providerName => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: 'provider_url')
  String? get providerUrl => throw _privateConstructorUsedError;
  @HiveField(10)
  String? get title => throw _privateConstructorUsedError;
  @HiveField(11)
  String get type => throw _privateConstructorUsedError;
  @HiveField(12)
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiCardCopyWith<MastodonApiCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiCardCopyWith<$Res> {
  factory $MastodonApiCardCopyWith(
          MastodonApiCard value, $Res Function(MastodonApiCard) then) =
      _$MastodonApiCardCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'author_name')
          String? authorName,
      @HiveField(1)
      @JsonKey(name: 'author_url')
          String? authorUrl,
      @HiveField(2)
          String? description,
      @HiveField(3)
      @JsonKey(name: 'embed_url')
          String? embedUrl,
      @HiveField(4)
      @JsonKey(fromJson: JsonParseHelper.intFromJsonOrNullOnError)
          int? height,
      @HiveField(5)
      @JsonKey(fromJson: JsonParseHelper.intFromJsonOrNullOnError)
          int? width,
      @HiveField(6)
          String? html,
      @HiveField(7)
          String? image,
      @HiveField(8)
      @JsonKey(name: 'provider_name')
          String? providerName,
      @HiveField(9)
      @JsonKey(name: 'provider_url')
          String? providerUrl,
      @HiveField(10)
          String? title,
      @HiveField(11)
          String type,
      @HiveField(12)
          String? url});
}

/// @nodoc
class _$MastodonApiCardCopyWithImpl<$Res>
    implements $MastodonApiCardCopyWith<$Res> {
  _$MastodonApiCardCopyWithImpl(this._value, this._then);

  final MastodonApiCard _value;
  // ignore: unused_field
  final $Res Function(MastodonApiCard) _then;

  @override
  $Res call({
    Object? authorName = freezed,
    Object? authorUrl = freezed,
    Object? description = freezed,
    Object? embedUrl = freezed,
    Object? height = freezed,
    Object? width = freezed,
    Object? html = freezed,
    Object? image = freezed,
    Object? providerName = freezed,
    Object? providerUrl = freezed,
    Object? title = freezed,
    Object? type = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      authorName: authorName == freezed
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorUrl: authorUrl == freezed
          ? _value.authorUrl
          : authorUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      embedUrl: embedUrl == freezed
          ? _value.embedUrl
          : embedUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      html: html == freezed
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      providerName: providerName == freezed
          ? _value.providerName
          : providerName // ignore: cast_nullable_to_non_nullable
              as String?,
      providerUrl: providerUrl == freezed
          ? _value.providerUrl
          : providerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MastodonApiCardCopyWith<$Res>
    implements $MastodonApiCardCopyWith<$Res> {
  factory _$MastodonApiCardCopyWith(
          _MastodonApiCard value, $Res Function(_MastodonApiCard) then) =
      __$MastodonApiCardCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'author_name')
          String? authorName,
      @HiveField(1)
      @JsonKey(name: 'author_url')
          String? authorUrl,
      @HiveField(2)
          String? description,
      @HiveField(3)
      @JsonKey(name: 'embed_url')
          String? embedUrl,
      @HiveField(4)
      @JsonKey(fromJson: JsonParseHelper.intFromJsonOrNullOnError)
          int? height,
      @HiveField(5)
      @JsonKey(fromJson: JsonParseHelper.intFromJsonOrNullOnError)
          int? width,
      @HiveField(6)
          String? html,
      @HiveField(7)
          String? image,
      @HiveField(8)
      @JsonKey(name: 'provider_name')
          String? providerName,
      @HiveField(9)
      @JsonKey(name: 'provider_url')
          String? providerUrl,
      @HiveField(10)
          String? title,
      @HiveField(11)
          String type,
      @HiveField(12)
          String? url});
}

/// @nodoc
class __$MastodonApiCardCopyWithImpl<$Res>
    extends _$MastodonApiCardCopyWithImpl<$Res>
    implements _$MastodonApiCardCopyWith<$Res> {
  __$MastodonApiCardCopyWithImpl(
      _MastodonApiCard _value, $Res Function(_MastodonApiCard) _then)
      : super(_value, (v) => _then(v as _MastodonApiCard));

  @override
  _MastodonApiCard get _value => super._value as _MastodonApiCard;

  @override
  $Res call({
    Object? authorName = freezed,
    Object? authorUrl = freezed,
    Object? description = freezed,
    Object? embedUrl = freezed,
    Object? height = freezed,
    Object? width = freezed,
    Object? html = freezed,
    Object? image = freezed,
    Object? providerName = freezed,
    Object? providerUrl = freezed,
    Object? title = freezed,
    Object? type = freezed,
    Object? url = freezed,
  }) {
    return _then(_MastodonApiCard(
      authorName: authorName == freezed
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorUrl: authorUrl == freezed
          ? _value.authorUrl
          : authorUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      embedUrl: embedUrl == freezed
          ? _value.embedUrl
          : embedUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      html: html == freezed
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      providerName: providerName == freezed
          ? _value.providerName
          : providerName // ignore: cast_nullable_to_non_nullable
              as String?,
      providerUrl: providerUrl == freezed
          ? _value.providerUrl
          : providerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiCard implements _MastodonApiCard {
  const _$_MastodonApiCard(
      {@HiveField(0)
      @JsonKey(name: 'author_name')
          required this.authorName,
      @HiveField(1)
      @JsonKey(name: 'author_url')
          required this.authorUrl,
      @HiveField(2)
          required this.description,
      @HiveField(3)
      @JsonKey(name: 'embed_url')
          required this.embedUrl,
      @HiveField(4)
      @JsonKey(fromJson: JsonParseHelper.intFromJsonOrNullOnError)
          required this.height,
      @HiveField(5)
      @JsonKey(fromJson: JsonParseHelper.intFromJsonOrNullOnError)
          required this.width,
      @HiveField(6)
          required this.html,
      @HiveField(7)
          required this.image,
      @HiveField(8)
      @JsonKey(name: 'provider_name')
          required this.providerName,
      @HiveField(9)
      @JsonKey(name: 'provider_url')
          required this.providerUrl,
      @HiveField(10)
          required this.title,
      @HiveField(11)
          required this.type,
      @HiveField(12)
          required this.url});

  factory _$_MastodonApiCard.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiCardFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'author_name')
  final String? authorName;
  @override
  @HiveField(1)
  @JsonKey(name: 'author_url')
  final String? authorUrl;
  @override
  @HiveField(2)
  final String? description;
  @override
  @HiveField(3)
  @JsonKey(name: 'embed_url')
  final String? embedUrl;
  @override
  @HiveField(4)
  @JsonKey(fromJson: JsonParseHelper.intFromJsonOrNullOnError)
  final int? height;
  @override
  @HiveField(5)
  @JsonKey(fromJson: JsonParseHelper.intFromJsonOrNullOnError)
  final int? width;
  @override
  @HiveField(6)
  final String? html;
  @override
  @HiveField(7)
  final String? image;
  @override
  @HiveField(8)
  @JsonKey(name: 'provider_name')
  final String? providerName;
  @override
  @HiveField(9)
  @JsonKey(name: 'provider_url')
  final String? providerUrl;
  @override
  @HiveField(10)
  final String? title;
  @override
  @HiveField(11)
  final String type;
  @override
  @HiveField(12)
  final String? url;

  @override
  String toString() {
    return 'MastodonApiCard(authorName: $authorName, authorUrl: $authorUrl, description: $description, embedUrl: $embedUrl, height: $height, width: $width, html: $html, image: $image, providerName: $providerName, providerUrl: $providerUrl, title: $title, type: $type, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiCard &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.authorUrl, authorUrl) ||
                other.authorUrl == authorUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.embedUrl, embedUrl) ||
                other.embedUrl == embedUrl) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.html, html) || other.html == html) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.providerName, providerName) ||
                other.providerName == providerName) &&
            (identical(other.providerUrl, providerUrl) ||
                other.providerUrl == providerUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      authorName,
      authorUrl,
      description,
      embedUrl,
      height,
      width,
      html,
      image,
      providerName,
      providerUrl,
      title,
      type,
      url);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiCardCopyWith<_MastodonApiCard> get copyWith =>
      __$MastodonApiCardCopyWithImpl<_MastodonApiCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiCardToJson(this);
  }
}

abstract class _MastodonApiCard implements MastodonApiCard {
  const factory _MastodonApiCard(
      {@HiveField(0)
      @JsonKey(name: 'author_name')
          required String? authorName,
      @HiveField(1)
      @JsonKey(name: 'author_url')
          required String? authorUrl,
      @HiveField(2)
          required String? description,
      @HiveField(3)
      @JsonKey(name: 'embed_url')
          required String? embedUrl,
      @HiveField(4)
      @JsonKey(fromJson: JsonParseHelper.intFromJsonOrNullOnError)
          required int? height,
      @HiveField(5)
      @JsonKey(fromJson: JsonParseHelper.intFromJsonOrNullOnError)
          required int? width,
      @HiveField(6)
          required String? html,
      @HiveField(7)
          required String? image,
      @HiveField(8)
      @JsonKey(name: 'provider_name')
          required String? providerName,
      @HiveField(9)
      @JsonKey(name: 'provider_url')
          required String? providerUrl,
      @HiveField(10)
          required String? title,
      @HiveField(11)
          required String type,
      @HiveField(12)
          required String? url}) = _$_MastodonApiCard;

  factory _MastodonApiCard.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiCard.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'author_name')
  String? get authorName;
  @override
  @HiveField(1)
  @JsonKey(name: 'author_url')
  String? get authorUrl;
  @override
  @HiveField(2)
  String? get description;
  @override
  @HiveField(3)
  @JsonKey(name: 'embed_url')
  String? get embedUrl;
  @override
  @HiveField(4)
  @JsonKey(fromJson: JsonParseHelper.intFromJsonOrNullOnError)
  int? get height;
  @override
  @HiveField(5)
  @JsonKey(fromJson: JsonParseHelper.intFromJsonOrNullOnError)
  int? get width;
  @override
  @HiveField(6)
  String? get html;
  @override
  @HiveField(7)
  String? get image;
  @override
  @HiveField(8)
  @JsonKey(name: 'provider_name')
  String? get providerName;
  @override
  @HiveField(9)
  @JsonKey(name: 'provider_url')
  String? get providerUrl;
  @override
  @HiveField(10)
  String? get title;
  @override
  @HiveField(11)
  String get type;
  @override
  @HiveField(12)
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiCardCopyWith<_MastodonApiCard> get copyWith =>
      throw _privateConstructorUsedError;
}
