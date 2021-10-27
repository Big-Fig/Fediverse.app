// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstance _$UnifediApiInstanceFromJson(Map<String, dynamic> json) {
  return _UnifediApiInstance.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstanceTearOff {
  const _$UnifediApiInstanceTearOff();

  _UnifediApiInstance call(
      {@HiveField(0)
          required String type,
      @JsonKey(name: 'version')
      @HiveField(1)
          required String versionString,
      @HiveField(2)
          required UnifediApiInstanceLimits? limits,
      @JsonKey(name: 'vapid_public_key')
      @HiveField(3)
          required String? vapidPublicKey,
      @JsonKey(name: 'background_image')
      @HiveField(4)
          required String? backgroundImage,
      @JsonKey(name: 'contact_account')
      @HiveField(5)
          required UnifediApiAccount? contactAccount,
      @HiveField(6)
          required List<String>? features,
      @JsonKey(name: 'post_formats')
      @HiveField(7)
          required List<String>? postFormats,
      @HiveField(8)
      @JsonKey(name: 'account_activation')
          required bool? accountActivationRequired,
      @HiveField(9)
          required UnifediApiInstanceFederation? federation,
      @HiveField(10)
          required UnifediApiInstanceUrls? urls,
      @HiveField(11)
          required UnifediApiInstanceStats? stats,
      @HiveField(12)
          required String uri,
      @HiveField(13)
          required String? title,
      @JsonKey(name: 'short_description')
      @HiveField(14)
          required String? shortDescription,
      @HiveField(15)
          required String? description,
      @HiveField(16)
          required String? email,
      @HiveField(17)
          required String? thumbnail,
      @HiveField(18)
          required List<String>? languages,
      @HiveField(19)
          required bool? registrations,
      @JsonKey(name: 'approval_required')
      @HiveField(20)
          required bool? approvalRequired,
      @JsonKey(name: 'invites_enabled')
      @HiveField(21)
          required bool? invitesEnabled}) {
    return _UnifediApiInstance(
      type: type,
      versionString: versionString,
      limits: limits,
      vapidPublicKey: vapidPublicKey,
      backgroundImage: backgroundImage,
      contactAccount: contactAccount,
      features: features,
      postFormats: postFormats,
      accountActivationRequired: accountActivationRequired,
      federation: federation,
      urls: urls,
      stats: stats,
      uri: uri,
      title: title,
      shortDescription: shortDescription,
      description: description,
      email: email,
      thumbnail: thumbnail,
      languages: languages,
      registrations: registrations,
      approvalRequired: approvalRequired,
      invitesEnabled: invitesEnabled,
    );
  }

  UnifediApiInstance fromJson(Map<String, Object?> json) {
    return UnifediApiInstance.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstance = _$UnifediApiInstanceTearOff();

/// @nodoc
mixin _$UnifediApiInstance {
  @HiveField(0)
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'version')
  @HiveField(1)
  String get versionString => throw _privateConstructorUsedError;
  @HiveField(2)
  UnifediApiInstanceLimits? get limits => throw _privateConstructorUsedError;
  @JsonKey(name: 'vapid_public_key')
  @HiveField(3)
  String? get vapidPublicKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'background_image')
  @HiveField(4)
  String? get backgroundImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_account')
  @HiveField(5)
  UnifediApiAccount? get contactAccount => throw _privateConstructorUsedError;
  @HiveField(6)
  List<String>? get features => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_formats')
  @HiveField(7)
  List<String>? get postFormats => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'account_activation')
  bool? get accountActivationRequired => throw _privateConstructorUsedError;
  @HiveField(9)
  UnifediApiInstanceFederation? get federation =>
      throw _privateConstructorUsedError;
  @HiveField(10)
  UnifediApiInstanceUrls? get urls => throw _privateConstructorUsedError;
  @HiveField(11)
  UnifediApiInstanceStats? get stats => throw _privateConstructorUsedError;
  @HiveField(12)
  String get uri => throw _privateConstructorUsedError;
  @HiveField(13)
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'short_description')
  @HiveField(14)
  String? get shortDescription => throw _privateConstructorUsedError;
  @HiveField(15)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(16)
  String? get email => throw _privateConstructorUsedError;
  @HiveField(17)
  String? get thumbnail => throw _privateConstructorUsedError;
  @HiveField(18)
  List<String>? get languages => throw _privateConstructorUsedError;
  @HiveField(19)
  bool? get registrations => throw _privateConstructorUsedError;
  @JsonKey(name: 'approval_required')
  @HiveField(20)
  bool? get approvalRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'invites_enabled')
  @HiveField(21)
  bool? get invitesEnabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiInstanceCopyWith<UnifediApiInstance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstanceCopyWith<$Res> {
  factory $UnifediApiInstanceCopyWith(
          UnifediApiInstance value, $Res Function(UnifediApiInstance) then) =
      _$UnifediApiInstanceCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          String type,
      @JsonKey(name: 'version')
      @HiveField(1)
          String versionString,
      @HiveField(2)
          UnifediApiInstanceLimits? limits,
      @JsonKey(name: 'vapid_public_key')
      @HiveField(3)
          String? vapidPublicKey,
      @JsonKey(name: 'background_image')
      @HiveField(4)
          String? backgroundImage,
      @JsonKey(name: 'contact_account')
      @HiveField(5)
          UnifediApiAccount? contactAccount,
      @HiveField(6)
          List<String>? features,
      @JsonKey(name: 'post_formats')
      @HiveField(7)
          List<String>? postFormats,
      @HiveField(8)
      @JsonKey(name: 'account_activation')
          bool? accountActivationRequired,
      @HiveField(9)
          UnifediApiInstanceFederation? federation,
      @HiveField(10)
          UnifediApiInstanceUrls? urls,
      @HiveField(11)
          UnifediApiInstanceStats? stats,
      @HiveField(12)
          String uri,
      @HiveField(13)
          String? title,
      @JsonKey(name: 'short_description')
      @HiveField(14)
          String? shortDescription,
      @HiveField(15)
          String? description,
      @HiveField(16)
          String? email,
      @HiveField(17)
          String? thumbnail,
      @HiveField(18)
          List<String>? languages,
      @HiveField(19)
          bool? registrations,
      @JsonKey(name: 'approval_required')
      @HiveField(20)
          bool? approvalRequired,
      @JsonKey(name: 'invites_enabled')
      @HiveField(21)
          bool? invitesEnabled});

  $UnifediApiInstanceLimitsCopyWith<$Res>? get limits;
  $UnifediApiAccountCopyWith<$Res>? get contactAccount;
  $UnifediApiInstanceFederationCopyWith<$Res>? get federation;
  $UnifediApiInstanceUrlsCopyWith<$Res>? get urls;
  $UnifediApiInstanceStatsCopyWith<$Res>? get stats;
}

