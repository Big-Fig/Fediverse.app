// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_instance_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiInstancePleromaPart _$PleromaApiInstancePleromaPartFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiInstancePleromaPart.fromJson(json);
}

/// @nodoc
class _$PleromaApiInstancePleromaPartTearOff {
  const _$PleromaApiInstancePleromaPartTearOff();

  _PleromaApiInstancePleromaPart call(
      {@HiveField(0) required PleromaApiInstanceMetadata? metadata}) {
    return _PleromaApiInstancePleromaPart(
      metadata: metadata,
    );
  }

  PleromaApiInstancePleromaPart fromJson(Map<String, Object> json) {
    return PleromaApiInstancePleromaPart.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiInstancePleromaPart = _$PleromaApiInstancePleromaPartTearOff();

/// @nodoc
mixin _$PleromaApiInstancePleromaPart {
  @HiveField(0)
  PleromaApiInstanceMetadata? get metadata =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiInstancePleromaPartCopyWith<PleromaApiInstancePleromaPart>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiInstancePleromaPartCopyWith<$Res> {
  factory $PleromaApiInstancePleromaPartCopyWith(
          PleromaApiInstancePleromaPart value,
          $Res Function(PleromaApiInstancePleromaPart) then) =
      _$PleromaApiInstancePleromaPartCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiInstanceMetadata? metadata});

  $PleromaApiInstanceMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class _$PleromaApiInstancePleromaPartCopyWithImpl<$Res>
    implements $PleromaApiInstancePleromaPartCopyWith<$Res> {
  _$PleromaApiInstancePleromaPartCopyWithImpl(this._value, this._then);

  final PleromaApiInstancePleromaPart _value;
  // ignore: unused_field
  final $Res Function(PleromaApiInstancePleromaPart) _then;

  @override
  $Res call({
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      metadata: metadata == freezed
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstanceMetadata?,
    ));
  }

  @override
  $PleromaApiInstanceMetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $PleromaApiInstanceMetadataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiInstancePleromaPartCopyWith<$Res>
    implements $PleromaApiInstancePleromaPartCopyWith<$Res> {
  factory _$PleromaApiInstancePleromaPartCopyWith(
          _PleromaApiInstancePleromaPart value,
          $Res Function(_PleromaApiInstancePleromaPart) then) =
      __$PleromaApiInstancePleromaPartCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiInstanceMetadata? metadata});

