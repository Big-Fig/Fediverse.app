// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_instance_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiInstance _$MastodonApiInstanceFromJson(Map<String, dynamic> json) {
  return _MastodonApiInstance.fromJson(json);
}

/// @nodoc
class _$MastodonApiInstanceTearOff {
  const _$MastodonApiInstanceTearOff();

  _MastodonApiInstance call(
      {@HiveField(0)
          required String uri,
      @HiveField(1)
          required String? title,
      @JsonKey(name: 'short_description')
      @HiveField(2)
          required String? shortDescription,
      @HiveField(3)
          required String? description,
      @HiveField(4)
          required String? email,
      @JsonKey(name: 'version')
      @HiveField(5)
          required String versionString,
      @HiveField(6)
          required MastodonApiInstanceUrls? urls,
      @HiveField(7)
          required MastodonApiInstanceStats? stats,
      @HiveField(8)
          required String? thumbnail,
      @HiveField(9)
          required List<String>? languages,
      @HiveField(10)
          required bool? registrations,
      @HiveField(11)
          required bool? approvalRequired,
      @HiveField(12)
          required bool? invitesEnabled,
      @JsonKey(name: 'contact_account')
      @HiveField(13)
          required MastodonApiAccount? contactAccount}) {
    return _MastodonApiInstance(
      uri: uri,
      title: title,
      shortDescription: shortDescription,
      description: description,
      email: email,
      versionString: versionString,
      urls: urls,
      stats: stats,
      thumbnail: thumbnail,
      languages: languages,
      registrations: registrations,
      approvalRequired: approvalRequired,
      invitesEnabled: invitesEnabled,
      contactAccount: contactAccount,
    );
  }

  MastodonApiInstance fromJson(Map<String, Object?> json) {
    return MastodonApiInstance.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiInstance = _$MastodonApiInstanceTearOff();

/// @nodoc
mixin _$MastodonApiInstance {
  @HiveField(0)
  String get uri => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'short_description')
  @HiveField(2)
  String? get shortDescription => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'version')
  @HiveField(5)
  String get versionString => throw _privateConstructorUsedError;
  @HiveField(6)
  MastodonApiInstanceUrls? get urls => throw _privateConstructorUsedError;
  @HiveField(7)
  MastodonApiInstanceStats? get stats => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get thumbnail => throw _privateConstructorUsedError;
  @HiveField(9)
  List<String>? get languages => throw _privateConstructorUsedError;
  @HiveField(10)
  bool? get registrations => throw _privateConstructorUsedError;
  @HiveField(11)
  bool? get approvalRequired => throw _privateConstructorUsedError;
  @HiveField(12)
  bool? get invitesEnabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_account')
  @HiveField(13)
  MastodonApiAccount? get contactAccount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiInstanceCopyWith<MastodonApiInstance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiInstanceCopyWith<$Res> {
  factory $MastodonApiInstanceCopyWith(
          MastodonApiInstance value, $Res Function(MastodonApiInstance) then) =
      _$MastodonApiInstanceCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          String uri,
      @HiveField(1)
          String? title,
      @JsonKey(name: 'short_description')
      @HiveField(2)
          String? shortDescription,
      @HiveField(3)
          String? description,
      @HiveField(4)
          String? email,
      @JsonKey(name: 'version')
      @HiveField(5)
          String versionString,
      @HiveField(6)
          MastodonApiInstanceUrls? urls,
      @HiveField(7)
          MastodonApiInstanceStats? stats,
      @HiveField(8)
          String? thumbnail,
      @HiveField(9)
          List<String>? languages,
      @HiveField(10)
          bool? registrations,
      @HiveField(11)
          bool? approvalRequired,
      @HiveField(12)
          bool? invitesEnabled,
      @JsonKey(name: 'contact_account')
      @HiveField(13)
          MastodonApiAccount? contactAccount});

  $MastodonApiInstanceUrlsCopyWith<$Res>? get urls;
  $MastodonApiInstanceStatsCopyWith<$Res>? get stats;
  $MastodonApiAccountCopyWith<$Res>? get contactAccount;
}