/// @nodoc
class _$UnifediApiInstanceCopyWithImpl<$Res>
    implements $UnifediApiInstanceCopyWith<$Res> {
  _$UnifediApiInstanceCopyWithImpl(this._value, this._then);

  final UnifediApiInstance _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstance) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? versionString = freezed,
    Object? limits = freezed,
    Object? vapidPublicKey = freezed,
    Object? backgroundImage = freezed,
    Object? contactAccount = freezed,
    Object? features = freezed,
    Object? postFormats = freezed,
    Object? accountActivationRequired = freezed,
    Object? federation = freezed,
    Object? urls = freezed,
    Object? stats = freezed,
    Object? uri = freezed,
    Object? title = freezed,
    Object? shortDescription = freezed,
    Object? description = freezed,
    Object? email = freezed,
    Object? thumbnail = freezed,
    Object? languages = freezed,
    Object? registrations = freezed,
    Object? approvalRequired = freezed,
    Object? invitesEnabled = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      versionString: versionString == freezed
          ? _value.versionString
          : versionString // ignore: cast_nullable_to_non_nullable
              as String,
      limits: limits == freezed
          ? _value.limits
          : limits // ignore: cast_nullable_to_non_nullable
              as UnifediApiInstanceLimits?,
      vapidPublicKey: vapidPublicKey == freezed
          ? _value.vapidPublicKey
          : vapidPublicKey // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImage: backgroundImage == freezed
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      contactAccount: contactAccount == freezed
          ? _value.contactAccount
          : contactAccount // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccount?,
      features: features == freezed
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      postFormats: postFormats == freezed
          ? _value.postFormats
          : postFormats // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      accountActivationRequired: accountActivationRequired == freezed
          ? _value.accountActivationRequired
          : accountActivationRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      federation: federation == freezed
          ? _value.federation
          : federation // ignore: cast_nullable_to_non_nullable
              as UnifediApiInstanceFederation?,
      urls: urls == freezed
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as UnifediApiInstanceUrls?,
      stats: stats == freezed
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as UnifediApiInstanceStats?,
      uri: uri == freezed
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      shortDescription: shortDescription == freezed
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      languages: languages == freezed
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      registrations: registrations == freezed
          ? _value.registrations
          : registrations // ignore: cast_nullable_to_non_nullable
              as bool?,
      approvalRequired: approvalRequired == freezed
          ? _value.approvalRequired
          : approvalRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      invitesEnabled: invitesEnabled == freezed
          ? _value.invitesEnabled
          : invitesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $UnifediApiInstanceLimitsCopyWith<$Res>? get limits {
    if (_value.limits == null) {
      return null;
    }

    return $UnifediApiInstanceLimitsCopyWith<$Res>(_value.limits!, (value) {
      return _then(_value.copyWith(limits: value));
    });
  }

  @override
  $UnifediApiAccountCopyWith<$Res>? get contactAccount {
    if (_value.contactAccount == null) {
      return null;
    }

    return $UnifediApiAccountCopyWith<$Res>(_value.contactAccount!, (value) {
      return _then(_value.copyWith(contactAccount: value));
    });
  }

  @override
  $UnifediApiInstanceFederationCopyWith<$Res>? get federation {
    if (_value.federation == null) {
      return null;
    }

    return $UnifediApiInstanceFederationCopyWith<$Res>(_value.federation!,
        (value) {
      return _then(_value.copyWith(federation: value));
    });
  }

  @override
  $UnifediApiInstanceUrlsCopyWith<$Res>? get urls {
    if (_value.urls == null) {
      return null;
    }

    return $UnifediApiInstanceUrlsCopyWith<$Res>(_value.urls!, (value) {
      return _then(_value.copyWith(urls: value));
    });
  }

  @override
  $UnifediApiInstanceStatsCopyWith<$Res>? get stats {
    if (_value.stats == null) {
      return null;
    }

    return $UnifediApiInstanceStatsCopyWith<$Res>(_value.stats!, (value) {
      return _then(_value.copyWith(stats: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiInstanceCopyWith<$Res>
    implements $UnifediApiInstanceCopyWith<$Res> {
  factory _$UnifediApiInstanceCopyWith(
          _UnifediApiInstance value, $Res Function(_UnifediApiInstance) then) =
      __$UnifediApiInstanceCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          String type,
      @JsonKey(name: 'version')
      @HiveField(1)
          String versionString,
      @HiveField(2)
          UnifediApiInstanceLimits? limits,
      @JsonKey(name: 'vapid_public_key')
      @HiveField(3)
          String? vapidPublicKey,
      @JsonKey(name: 'background_image')
      @HiveField(4)
          String? backgroundImage,
      @JsonKey(name: 'contact_account')
      @HiveField(5)
          UnifediApiAccount? contactAccount,
      @HiveField(6)
          List<String>? features,
      @JsonKey(name: 'post_formats')
      @HiveField(7)
          List<String>? postFormats,
      @HiveField(8)
      @JsonKey(name: 'account_activation')
          bool? accountActivationRequired,
      @HiveField(9)
          UnifediApiInstanceFederation? federation,
      @HiveField(10)
          UnifediApiInstanceUrls? urls,
      @HiveField(11)
          UnifediApiInstanceStats? stats,
      @HiveField(12)
          String uri,
      @HiveField(13)
          String? title,
      @JsonKey(name: 'short_description')
      @HiveField(14)
          String? shortDescription,
      @HiveField(15)
          String? description,
      @HiveField(16)
          String? email,
      @HiveField(17)
          String? thumbnail,
      @HiveField(18)
          List<String>? languages,
      @HiveField(19)
          bool? registrations,
      @JsonKey(name: 'approval_required')
      @HiveField(20)
          bool? approvalRequired,
      @JsonKey(name: 'invites_enabled')
      @HiveField(21)
          bool? invitesEnabled});

  @override
  $UnifediApiInstanceLimitsCopyWith<$Res>? get limits;
  @override
  $UnifediApiAccountCopyWith<$Res>? get contactAccount;
  @override
  $UnifediApiInstanceFederationCopyWith<$Res>? get federation;
  @override
  $UnifediApiInstanceUrlsCopyWith<$Res>? get urls;
  @override
  $UnifediApiInstanceStatsCopyWith<$Res>? get stats;
}

/// @nodoc
class __$UnifediApiInstanceCopyWithImpl<$Res>
    extends _$UnifediApiInstanceCopyWithImpl<$Res>
    implements _$UnifediApiInstanceCopyWith<$Res> {
  __$UnifediApiInstanceCopyWithImpl(
      _UnifediApiInstance _value, $Res Function(_UnifediApiInstance) _then)
      : super(_value, (v) => _then(v as _UnifediApiInstance));

  @override
  _UnifediApiInstance get _value => super._value as _UnifediApiInstance;

  @override
  $Res call({
    Object? type = freezed,
    Object? versionString = freezed,
    Object? limits = freezed,
    Object? vapidPublicKey = freezed,
    Object? backgroundImage = freezed,
    Object? contactAccount = freezed,
    Object? features = freezed,
    Object? postFormats = freezed,
    Object? accountActivationRequired = freezed,
    Object? federation = freezed,
    Object? urls = freezed,
    Object? stats = freezed,
    Object? uri = freezed,
    Object? title = freezed,
    Object? shortDescription = freezed,
    Object? description = freezed,
    Object? email = freezed,
    Object? thumbnail = freezed,
    Object? languages = freezed,
    Object? registrations = freezed,
    Object? approvalRequired = freezed,
    Object? invitesEnabled = freezed,
  }) {
    return _then(_UnifediApiInstance(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      versionString: versionString == freezed
          ? _value.versionString
          : versionString // ignore: cast_nullable_to_non_nullable
              as String,
      limits: limits == freezed
          ? _value.limits
          : limits // ignore: cast_nullable_to_non_nullable
              as UnifediApiInstanceLimits?,
      vapidPublicKey: vapidPublicKey == freezed
          ? _value.vapidPublicKey
          : vapidPublicKey // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImage: backgroundImage == freezed
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
      contactAccount: contactAccount == freezed
          ? _value.contactAccount
          : contactAccount // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccount?,
      features: features == freezed
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      postFormats: postFormats == freezed
          ? _value.postFormats
          : postFormats // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      accountActivationRequired: accountActivationRequired == freezed
          ? _value.accountActivationRequired
          : accountActivationRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      federation: federation == freezed
          ? _value.federation
          : federation // ignore: cast_nullable_to_non_nullable
              as UnifediApiInstanceFederation?,
      urls: urls == freezed
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as UnifediApiInstanceUrls?,
      stats: stats == freezed
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as UnifediApiInstanceStats?,
      uri: uri == freezed
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      shortDescription: shortDescription == freezed
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      languages: languages == freezed
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      registrations: registrations == freezed
          ? _value.registrations
          : registrations // ignore: cast_nullable_to_non_nullable
              as bool?,
      approvalRequired: approvalRequired == freezed
          ? _value.approvalRequired
          : approvalRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      invitesEnabled: invitesEnabled == freezed
          ? _value.invitesEnabled
          : invitesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiInstance implements _UnifediApiInstance {
  const _$_UnifediApiInstance(
      {@HiveField(0)
          required this.type,
      @JsonKey(name: 'version')
      @HiveField(1)
          required this.versionString,
      @HiveField(2)
          required this.limits,
      @JsonKey(name: 'vapid_public_key')
      @HiveField(3)
          required this.vapidPublicKey,
      @JsonKey(name: 'background_image')
      @HiveField(4)
          required this.backgroundImage,
      @JsonKey(name: 'contact_account')
      @HiveField(5)
          required this.contactAccount,
      @HiveField(6)
          required this.features,
      @JsonKey(name: 'post_formats')
      @HiveField(7)
          required this.postFormats,
      @HiveField(8)
      @JsonKey(name: 'account_activation')
          required this.accountActivationRequired,
      @HiveField(9)
          required this.federation,
      @HiveField(10)
          required this.urls,
      @HiveField(11)
          required this.stats,
      @HiveField(12)
          required this.uri,
      @HiveField(13)
          required this.title,
      @JsonKey(name: 'short_description')
      @HiveField(14)
          required this.shortDescription,
      @HiveField(15)
          required this.description,
      @HiveField(16)
          required this.email,
      @HiveField(17)
          required this.thumbnail,
      @HiveField(18)
          required this.languages,
      @HiveField(19)
          required this.registrations,
      @JsonKey(name: 'approval_required')
      @HiveField(20)
          required this.approvalRequired,
      @JsonKey(name: 'invites_enabled')
      @HiveField(21)
          required this.invitesEnabled});

  factory _$_UnifediApiInstance.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiInstanceFromJson(json);

  @override
  @HiveField(0)
  final String type;
  @override
  @JsonKey(name: 'version')
  @HiveField(1)
  final String versionString;
  @override
  @HiveField(2)
  final UnifediApiInstanceLimits? limits;
  @override
  @JsonKey(name: 'vapid_public_key')
  @HiveField(3)
  final String? vapidPublicKey;
  @override
  @JsonKey(name: 'background_image')
  @HiveField(4)
  final String? backgroundImage;
  @override
  @JsonKey(name: 'contact_account')
  @HiveField(5)
  final UnifediApiAccount? contactAccount;
  @override
  @HiveField(6)
  final List<String>? features;
  @override
  @JsonKey(name: 'post_formats')
  @HiveField(7)
  final List<String>? postFormats;
  @override
  @HiveField(8)
  @JsonKey(name: 'account_activation')
  final bool? accountActivationRequired;
  @override
  @HiveField(9)
  final UnifediApiInstanceFederation? federation;
  @override
  @HiveField(10)
  final UnifediApiInstanceUrls? urls;
  @override
  @HiveField(11)
  final UnifediApiInstanceStats? stats;
  @override
  @HiveField(12)
  final String uri;
  @override
  @HiveField(13)
  final String? title;
  @override
  @JsonKey(name: 'short_description')
  @HiveField(14)
  final String? shortDescription;
  @override
  @HiveField(15)
  final String? description;
  @override
  @HiveField(16)
  final String? email;
  @override
  @HiveField(17)
  final String? thumbnail;
  @override
  @HiveField(18)
  final List<String>? languages;
  @override
  @HiveField(19)
  final bool? registrations;
  @override
  @JsonKey(name: 'approval_required')
  @HiveField(20)
  final bool? approvalRequired;
  @override
  @JsonKey(name: 'invites_enabled')
  @HiveField(21)
  final bool? invitesEnabled;

  @override
  String toString() {
    return 'UnifediApiInstance(type: $type, versionString: $versionString, limits: $limits, vapidPublicKey: $vapidPublicKey, backgroundImage: $backgroundImage, contactAccount: $contactAccount, features: $features, postFormats: $postFormats, accountActivationRequired: $accountActivationRequired, federation: $federation, urls: $urls, stats: $stats, uri: $uri, title: $title, shortDescription: $shortDescription, description: $description, email: $email, thumbnail: $thumbnail, languages: $languages, registrations: $registrations, approvalRequired: $approvalRequired, invitesEnabled: $invitesEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiInstance &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.versionString, versionString) ||
                other.versionString == versionString) &&
            (identical(other.limits, limits) || other.limits == limits) &&
            (identical(other.vapidPublicKey, vapidPublicKey) ||
                other.vapidPublicKey == vapidPublicKey) &&
            (identical(other.backgroundImage, backgroundImage) ||
                other.backgroundImage == backgroundImage) &&
            (identical(other.contactAccount, contactAccount) ||
                other.contactAccount == contactAccount) &&
            const DeepCollectionEquality().equals(other.features, features) &&
            const DeepCollectionEquality()
                .equals(other.postFormats, postFormats) &&
            (identical(other.accountActivationRequired,
                    accountActivationRequired) ||
                other.accountActivationRequired == accountActivationRequired) &&
            (identical(other.federation, federation) ||
                other.federation == federation) &&
            (identical(other.urls, urls) || other.urls == urls) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            const DeepCollectionEquality().equals(other.languages, languages) &&
            (identical(other.registrations, registrations) ||
                other.registrations == registrations) &&
            (identical(other.approvalRequired, approvalRequired) ||
                other.approvalRequired == approvalRequired) &&
            (identical(other.invitesEnabled, invitesEnabled) ||
                other.invitesEnabled == invitesEnabled));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        type,
        versionString,
        limits,
        vapidPublicKey,
        backgroundImage,
        contactAccount,
        const DeepCollectionEquality().hash(features),
        const DeepCollectionEquality().hash(postFormats),
        accountActivationRequired,
        federation,
        urls,
        stats,
        uri,
        title,
        shortDescription,
        description,
        email,
        thumbnail,
        const DeepCollectionEquality().hash(languages),
        registrations,
        approvalRequired,
        invitesEnabled
      ]);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiInstanceCopyWith<_UnifediApiInstance> get copyWith =>
      __$UnifediApiInstanceCopyWithImpl<_UnifediApiInstance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstanceToJson(this);
  }
}

abstract class _UnifediApiInstance implements UnifediApiInstance {
  const factory _UnifediApiInstance(
      {@HiveField(0)
          required String type,
      @JsonKey(name: 'version')
      @HiveField(1)
          required String versionString,
      @HiveField(2)
          required UnifediApiInstanceLimits? limits,
      @JsonKey(name: 'vapid_public_key')
      @HiveField(3)
          required String? vapidPublicKey,
      @JsonKey(name: 'background_image')
      @HiveField(4)
          required String? backgroundImage,
      @JsonKey(name: 'contact_account')
      @HiveField(5)
          required UnifediApiAccount? contactAccount,
      @HiveField(6)
          required List<String>? features,
      @JsonKey(name: 'post_formats')
      @HiveField(7)
          required List<String>? postFormats,
      @HiveField(8)
      @JsonKey(name: 'account_activation')
          required bool? accountActivationRequired,
      @HiveField(9)
          required UnifediApiInstanceFederation? federation,
      @HiveField(10)
          required UnifediApiInstanceUrls? urls,
      @HiveField(11)
          required UnifediApiInstanceStats? stats,
      @HiveField(12)
          required String uri,
      @HiveField(13)
          required String? title,
      @JsonKey(name: 'short_description')
      @HiveField(14)
          required String? shortDescription,
      @HiveField(15)
          required String? description,
      @HiveField(16)
          required String? email,
      @HiveField(17)
          required String? thumbnail,
      @HiveField(18)
          required List<String>? languages,
      @HiveField(19)
          required bool? registrations,
      @JsonKey(name: 'approval_required')
      @HiveField(20)
          required bool? approvalRequired,
      @JsonKey(name: 'invites_enabled')
      @HiveField(21)
          required bool? invitesEnabled}) = _$_UnifediApiInstance;

  factory _UnifediApiInstance.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiInstance.fromJson;

  @override
  @HiveField(0)
  String get type;
  @override
  @JsonKey(name: 'version')
  @HiveField(1)
  String get versionString;
  @override
  @HiveField(2)
  UnifediApiInstanceLimits? get limits;
  @override
  @JsonKey(name: 'vapid_public_key')
  @HiveField(3)
  String? get vapidPublicKey;
  @override
  @JsonKey(name: 'background_image')
  @HiveField(4)
  String? get backgroundImage;
  @override
  @JsonKey(name: 'contact_account')
  @HiveField(5)
  UnifediApiAccount? get contactAccount;
  @override
  @HiveField(6)
  List<String>? get features;
  @override
  @JsonKey(name: 'post_formats')
  @HiveField(7)
  List<String>? get postFormats;
  @override
  @HiveField(8)
  @JsonKey(name: 'account_activation')
  bool? get accountActivationRequired;
  @override
  @HiveField(9)
  UnifediApiInstanceFederation? get federation;
  @override
  @HiveField(10)
  UnifediApiInstanceUrls? get urls;
  @override
  @HiveField(11)
  UnifediApiInstanceStats? get stats;
  @override
  @HiveField(12)
  String get uri;
  @override
  @HiveField(13)
  String? get title;
  @override
  @JsonKey(name: 'short_description')
  @HiveField(14)
  String? get shortDescription;
  @override
  @HiveField(15)
  String? get description;
  @override
  @HiveField(16)
  String? get email;
  @override
  @HiveField(17)
  String? get thumbnail;
  @override
  @HiveField(18)
  List<String>? get languages;
  @override
  @HiveField(19)
  bool? get registrations;
  @override
  @JsonKey(name: 'approval_required')
  @HiveField(20)
  bool? get approvalRequired;
  @override
  @JsonKey(name: 'invites_enabled')
  @HiveField(21)
  bool? get invitesEnabled;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiInstanceCopyWith<_UnifediApiInstance> get copyWith =>
      throw _privateConstructorUsedError;
}