  @override
  $PleromaApiInstanceMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$PleromaApiInstancePleromaPartCopyWithImpl<$Res>
    extends _$PleromaApiInstancePleromaPartCopyWithImpl<$Res>
    implements _$PleromaApiInstancePleromaPartCopyWith<$Res> {
  __$PleromaApiInstancePleromaPartCopyWithImpl(
      _PleromaApiInstancePleromaPart _value,
      $Res Function(_PleromaApiInstancePleromaPart) _then)
      : super(_value, (v) => _then(v as _PleromaApiInstancePleromaPart));

  @override
  _PleromaApiInstancePleromaPart get _value =>
      super._value as _PleromaApiInstancePleromaPart;

  @override
  $Res call({
    Object? metadata = freezed,
  }) {
    return _then(_PleromaApiInstancePleromaPart(
      metadata: metadata == freezed
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstanceMetadata?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiInstancePleromaPart
    implements _PleromaApiInstancePleromaPart {
  const _$_PleromaApiInstancePleromaPart(
      {@HiveField(0) required this.metadata});

  factory _$_PleromaApiInstancePleromaPart.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiInstancePleromaPartFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiInstanceMetadata? metadata;

  @override
  String toString() {
    return 'PleromaApiInstancePleromaPart(metadata: $metadata)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiInstancePleromaPart &&
            (identical(other.metadata, metadata) ||
                const DeepCollectionEquality()
                    .equals(other.metadata, metadata)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(metadata);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiInstancePleromaPartCopyWith<_PleromaApiInstancePleromaPart>
      get copyWith => __$PleromaApiInstancePleromaPartCopyWithImpl<
          _PleromaApiInstancePleromaPart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiInstancePleromaPartToJson(this);
  }
}

abstract class _PleromaApiInstancePleromaPart
    implements PleromaApiInstancePleromaPart {
  const factory _PleromaApiInstancePleromaPart(
          {@HiveField(0) required PleromaApiInstanceMetadata? metadata}) =
      _$_PleromaApiInstancePleromaPart;

  factory _PleromaApiInstancePleromaPart.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiInstancePleromaPart.fromJson;

  @override
  @HiveField(0)
  PleromaApiInstanceMetadata? get metadata =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiInstancePleromaPartCopyWith<_PleromaApiInstancePleromaPart>
      get copyWith => throw _privateConstructorUsedError;
}

PleromaApiInstance _$PleromaApiInstanceFromJson(Map<String, dynamic> json) {
  return _PleromaApiInstance.fromJson(json);
}

/// @nodoc
class _$PleromaApiInstanceTearOff {
  const _$PleromaApiInstanceTearOff();

  _PleromaApiInstance call(
      {@HiveField(0)
      @JsonKey(name: 'approval_required')
          required bool? approvalRequired,
      @HiveField(1)
      @JsonKey(name: 'avatar_upload_limit')
          required int? avatarUploadLimit,
      @HiveField(2)
      @JsonKey(name: 'background_upload_limit')
          required int? backgroundUploadLimit,
      @HiveField(3)
      @JsonKey(name: 'banner_upload_limit')
          required int? bannerUploadLimit,
      @HiveField(4)
      @JsonKey(name: 'contact_account')
          required PleromaApiAccount? contactAccount,
      @HiveField(5)
          required String? email,
      @HiveField(6)
          required List<String>? languages,
      @HiveField(7)
      @JsonKey(name: 'max_toot_chars', fromJson: JsonParseHelper.intFromJsonOrNullOnError)
          required int? maxTootChars,
      @HiveField(8)
          required PleromaApiInstancePleromaPart? pleroma,
      @HiveField(9)
      @JsonKey(name: 'poll_limits')
          required PleromaApiInstancePollLimits? pollLimits,
      @HiveField(10)
          required bool? registrations,
      @HiveField(11)
      @JsonKey(name: 'short_description')
          required String? shortDescription,
      @HiveField(12)
          required PleromaApiInstanceStats? stats,
      @HiveField(13)
          required String? thumbnail,
      @HiveField(14)
          required String? title,
      @HiveField(15)
      @JsonKey(name: 'upload_limit')
          required int? uploadLimit,
      @HiveField(16)
          required String uri,
      @HiveField(17)
          required PleromaApiInstanceUrls? urls,
      @HiveField(18)
      @JsonKey(name: 'vapid_public_key')
          required String? vapidPublicKey,
      @HiveField(19)
      @JsonKey(name: 'version')
          required String versionString,
      @HiveField(20)
      @JsonKey(name: 'background_image')
          required String? backgroundImage,
      @HiveField(21)
      @JsonKey(name: 'chat_limit')
          required int? chatLimit,
      @HiveField(22)
          required String? description,
      @HiveField(23)
      @JsonKey(name: 'description_limit')
          required int? descriptionLimit,
      @HiveField(24)
      @JsonKey(name: 'invites_enabled')
          required bool? invitesEnabled}) {
    return _PleromaApiInstance(
      approvalRequired: approvalRequired,
      avatarUploadLimit: avatarUploadLimit,
      backgroundUploadLimit: backgroundUploadLimit,
      bannerUploadLimit: bannerUploadLimit,
      contactAccount: contactAccount,
      email: email,
      languages: languages,
      maxTootChars: maxTootChars,
      pleroma: pleroma,
      pollLimits: pollLimits,
      registrations: registrations,
      shortDescription: shortDescription,
      stats: stats,
      thumbnail: thumbnail,
      title: title,
      uploadLimit: uploadLimit,
      uri: uri,
      urls: urls,
      vapidPublicKey: vapidPublicKey,
      versionString: versionString,
      backgroundImage: backgroundImage,
      chatLimit: chatLimit,
      description: description,
      descriptionLimit: descriptionLimit,
      invitesEnabled: invitesEnabled,
    );
  }

  PleromaApiInstance fromJson(Map<String, Object> json) {
    return PleromaApiInstance.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiInstance = _$PleromaApiInstanceTearOff();

/// @nodoc
mixin _$PleromaApiInstance {
  @HiveField(0)
  @JsonKey(name: 'approval_required')
  bool? get approvalRequired => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'avatar_upload_limit')
  int? get avatarUploadLimit => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'background_upload_limit')
  int? get backgroundUploadLimit => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'banner_upload_limit')
  int? get bannerUploadLimit => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'contact_account')
  PleromaApiAccount? get contactAccount => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get email => throw _privateConstructorUsedError;
  @HiveField(6)
  List<String>? get languages => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(
      name: 'max_toot_chars',
      fromJson: JsonParseHelper.intFromJsonOrNullOnError)
  int? get maxTootChars => throw _privateConstructorUsedError;
  @HiveField(8)
  PleromaApiInstancePleromaPart? get pleroma =>
      throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: 'poll_limits')
  PleromaApiInstancePollLimits? get pollLimits =>
      throw _privateConstructorUsedError;
  @HiveField(10)
  bool? get registrations => throw _privateConstructorUsedError;
  @HiveField(11)
  @JsonKey(name: 'short_description')
  String? get shortDescription => throw _privateConstructorUsedError;
  @HiveField(12)
  PleromaApiInstanceStats? get stats => throw _privateConstructorUsedError;
  @HiveField(13)
  String? get thumbnail => throw _privateConstructorUsedError;
  @HiveField(14)
  String? get title => throw _privateConstructorUsedError;
  @HiveField(15)
  @JsonKey(name: 'upload_limit')
  int? get uploadLimit => throw _privateConstructorUsedError;
  @HiveField(16)
  String get uri => throw _privateConstructorUsedError;
  @HiveField(17)
  PleromaApiInstanceUrls? get urls => throw _privateConstructorUsedError;
  @HiveField(18)
  @JsonKey(name: 'vapid_public_key')
  String? get vapidPublicKey => throw _privateConstructorUsedError;
  @HiveField(19)
  @JsonKey(name: 'version')
  String get versionString => throw _privateConstructorUsedError;
  @HiveField(20)
  @JsonKey(name: 'background_image')
  String? get backgroundImage => throw _privateConstructorUsedError;
  @HiveField(21)
  @JsonKey(name: 'chat_limit')
  int? get chatLimit => throw _privateConstructorUsedError;
  @HiveField(22)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(23)
  @JsonKey(name: 'description_limit')
  int? get descriptionLimit => throw _privateConstructorUsedError;
  @HiveField(24)
  @JsonKey(name: 'invites_enabled')
  bool? get invitesEnabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiInstanceCopyWith<PleromaApiInstance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiInstanceCopyWith<$Res> {
  factory $PleromaApiInstanceCopyWith(
          PleromaApiInstance value, $Res Function(PleromaApiInstance) then) =
      _$PleromaApiInstanceCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'approval_required')
          bool? approvalRequired,
      @HiveField(1)
      @JsonKey(name: 'avatar_upload_limit')
          int? avatarUploadLimit,
      @HiveField(2)
      @JsonKey(name: 'background_upload_limit')
          int? backgroundUploadLimit,
      @HiveField(3)
      @JsonKey(name: 'banner_upload_limit')
          int? bannerUploadLimit,
      @HiveField(4)
      @JsonKey(name: 'contact_account')
          PleromaApiAccount? contactAccount,
      @HiveField(5)
          String? email,
      @HiveField(6)
          List<String>? languages,
      @HiveField(7)
      @JsonKey(name: 'max_toot_chars', fromJson: JsonParseHelper.intFromJsonOrNullOnError)
          int? maxTootChars,
      @HiveField(8)
          PleromaApiInstancePleromaPart? pleroma,
      @HiveField(9)
      @JsonKey(name: 'poll_limits')
          PleromaApiInstancePollLimits? pollLimits,
      @HiveField(10)
          bool? registrations,
      @HiveField(11)
      @JsonKey(name: 'short_description')
          String? shortDescription,
      @HiveField(12)
          PleromaApiInstanceStats? stats,
      @HiveField(13)
          String? thumbnail,
      @HiveField(14)
          String? title,
      @HiveField(15)
      @JsonKey(name: 'upload_limit')
          int? uploadLimit,
      @HiveField(16)
          String uri,
      @HiveField(17)
          PleromaApiInstanceUrls? urls,
      @HiveField(18)
      @JsonKey(name: 'vapid_public_key')
          String? vapidPublicKey,
      @HiveField(19)
      @JsonKey(name: 'version')
          String versionString,
      @HiveField(20)
      @JsonKey(name: 'background_image')
          String? backgroundImage,
      @HiveField(21)
      @JsonKey(name: 'chat_limit')
          int? chatLimit,
      @HiveField(22)
          String? description,
      @HiveField(23)
      @JsonKey(name: 'description_limit')
          int? descriptionLimit,
      @HiveField(24)
      @JsonKey(name: 'invites_enabled')
          bool? invitesEnabled});

  $PleromaApiAccountCopyWith<$Res>? get contactAccount;
  $PleromaApiInstancePleromaPartCopyWith<$Res>? get pleroma;
  $PleromaApiInstancePollLimitsCopyWith<$Res>? get pollLimits;
  $PleromaApiInstanceStatsCopyWith<$Res>? get stats;
  $PleromaApiInstanceUrlsCopyWith<$Res>? get urls;
}

/// @nodoc
class _$PleromaApiInstanceCopyWithImpl<$Res>
    implements $PleromaApiInstanceCopyWith<$Res> {
  _$PleromaApiInstanceCopyWithImpl(this._value, this._then);

  final PleromaApiInstance _value;
  // ignore: unused_field
  final $Res Function(PleromaApiInstance) _then;

  @override
  $Res call({
    Object? approvalRequired = freezed,
    Object? avatarUploadLimit = freezed,
    Object? backgroundUploadLimit = freezed,
    Object? bannerUploadLimit = freezed,
    Object? contactAccount = freezed,
    Object? email = freezed,
    Object? languages = freezed,
    Object? maxTootChars = freezed,
    Object? pleroma = freezed,
    Object? pollLimits = freezed,
    Object? registrations = freezed,
    Object? shortDescription = freezed,
    Object? stats = freezed,
    Object? thumbnail = freezed,
    Object? title = freezed,
    Object? uploadLimit = freezed,
    Object? uri = freezed,
    Object? urls = freezed,
    Object? vapidPublicKey = freezed,
    Object? versionString = freezed,
    Object? backgroundImage = freezed,
    Object? chatLimit = freezed,
    Object? description = freezed,
    Object? descriptionLimit = freezed,
    Object? invitesEnabled = freezed,
  }) {
    return _then(_value.copyWith(
      approvalRequired: approvalRequired == freezed
          ? _value.approvalRequired
          : approvalRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      avatarUploadLimit: avatarUploadLimit == freezed
          ? _value.avatarUploadLimit
          : avatarUploadLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      backgroundUploadLimit: backgroundUploadLimit == freezed
          ? _value.backgroundUploadLimit
          : backgroundUploadLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      bannerUploadLimit: bannerUploadLimit == freezed
          ? _value.bannerUploadLimit
          : bannerUploadLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      contactAccount: contactAccount == freezed
          ? _value.contactAccount
          : contactAccount // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccount?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      languages: languages == freezed
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      maxTootChars: maxTootChars == freezed
          ? _value.maxTootChars
          : maxTootChars // ignore: cast_nullable_to_non_nullable
              as int?,
      pleroma: pleroma == freezed
          ? _value.pleroma
          : pleroma // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstancePleromaPart?,
      pollLimits: pollLimits == freezed
          ? _value.pollLimits
          : pollLimits // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstancePollLimits?,
      registrations: registrations == freezed
          ? _value.registrations
          : registrations // ignore: cast_nullable_to_non_nullable
              as bool?,
      shortDescription: shortDescription == freezed
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      stats: stats == freezed
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstanceStats?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadLimit: uploadLimit == freezed
          ? _value.uploadLimit
          : uploadLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      uri: uri == freezed
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      urls: urls == freezed
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstanceUrls?,
      vapidPublicKey: vapidPublicKey == freezed
          ? _value.vapidPublicKey
          : vapidPublicKey // ignore: cast_nullable_to_non_nullable
              as String?,
      versionString: versionString == freezed
          ? _value.versionString
          : versionString // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundImage: backgroundImage == freezed
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      chatLimit: chatLimit == freezed
          ? _value.chatLimit
          : chatLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionLimit: descriptionLimit == freezed
          ? _value.descriptionLimit
          : descriptionLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      invitesEnabled: invitesEnabled == freezed
          ? _value.invitesEnabled
          : invitesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $PleromaApiAccountCopyWith<$Res>? get contactAccount {
    if (_value.contactAccount == null) {
      return null;
    }

    return $PleromaApiAccountCopyWith<$Res>(_value.contactAccount!, (value) {
      return _then(_value.copyWith(contactAccount: value));
    });
  }

  @override
  $PleromaApiInstancePleromaPartCopyWith<$Res>? get pleroma {
    if (_value.pleroma == null) {
      return null;
    }

    return $PleromaApiInstancePleromaPartCopyWith<$Res>(_value.pleroma!,
        (value) {
      return _then(_value.copyWith(pleroma: value));
    });
  }

  @override
  $PleromaApiInstancePollLimitsCopyWith<$Res>? get pollLimits {
    if (_value.pollLimits == null) {
      return null;
    }

    return $PleromaApiInstancePollLimitsCopyWith<$Res>(_value.pollLimits!,
        (value) {
      return _then(_value.copyWith(pollLimits: value));
    });
  }

  @override
  $PleromaApiInstanceStatsCopyWith<$Res>? get stats {
    if (_value.stats == null) {
      return null;
    }

    return $PleromaApiInstanceStatsCopyWith<$Res>(_value.stats!, (value) {
      return _then(_value.copyWith(stats: value));
    });
  }

  @override
  $PleromaApiInstanceUrlsCopyWith<$Res>? get urls {
    if (_value.urls == null) {
      return null;
    }

    return $PleromaApiInstanceUrlsCopyWith<$Res>(_value.urls!, (value) {
      return _then(_value.copyWith(urls: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiInstanceCopyWith<$Res>
    implements $PleromaApiInstanceCopyWith<$Res> {
  factory _$PleromaApiInstanceCopyWith(
          _PleromaApiInstance value, $Res Function(_PleromaApiInstance) then) =
      __$PleromaApiInstanceCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'approval_required')
          bool? approvalRequired,
      @HiveField(1)
      @JsonKey(name: 'avatar_upload_limit')
          int? avatarUploadLimit,
      @HiveField(2)
      @JsonKey(name: 'background_upload_limit')
          int? backgroundUploadLimit,
      @HiveField(3)
      @JsonKey(name: 'banner_upload_limit')
          int? bannerUploadLimit,
      @HiveField(4)
      @JsonKey(name: 'contact_account')
          PleromaApiAccount? contactAccount,
      @HiveField(5)
          String? email,
      @HiveField(6)
          List<String>? languages,
      @HiveField(7)
      @JsonKey(name: 'max_toot_chars', fromJson: JsonParseHelper.intFromJsonOrNullOnError)
          int? maxTootChars,
      @HiveField(8)
          PleromaApiInstancePleromaPart? pleroma,
      @HiveField(9)
      @JsonKey(name: 'poll_limits')
          PleromaApiInstancePollLimits? pollLimits,
      @HiveField(10)
          bool? registrations,
      @HiveField(11)
      @JsonKey(name: 'short_description')
          String? shortDescription,
      @HiveField(12)
          PleromaApiInstanceStats? stats,
      @HiveField(13)
          String? thumbnail,
      @HiveField(14)
          String? title,
      @HiveField(15)
      @JsonKey(name: 'upload_limit')
          int? uploadLimit,
      @HiveField(16)
          String uri,
      @HiveField(17)
          PleromaApiInstanceUrls? urls,
      @HiveField(18)
      @JsonKey(name: 'vapid_public_key')
          String? vapidPublicKey,
      @HiveField(19)
      @JsonKey(name: 'version')
          String versionString,
      @HiveField(20)
      @JsonKey(name: 'background_image')
          String? backgroundImage,
      @HiveField(21)
      @JsonKey(name: 'chat_limit')
          int? chatLimit,
      @HiveField(22)
          String? description,
      @HiveField(23)
      @JsonKey(name: 'description_limit')
          int? descriptionLimit,
      @HiveField(24)
      @JsonKey(name: 'invites_enabled')
          bool? invitesEnabled});

  @override
  $PleromaApiAccountCopyWith<$Res>? get contactAccount;
  @override
  $PleromaApiInstancePleromaPartCopyWith<$Res>? get pleroma;
  @override
  $PleromaApiInstancePollLimitsCopyWith<$Res>? get pollLimits;
  @override
  $PleromaApiInstanceStatsCopyWith<$Res>? get stats;
  @override
  $PleromaApiInstanceUrlsCopyWith<$Res>? get urls;
}

/// @nodoc
class __$PleromaApiInstanceCopyWithImpl<$Res>
    extends _$PleromaApiInstanceCopyWithImpl<$Res>
    implements _$PleromaApiInstanceCopyWith<$Res> {
  __$PleromaApiInstanceCopyWithImpl(
      _PleromaApiInstance _value, $Res Function(_PleromaApiInstance) _then)
      : super(_value, (v) => _then(v as _PleromaApiInstance));

  @override
  _PleromaApiInstance get _value => super._value as _PleromaApiInstance;

  @override
  $Res call({
    Object? approvalRequired = freezed,
    Object? avatarUploadLimit = freezed,
    Object? backgroundUploadLimit = freezed,
    Object? bannerUploadLimit = freezed,
    Object? contactAccount = freezed,
    Object? email = freezed,
    Object? languages = freezed,
    Object? maxTootChars = freezed,
    Object? pleroma = freezed,
    Object? pollLimits = freezed,
    Object? registrations = freezed,
    Object? shortDescription = freezed,
    Object? stats = freezed,
    Object? thumbnail = freezed,
    Object? title = freezed,
    Object? uploadLimit = freezed,
    Object? uri = freezed,
    Object? urls = freezed,
    Object? vapidPublicKey = freezed,
    Object? versionString = freezed,
    Object? backgroundImage = freezed,
    Object? chatLimit = freezed,
    Object? description = freezed,
    Object? descriptionLimit = freezed,
    Object? invitesEnabled = freezed,
  }) {
    return _then(_PleromaApiInstance(
      approvalRequired: approvalRequired == freezed
          ? _value.approvalRequired
          : approvalRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      avatarUploadLimit: avatarUploadLimit == freezed
          ? _value.avatarUploadLimit
          : avatarUploadLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      backgroundUploadLimit: backgroundUploadLimit == freezed
          ? _value.backgroundUploadLimit
          : backgroundUploadLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      bannerUploadLimit: bannerUploadLimit == freezed
          ? _value.bannerUploadLimit
          : bannerUploadLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      contactAccount: contactAccount == freezed
          ? _value.contactAccount
          : contactAccount // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccount?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      languages: languages == freezed
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      maxTootChars: maxTootChars == freezed
          ? _value.maxTootChars
          : maxTootChars // ignore: cast_nullable_to_non_nullable
              as int?,
      pleroma: pleroma == freezed
          ? _value.pleroma
          : pleroma // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstancePleromaPart?,
      pollLimits: pollLimits == freezed
          ? _value.pollLimits
          : pollLimits // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstancePollLimits?,
      registrations: registrations == freezed
          ? _value.registrations
          : registrations // ignore: cast_nullable_to_non_nullable
              as bool?,
      shortDescription: shortDescription == freezed
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      stats: stats == freezed
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstanceStats?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadLimit: uploadLimit == freezed
          ? _value.uploadLimit
          : uploadLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      uri: uri == freezed
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      urls: urls == freezed
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstanceUrls?,
      vapidPublicKey: vapidPublicKey == freezed
          ? _value.vapidPublicKey
          : vapidPublicKey // ignore: cast_nullable_to_non_nullable
              as String?,
      versionString: versionString == freezed
          ? _value.versionString
          : versionString // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundImage: backgroundImage == freezed
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      chatLimit: chatLimit == freezed
          ? _value.chatLimit
          : chatLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionLimit: descriptionLimit == freezed
          ? _value.descriptionLimit
          : descriptionLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      invitesEnabled: invitesEnabled == freezed
          ? _value.invitesEnabled
          : invitesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiInstance implements _PleromaApiInstance {
  const _$_PleromaApiInstance(
      {@HiveField(0)
      @JsonKey(name: 'approval_required')
          required this.approvalRequired,
      @HiveField(1)
      @JsonKey(name: 'avatar_upload_limit')
          required this.avatarUploadLimit,
      @HiveField(2)
      @JsonKey(name: 'background_upload_limit')
          required this.backgroundUploadLimit,
      @HiveField(3)
      @JsonKey(name: 'banner_upload_limit')
          required this.bannerUploadLimit,
      @HiveField(4)
      @JsonKey(name: 'contact_account')
          required this.contactAccount,
      @HiveField(5)
          required this.email,
      @HiveField(6)
          required this.languages,
      @HiveField(7)
      @JsonKey(name: 'max_toot_chars', fromJson: JsonParseHelper.intFromJsonOrNullOnError)
          required this.maxTootChars,
      @HiveField(8)
          required this.pleroma,
      @HiveField(9)
      @JsonKey(name: 'poll_limits')
          required this.pollLimits,
      @HiveField(10)
          required this.registrations,
      @HiveField(11)
      @JsonKey(name: 'short_description')
          required this.shortDescription,
      @HiveField(12)
          required this.stats,
      @HiveField(13)
          required this.thumbnail,
      @HiveField(14)
          required this.title,
      @HiveField(15)
      @JsonKey(name: 'upload_limit')
          required this.uploadLimit,
      @HiveField(16)
          required this.uri,
      @HiveField(17)
          required this.urls,
      @HiveField(18)
      @JsonKey(name: 'vapid_public_key')
          required this.vapidPublicKey,
      @HiveField(19)
      @JsonKey(name: 'version')
          required this.versionString,
      @HiveField(20)
      @JsonKey(name: 'background_image')
          required this.backgroundImage,
      @HiveField(21)
      @JsonKey(name: 'chat_limit')
          required this.chatLimit,
      @HiveField(22)
          required this.description,
      @HiveField(23)
      @JsonKey(name: 'description_limit')
          required this.descriptionLimit,
      @HiveField(24)
      @JsonKey(name: 'invites_enabled')
          required this.invitesEnabled});

  factory _$_PleromaApiInstance.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiInstanceFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'approval_required')
  final bool? approvalRequired;
  @override
  @HiveField(1)
  @JsonKey(name: 'avatar_upload_limit')
  final int? avatarUploadLimit;
  @override
  @HiveField(2)
  @JsonKey(name: 'background_upload_limit')
  final int? backgroundUploadLimit;
  @override
  @HiveField(3)
  @JsonKey(name: 'banner_upload_limit')
  final int? bannerUploadLimit;
  @override
  @HiveField(4)
  @JsonKey(name: 'contact_account')
  final PleromaApiAccount? contactAccount;
  @override
  @HiveField(5)
  final String? email;
  @override
  @HiveField(6)
  final List<String>? languages;
  @override
  @HiveField(7)
  @JsonKey(
      name: 'max_toot_chars',
      fromJson: JsonParseHelper.intFromJsonOrNullOnError)
  final int? maxTootChars;
  @override
  @HiveField(8)
  final PleromaApiInstancePleromaPart? pleroma;
  @override
  @HiveField(9)
  @JsonKey(name: 'poll_limits')
  final PleromaApiInstancePollLimits? pollLimits;
  @override
  @HiveField(10)
  final bool? registrations;
  @override
  @HiveField(11)
  @JsonKey(name: 'short_description')
  final String? shortDescription;
  @override
  @HiveField(12)
  final PleromaApiInstanceStats? stats;
  @override
  @HiveField(13)
  final String? thumbnail;
  @override
  @HiveField(14)
  final String? title;
  @override
  @HiveField(15)
  @JsonKey(name: 'upload_limit')
  final int? uploadLimit;
  @override
  @HiveField(16)
  final String uri;
  @override
  @HiveField(17)
  final PleromaApiInstanceUrls? urls;
  @override
  @HiveField(18)
  @JsonKey(name: 'vapid_public_key')
  final String? vapidPublicKey;
  @override
  @HiveField(19)
  @JsonKey(name: 'version')
  final String versionString;
  @override
  @HiveField(20)
  @JsonKey(name: 'background_image')
  final String? backgroundImage;
  @override
  @HiveField(21)
  @JsonKey(name: 'chat_limit')
  final int? chatLimit;
  @override
  @HiveField(22)
  final String? description;
  @override
  @HiveField(23)
  @JsonKey(name: 'description_limit')
  final int? descriptionLimit;
  @override
  @HiveField(24)
  @JsonKey(name: 'invites_enabled')
  final bool? invitesEnabled;

  @override
  String toString() {
    return 'PleromaApiInstance(approvalRequired: $approvalRequired, avatarUploadLimit: $avatarUploadLimit, backgroundUploadLimit: $backgroundUploadLimit, bannerUploadLimit: $bannerUploadLimit, contactAccount: $contactAccount, email: $email, languages: $languages, maxTootChars: $maxTootChars, pleroma: $pleroma, pollLimits: $pollLimits, registrations: $registrations, shortDescription: $shortDescription, stats: $stats, thumbnail: $thumbnail, title: $title, uploadLimit: $uploadLimit, uri: $uri, urls: $urls, vapidPublicKey: $vapidPublicKey, versionString: $versionString, backgroundImage: $backgroundImage, chatLimit: $chatLimit, description: $description, descriptionLimit: $descriptionLimit, invitesEnabled: $invitesEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiInstance &&
            (identical(other.approvalRequired, approvalRequired) ||
                const DeepCollectionEquality()
                    .equals(other.approvalRequired, approvalRequired)) &&
            (identical(other.avatarUploadLimit, avatarUploadLimit) ||
                const DeepCollectionEquality()
                    .equals(other.avatarUploadLimit, avatarUploadLimit)) &&
            (identical(other.backgroundUploadLimit, backgroundUploadLimit) ||
                const DeepCollectionEquality().equals(
                    other.backgroundUploadLimit, backgroundUploadLimit)) &&
            (identical(other.bannerUploadLimit, bannerUploadLimit) ||
                const DeepCollectionEquality()
                    .equals(other.bannerUploadLimit, bannerUploadLimit)) &&
            (identical(other.contactAccount, contactAccount) ||
                const DeepCollectionEquality()
                    .equals(other.contactAccount, contactAccount)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.languages, languages) ||
                const DeepCollectionEquality()
                    .equals(other.languages, languages)) &&
            (identical(other.maxTootChars, maxTootChars) ||
                const DeepCollectionEquality()
                    .equals(other.maxTootChars, maxTootChars)) &&
            (identical(other.pleroma, pleroma) ||
                const DeepCollectionEquality()
                    .equals(other.pleroma, pleroma)) &&
            (identical(other.pollLimits, pollLimits) ||
                const DeepCollectionEquality()
                    .equals(other.pollLimits, pollLimits)) &&
            (identical(other.registrations, registrations) ||
                const DeepCollectionEquality()
                    .equals(other.registrations, registrations)) &&
            (identical(other.shortDescription, shortDescription) ||
                const DeepCollectionEquality()
                    .equals(other.shortDescription, shortDescription)) &&
            (identical(other.stats, stats) ||
                const DeepCollectionEquality().equals(other.stats, stats)) &&
            (identical(other.thumbnail, thumbnail) ||
                const DeepCollectionEquality()
                    .equals(other.thumbnail, thumbnail)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.uploadLimit, uploadLimit) ||
                const DeepCollectionEquality()
                    .equals(other.uploadLimit, uploadLimit)) &&
            (identical(other.uri, uri) ||
                const DeepCollectionEquality().equals(other.uri, uri)) &&
            (identical(other.urls, urls) ||
                const DeepCollectionEquality().equals(other.urls, urls)) &&
            (identical(other.vapidPublicKey, vapidPublicKey) ||
                const DeepCollectionEquality()
                    .equals(other.vapidPublicKey, vapidPublicKey)) &&
            (identical(other.versionString, versionString) ||
                const DeepCollectionEquality()
                    .equals(other.versionString, versionString)) &&
            (identical(other.backgroundImage, backgroundImage) ||
                const DeepCollectionEquality()
                    .equals(other.backgroundImage, backgroundImage)) &&
            (identical(other.chatLimit, chatLimit) ||
                const DeepCollectionEquality()
                    .equals(other.chatLimit, chatLimit)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.descriptionLimit, descriptionLimit) ||
                const DeepCollectionEquality()
                    .equals(other.descriptionLimit, descriptionLimit)) &&
            (identical(other.invitesEnabled, invitesEnabled) || const DeepCollectionEquality().equals(other.invitesEnabled, invitesEnabled)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(approvalRequired) ^
      const DeepCollectionEquality().hash(avatarUploadLimit) ^
      const DeepCollectionEquality().hash(backgroundUploadLimit) ^
      const DeepCollectionEquality().hash(bannerUploadLimit) ^
      const DeepCollectionEquality().hash(contactAccount) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(languages) ^
      const DeepCollectionEquality().hash(maxTootChars) ^
      const DeepCollectionEquality().hash(pleroma) ^
      const DeepCollectionEquality().hash(pollLimits) ^
      const DeepCollectionEquality().hash(registrations) ^
      const DeepCollectionEquality().hash(shortDescription) ^
      const DeepCollectionEquality().hash(stats) ^
      const DeepCollectionEquality().hash(thumbnail) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(uploadLimit) ^
      const DeepCollectionEquality().hash(uri) ^
      const DeepCollectionEquality().hash(urls) ^
      const DeepCollectionEquality().hash(vapidPublicKey) ^
      const DeepCollectionEquality().hash(versionString) ^
      const DeepCollectionEquality().hash(backgroundImage) ^
      const DeepCollectionEquality().hash(chatLimit) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(descriptionLimit) ^
      const DeepCollectionEquality().hash(invitesEnabled);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiInstanceCopyWith<_PleromaApiInstance> get copyWith =>
      __$PleromaApiInstanceCopyWithImpl<_PleromaApiInstance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiInstanceToJson(this);
  }
}

abstract class _PleromaApiInstance implements PleromaApiInstance {
  const factory _PleromaApiInstance(
      {@HiveField(0)
      @JsonKey(name: 'approval_required')
          required bool? approvalRequired,
      @HiveField(1)
      @JsonKey(name: 'avatar_upload_limit')
          required int? avatarUploadLimit,
      @HiveField(2)
      @JsonKey(name: 'background_upload_limit')
          required int? backgroundUploadLimit,
      @HiveField(3)
      @JsonKey(name: 'banner_upload_limit')
          required int? bannerUploadLimit,
      @HiveField(4)
      @JsonKey(name: 'contact_account')
          required PleromaApiAccount? contactAccount,
      @HiveField(5)
          required String? email,
      @HiveField(6)
          required List<String>? languages,
      @HiveField(7)
      @JsonKey(name: 'max_toot_chars', fromJson: JsonParseHelper.intFromJsonOrNullOnError)
          required int? maxTootChars,
      @HiveField(8)
          required PleromaApiInstancePleromaPart? pleroma,
      @HiveField(9)
      @JsonKey(name: 'poll_limits')
          required PleromaApiInstancePollLimits? pollLimits,
      @HiveField(10)
          required bool? registrations,
      @HiveField(11)
      @JsonKey(name: 'short_description')
          required String? shortDescription,
      @HiveField(12)
          required PleromaApiInstanceStats? stats,
      @HiveField(13)
          required String? thumbnail,
      @HiveField(14)
          required String? title,
      @HiveField(15)
      @JsonKey(name: 'upload_limit')
          required int? uploadLimit,
      @HiveField(16)
          required String uri,
      @HiveField(17)
          required PleromaApiInstanceUrls? urls,
      @HiveField(18)
      @JsonKey(name: 'vapid_public_key')
          required String? vapidPublicKey,
      @HiveField(19)
      @JsonKey(name: 'version')
          required String versionString,
      @HiveField(20)
      @JsonKey(name: 'background_image')
          required String? backgroundImage,
      @HiveField(21)
      @JsonKey(name: 'chat_limit')
          required int? chatLimit,
      @HiveField(22)
          required String? description,
      @HiveField(23)
      @JsonKey(name: 'description_limit')
          required int? descriptionLimit,
      @HiveField(24)
      @JsonKey(name: 'invites_enabled')
          required bool? invitesEnabled}) = _$_PleromaApiInstance;

  factory _PleromaApiInstance.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiInstance.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'approval_required')
  bool? get approvalRequired => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'avatar_upload_limit')
  int? get avatarUploadLimit => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'background_upload_limit')
  int? get backgroundUploadLimit => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  @JsonKey(name: 'banner_upload_limit')
  int? get bannerUploadLimit => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  @JsonKey(name: 'contact_account')
  PleromaApiAccount? get contactAccount => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  String? get email => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  List<String>? get languages => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  @JsonKey(
      name: 'max_toot_chars',
      fromJson: JsonParseHelper.intFromJsonOrNullOnError)
  int? get maxTootChars => throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  PleromaApiInstancePleromaPart? get pleroma =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(9)
  @JsonKey(name: 'poll_limits')
  PleromaApiInstancePollLimits? get pollLimits =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(10)
  bool? get registrations => throw _privateConstructorUsedError;
  @override
  @HiveField(11)
  @JsonKey(name: 'short_description')
  String? get shortDescription => throw _privateConstructorUsedError;
  @override
  @HiveField(12)
  PleromaApiInstanceStats? get stats => throw _privateConstructorUsedError;
  @override
  @HiveField(13)
  String? get thumbnail => throw _privateConstructorUsedError;
  @override
  @HiveField(14)
  String? get title => throw _privateConstructorUsedError;
  @override
  @HiveField(15)
  @JsonKey(name: 'upload_limit')
  int? get uploadLimit => throw _privateConstructorUsedError;
  @override
  @HiveField(16)
  String get uri => throw _privateConstructorUsedError;
  @override
  @HiveField(17)
  PleromaApiInstanceUrls? get urls => throw _privateConstructorUsedError;
  @override
  @HiveField(18)
  @JsonKey(name: 'vapid_public_key')
  String? get vapidPublicKey => throw _privateConstructorUsedError;
  @override
  @HiveField(19)
  @JsonKey(name: 'version')
  String get versionString => throw _privateConstructorUsedError;
  @override
  @HiveField(20)
  @JsonKey(name: 'background_image')
  String? get backgroundImage => throw _privateConstructorUsedError;
  @override
  @HiveField(21)
  @JsonKey(name: 'chat_limit')
  int? get chatLimit => throw _privateConstructorUsedError;
  @override
  @HiveField(22)
  String? get description => throw _privateConstructorUsedError;
  @override
  @HiveField(23)
  @JsonKey(name: 'description_limit')
  int? get descriptionLimit => throw _privateConstructorUsedError;
  @override
  @HiveField(24)
  @JsonKey(name: 'invites_enabled')
  bool? get invitesEnabled => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiInstanceCopyWith<_PleromaApiInstance> get copyWith =>
      throw _privateConstructorUsedError;
}