/// @nodoc
class _$MastodonApiInstanceCopyWithImpl<$Res>
    implements $MastodonApiInstanceCopyWith<$Res> {
  _$MastodonApiInstanceCopyWithImpl(this._value, this._then);

  final MastodonApiInstance _value;
  // ignore: unused_field
  final $Res Function(MastodonApiInstance) _then;

  @override
  $Res call({
    Object? uri = freezed,
    Object? title = freezed,
    Object? shortDescription = freezed,
    Object? description = freezed,
    Object? email = freezed,
    Object? versionString = freezed,
    Object? urls = freezed,
    Object? stats = freezed,
    Object? thumbnail = freezed,
    Object? languages = freezed,
    Object? registrations = freezed,
    Object? approvalRequired = freezed,
    Object? invitesEnabled = freezed,
    Object? contactAccount = freezed,
  }) {
    return _then(_value.copyWith(
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
      versionString: versionString == freezed
          ? _value.versionString
          : versionString // ignore: cast_nullable_to_non_nullable
              as String,
      urls: urls == freezed
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as MastodonApiInstanceUrls?,
      stats: stats == freezed
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as MastodonApiInstanceStats?,
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
      contactAccount: contactAccount == freezed
          ? _value.contactAccount
          : contactAccount // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccount?,
    ));
  }

  @override
  $MastodonApiInstanceUrlsCopyWith<$Res>? get urls {
    if (_value.urls == null) {
      return null;
    }

    return $MastodonApiInstanceUrlsCopyWith<$Res>(_value.urls!, (value) {
      return _then(_value.copyWith(urls: value));
    });
  }

  @override
  $MastodonApiInstanceStatsCopyWith<$Res>? get stats {
    if (_value.stats == null) {
      return null;
    }

    return $MastodonApiInstanceStatsCopyWith<$Res>(_value.stats!, (value) {
      return _then(_value.copyWith(stats: value));
    });
  }

  @override
  $MastodonApiAccountCopyWith<$Res>? get contactAccount {
    if (_value.contactAccount == null) {
      return null;
    }

    return $MastodonApiAccountCopyWith<$Res>(_value.contactAccount!, (value) {
      return _then(_value.copyWith(contactAccount: value));
    });
  }
}

/// @nodoc
abstract class _$MastodonApiInstanceCopyWith<$Res>
    implements $MastodonApiInstanceCopyWith<$Res> {
  factory _$MastodonApiInstanceCopyWith(_MastodonApiInstance value,
          $Res Function(_MastodonApiInstance) then) =
      __$MastodonApiInstanceCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          String uri,
      @HiveField(1)
          String? title,
      @JsonKey(name: 'short_description')
      @HiveField(2)
          String? shortDescription,
      @HiveField(3)
          String? description,
      @HiveField(4)
          String? email,
      @JsonKey(name: 'version')
      @HiveField(5)
          String versionString,
      @HiveField(6)
          MastodonApiInstanceUrls? urls,
      @HiveField(7)
          MastodonApiInstanceStats? stats,
      @HiveField(8)
          String? thumbnail,
      @HiveField(9)
          List<String>? languages,
      @HiveField(10)
          bool? registrations,
      @HiveField(11)
          bool? approvalRequired,
      @HiveField(12)
          bool? invitesEnabled,
      @JsonKey(name: 'contact_account')
      @HiveField(13)
          MastodonApiAccount? contactAccount});

  @override
  $MastodonApiInstanceUrlsCopyWith<$Res>? get urls;
  @override
  $MastodonApiInstanceStatsCopyWith<$Res>? get stats;
  @override
  $MastodonApiAccountCopyWith<$Res>? get contactAccount;
}

