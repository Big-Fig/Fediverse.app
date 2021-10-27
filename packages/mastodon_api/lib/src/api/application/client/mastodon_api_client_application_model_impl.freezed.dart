// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_client_application_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiClientApplication _$MastodonApiClientApplicationFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiClientApplication.fromJson(json);
}

/// @nodoc
class _$MastodonApiClientApplicationTearOff {
  const _$MastodonApiClientApplicationTearOff();

  _MastodonApiClientApplication call(
      {@HiveField(0)
          required String? name,
      @HiveField(1)
          required String? website,
      @JsonKey(name: 'vapid_key')
      @HiveField(2)
          required String? vapidKey,
      @JsonKey(name: 'client_id')
      @HiveField(3)
          required String clientId,
      @JsonKey(name: 'client_secret')
      @HiveField(4)
          required String clientSecret}) {
    return _MastodonApiClientApplication(
      name: name,
      website: website,
      vapidKey: vapidKey,
      clientId: clientId,
      clientSecret: clientSecret,
    );
  }

  MastodonApiClientApplication fromJson(Map<String, Object?> json) {
    return MastodonApiClientApplication.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiClientApplication = _$MastodonApiClientApplicationTearOff();

/// @nodoc
mixin _$MastodonApiClientApplication {
  @HiveField(0)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get website => throw _privateConstructorUsedError;
  @JsonKey(name: 'vapid_key')
  @HiveField(2)
  String? get vapidKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_id')
  @HiveField(3)
  String get clientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_secret')
  @HiveField(4)
  String get clientSecret => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiClientApplicationCopyWith<MastodonApiClientApplication>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiClientApplicationCopyWith<$Res> {
  factory $MastodonApiClientApplicationCopyWith(
          MastodonApiClientApplication value,
          $Res Function(MastodonApiClientApplication) then) =
      _$MastodonApiClientApplicationCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String? name,
      @HiveField(1) String? website,
      @JsonKey(name: 'vapid_key') @HiveField(2) String? vapidKey,
      @JsonKey(name: 'client_id') @HiveField(3) String clientId,
      @JsonKey(name: 'client_secret') @HiveField(4) String clientSecret});
}

/// @nodoc
class _$MastodonApiClientApplicationCopyWithImpl<$Res>
    implements $MastodonApiClientApplicationCopyWith<$Res> {
  _$MastodonApiClientApplicationCopyWithImpl(this._value, this._then);

  final MastodonApiClientApplication _value;
  // ignore: unused_field
  final $Res Function(MastodonApiClientApplication) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? website = freezed,
    Object? vapidKey = freezed,
    Object? clientId = freezed,
    Object? clientSecret = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      website: website == freezed
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      vapidKey: vapidKey == freezed
          ? _value.vapidKey
          : vapidKey // ignore: cast_nullable_to_non_nullable
              as String?,
      clientId: clientId == freezed
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      clientSecret: clientSecret == freezed
          ? _value.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MastodonApiClientApplicationCopyWith<$Res>
    implements $MastodonApiClientApplicationCopyWith<$Res> {
  factory _$MastodonApiClientApplicationCopyWith(
          _MastodonApiClientApplication value,
          $Res Function(_MastodonApiClientApplication) then) =
      __$MastodonApiClientApplicationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String? name,
      @HiveField(1) String? website,
      @JsonKey(name: 'vapid_key') @HiveField(2) String? vapidKey,
      @JsonKey(name: 'client_id') @HiveField(3) String clientId,
      @JsonKey(name: 'client_secret') @HiveField(4) String clientSecret});
}

/// @nodoc
class __$MastodonApiClientApplicationCopyWithImpl<$Res>
    extends _$MastodonApiClientApplicationCopyWithImpl<$Res>
    implements _$MastodonApiClientApplicationCopyWith<$Res> {
  __$MastodonApiClientApplicationCopyWithImpl(
      _MastodonApiClientApplication _value,
      $Res Function(_MastodonApiClientApplication) _then)
      : super(_value, (v) => _then(v as _MastodonApiClientApplication));

  @override
  _MastodonApiClientApplication get _value =>
      super._value as _MastodonApiClientApplication;

  @override
  $Res call({
    Object? name = freezed,
    Object? website = freezed,
    Object? vapidKey = freezed,
    Object? clientId = freezed,
    Object? clientSecret = freezed,
  }) {
    return _then(_MastodonApiClientApplication(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      website: website == freezed
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      vapidKey: vapidKey == freezed
          ? _value.vapidKey
          : vapidKey // ignore: cast_nullable_to_non_nullable
              as String?,
      clientId: clientId == freezed
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      clientSecret: clientSecret == freezed
          ? _value.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiClientApplication implements _MastodonApiClientApplication {
  const _$_MastodonApiClientApplication(
      {@HiveField(0)
          required this.name,
      @HiveField(1)
          required this.website,
      @JsonKey(name: 'vapid_key')
      @HiveField(2)
          required this.vapidKey,
      @JsonKey(name: 'client_id')
      @HiveField(3)
          required this.clientId,
      @JsonKey(name: 'client_secret')
      @HiveField(4)
          required this.clientSecret});

  factory _$_MastodonApiClientApplication.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiClientApplicationFromJson(json);

  @override
  @HiveField(0)
  final String? name;
  @override
  @HiveField(1)
  final String? website;
  @override
  @JsonKey(name: 'vapid_key')
  @HiveField(2)
  final String? vapidKey;
  @override
  @JsonKey(name: 'client_id')
  @HiveField(3)
  final String clientId;
  @override
  @JsonKey(name: 'client_secret')
  @HiveField(4)
  final String clientSecret;

  @override
  String toString() {
    return 'MastodonApiClientApplication(name: $name, website: $website, vapidKey: $vapidKey, clientId: $clientId, clientSecret: $clientSecret)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiClientApplication &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.vapidKey, vapidKey) ||
                other.vapidKey == vapidKey) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.clientSecret, clientSecret) ||
                other.clientSecret == clientSecret));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, website, vapidKey, clientId, clientSecret);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiClientApplicationCopyWith<_MastodonApiClientApplication>
      get copyWith => __$MastodonApiClientApplicationCopyWithImpl<
          _MastodonApiClientApplication>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiClientApplicationToJson(this);
  }
}

abstract class _MastodonApiClientApplication
    implements MastodonApiClientApplication {
  const factory _MastodonApiClientApplication(
      {@HiveField(0)
          required String? name,
      @HiveField(1)
          required String? website,
      @JsonKey(name: 'vapid_key')
      @HiveField(2)
          required String? vapidKey,
      @JsonKey(name: 'client_id')
      @HiveField(3)
          required String clientId,
      @JsonKey(name: 'client_secret')
      @HiveField(4)
          required String clientSecret}) = _$_MastodonApiClientApplication;

  factory _MastodonApiClientApplication.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiClientApplication.fromJson;

  @override
  @HiveField(0)
  String? get name;
  @override
  @HiveField(1)
  String? get website;
  @override
  @JsonKey(name: 'vapid_key')
  @HiveField(2)
  String? get vapidKey;
  @override
  @JsonKey(name: 'client_id')
  @HiveField(3)
  String get clientId;
  @override
  @JsonKey(name: 'client_secret')
  @HiveField(4)
  String get clientSecret;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiClientApplicationCopyWith<_MastodonApiClientApplication>
      get copyWith => throw _privateConstructorUsedError;
}