/// @nodoc
class __$MastodonApiInstanceCopyWithImpl<$Res>
    extends _$MastodonApiInstanceCopyWithImpl<$Res>
    implements _$MastodonApiInstanceCopyWith<$Res> {
  __$MastodonApiInstanceCopyWithImpl(
      _MastodonApiInstance _value, $Res Function(_MastodonApiInstance) _then)
      : super(_value, (v) => _then(v as _MastodonApiInstance));

  @override
  _MastodonApiInstance get _value => super._value as _MastodonApiInstance;

  @override
  $Res call({
    Object? uri = freezed,
    Object? title = freezed,
    Object? shortDescription = freezed,
    Object? description = freezed,
    Object? email = freezed,
    Object? versionString = freezed,
    Object? urls = freezed,
    Object? stats = freezed,
    Object? thumbnail = freezed,
    Object? languages = freezed,
    Object? registrations = freezed,
    Object? approvalRequired = freezed,
    Object? invitesEnabled = freezed,
    Object? contactAccount = freezed,
  }) {
    return _then(_MastodonApiInstance(
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
      versionString: versionString == freezed
          ? _value.versionString
          : versionString // ignore: cast_nullable_to_non_nullable
              as String,
      urls: urls == freezed
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as MastodonApiInstanceUrls?,
      stats: stats == freezed
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as MastodonApiInstanceStats?,
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
      contactAccount: contactAccount == freezed
          ? _value.contactAccount
          : contactAccount // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccount?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiInstance implements _MastodonApiInstance {
  const _$_MastodonApiInstance(
      {@HiveField(0)
          required this.uri,
      @HiveField(1)
          required this.title,
      @JsonKey(name: 'short_description')
      @HiveField(2)
          required this.shortDescription,
      @HiveField(3)
          required this.description,
      @HiveField(4)
          required this.email,
      @JsonKey(name: 'version')
      @HiveField(5)
          required this.versionString,
      @HiveField(6)
          required this.urls,
      @HiveField(7)
          required this.stats,
      @HiveField(8)
          required this.thumbnail,
      @HiveField(9)
          required this.languages,
      @HiveField(10)
          required this.registrations,
      @HiveField(11)
          required this.approvalRequired,
      @HiveField(12)
          required this.invitesEnabled,
      @JsonKey(name: 'contact_account')
      @HiveField(13)
          required this.contactAccount});

  factory _$_MastodonApiInstance.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiInstanceFromJson(json);

  @override
  @HiveField(0)
  final String uri;
  @override
  @HiveField(1)
  final String? title;
  @override
  @JsonKey(name: 'short_description')
  @HiveField(2)
  final String? shortDescription;
  @override
  @HiveField(3)
  final String? description;
  @override
  @HiveField(4)
  final String? email;
  @override
  @JsonKey(name: 'version')
  @HiveField(5)
  final String versionString;
  @override
  @HiveField(6)
  final MastodonApiInstanceUrls? urls;
  @override
  @HiveField(7)
  final MastodonApiInstanceStats? stats;
  @override
  @HiveField(8)
  final String? thumbnail;
  @override
  @HiveField(9)
  final List<String>? languages;
  @override
  @HiveField(10)
  final bool? registrations;
  @override
  @HiveField(11)
  final bool? approvalRequired;
  @override
  @HiveField(12)
  final bool? invitesEnabled;
  @override
  @JsonKey(name: 'contact_account')
  @HiveField(13)
  final MastodonApiAccount? contactAccount;

  @override
  String toString() {
    return 'MastodonApiInstance(uri: $uri, title: $title, shortDescription: $shortDescription, description: $description, email: $email, versionString: $versionString, urls: $urls, stats: $stats, thumbnail: $thumbnail, languages: $languages, registrations: $registrations, approvalRequired: $approvalRequired, invitesEnabled: $invitesEnabled, contactAccount: $contactAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiInstance &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.versionString, versionString) ||
                other.versionString == versionString) &&
            (identical(other.urls, urls) || other.urls == urls) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            const DeepCollectionEquality().equals(other.languages, languages) &&
            (identical(other.registrations, registrations) ||
                other.registrations == registrations) &&
            (identical(other.approvalRequired, approvalRequired) ||
                other.approvalRequired == approvalRequired) &&
            (identical(other.invitesEnabled, invitesEnabled) ||
                other.invitesEnabled == invitesEnabled) &&
            (identical(other.contactAccount, contactAccount) ||
                other.contactAccount == contactAccount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      uri,
      title,
      shortDescription,
      description,
      email,
      versionString,
      urls,
      stats,
      thumbnail,
      const DeepCollectionEquality().hash(languages),
      registrations,
      approvalRequired,
      invitesEnabled,
      contactAccount);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiInstanceCopyWith<_MastodonApiInstance> get copyWith =>
      __$MastodonApiInstanceCopyWithImpl<_MastodonApiInstance>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiInstanceToJson(this);
  }
}

abstract class _MastodonApiInstance implements MastodonApiInstance {
  const factory _MastodonApiInstance(
          {@HiveField(0)
              required String uri,
          @HiveField(1)
              required String? title,
          @JsonKey(name: 'short_description')
          @HiveField(2)
              required String? shortDescription,
          @HiveField(3)
              required String? description,
          @HiveField(4)
              required String? email,
          @JsonKey(name: 'version')
          @HiveField(5)
              required String versionString,
          @HiveField(6)
              required MastodonApiInstanceUrls? urls,
          @HiveField(7)
              required MastodonApiInstanceStats? stats,
          @HiveField(8)
              required String? thumbnail,
          @HiveField(9)
              required List<String>? languages,
          @HiveField(10)
              required bool? registrations,
          @HiveField(11)
              required bool? approvalRequired,
          @HiveField(12)
              required bool? invitesEnabled,
          @JsonKey(name: 'contact_account')
          @HiveField(13)
              required MastodonApiAccount? contactAccount}) =
      _$_MastodonApiInstance;

  factory _MastodonApiInstance.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiInstance.fromJson;

  @override
  @HiveField(0)
  String get uri;
  @override
  @HiveField(1)
  String? get title;
  @override
  @JsonKey(name: 'short_description')
  @HiveField(2)
  String? get shortDescription;
  @override
  @HiveField(3)
  String? get description;
  @override
  @HiveField(4)
  String? get email;
  @override
  @JsonKey(name: 'version')
  @HiveField(5)
  String get versionString;
  @override
  @HiveField(6)
  MastodonApiInstanceUrls? get urls;
  @override
  @HiveField(7)
  MastodonApiInstanceStats? get stats;
  @override
  @HiveField(8)
  String? get thumbnail;
  @override
  @HiveField(9)
  List<String>? get languages;
  @override
  @HiveField(10)
  bool? get registrations;
  @override
  @HiveField(11)
  bool? get approvalRequired;
  @override
  @HiveField(12)
  bool? get invitesEnabled;
  @override
  @JsonKey(name: 'contact_account')
  @HiveField(13)
  MastodonApiAccount? get contactAccount;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiInstanceCopyWith<_MastodonApiInstance> get copyWith =>
      throw _privateConstructorUsedError;
}
