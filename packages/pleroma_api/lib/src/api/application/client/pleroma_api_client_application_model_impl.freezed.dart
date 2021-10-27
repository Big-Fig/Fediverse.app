// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_client_application_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiClientApplication _$PleromaApiClientApplicationFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiClientApplication.fromJson(json);
}

/// @nodoc
class _$PleromaApiClientApplicationTearOff {
  const _$PleromaApiClientApplicationTearOff();

  _PleromaApiClientApplication call(
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
    return _PleromaApiClientApplication(
      name: name,
      website: website,
      vapidKey: vapidKey,
      clientId: clientId,
      clientSecret: clientSecret,
    );
  }

  PleromaApiClientApplication fromJson(Map<String, Object?> json) {
    return PleromaApiClientApplication.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiClientApplication = _$PleromaApiClientApplicationTearOff();

/// @nodoc
mixin _$PleromaApiClientApplication {
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
  $PleromaApiClientApplicationCopyWith<PleromaApiClientApplication>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiClientApplicationCopyWith<$Res> {
  factory $PleromaApiClientApplicationCopyWith(
          PleromaApiClientApplication value,
          $Res Function(PleromaApiClientApplication) then) =
      _$PleromaApiClientApplicationCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String? name,
      @HiveField(1) String? website,
      @JsonKey(name: 'vapid_key') @HiveField(2) String? vapidKey,
      @JsonKey(name: 'client_id') @HiveField(3) String clientId,
      @JsonKey(name: 'client_secret') @HiveField(4) String clientSecret});
}

/// @nodoc
class _$PleromaApiClientApplicationCopyWithImpl<$Res>
    implements $PleromaApiClientApplicationCopyWith<$Res> {
  _$PleromaApiClientApplicationCopyWithImpl(this._value, this._then);

  final PleromaApiClientApplication _value;
  // ignore: unused_field
  final $Res Function(PleromaApiClientApplication) _then;

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
abstract class _$PleromaApiClientApplicationCopyWith<$Res>
    implements $PleromaApiClientApplicationCopyWith<$Res> {
  factory _$PleromaApiClientApplicationCopyWith(
          _PleromaApiClientApplication value,
          $Res Function(_PleromaApiClientApplication) then) =
      __$PleromaApiClientApplicationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String? name,
      @HiveField(1) String? website,
      @JsonKey(name: 'vapid_key') @HiveField(2) String? vapidKey,
      @JsonKey(name: 'client_id') @HiveField(3) String clientId,
      @JsonKey(name: 'client_secret') @HiveField(4) String clientSecret});
}

/// @nodoc
class __$PleromaApiClientApplicationCopyWithImpl<$Res>
    extends _$PleromaApiClientApplicationCopyWithImpl<$Res>
    implements _$PleromaApiClientApplicationCopyWith<$Res> {
  __$PleromaApiClientApplicationCopyWithImpl(
      _PleromaApiClientApplication _value,
      $Res Function(_PleromaApiClientApplication) _then)
      : super(_value, (v) => _then(v as _PleromaApiClientApplication));

  @override
  _PleromaApiClientApplication get _value =>
      super._value as _PleromaApiClientApplication;

  @override
  $Res call({
    Object? name = freezed,
    Object? website = freezed,
    Object? vapidKey = freezed,
    Object? clientId = freezed,
    Object? clientSecret = freezed,
  }) {
    return _then(_PleromaApiClientApplication(
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
class _$_PleromaApiClientApplication implements _PleromaApiClientApplication {
  const _$_PleromaApiClientApplication(
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

  factory _$_PleromaApiClientApplication.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiClientApplicationFromJson(json);

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
    return 'PleromaApiClientApplication(name: $name, website: $website, vapidKey: $vapidKey, clientId: $clientId, clientSecret: $clientSecret)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiClientApplication &&
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
  _$PleromaApiClientApplicationCopyWith<_PleromaApiClientApplication>
      get copyWith => __$PleromaApiClientApplicationCopyWithImpl<
          _PleromaApiClientApplication>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiClientApplicationToJson(this);
  }
}

abstract class _PleromaApiClientApplication
    implements PleromaApiClientApplication {
  const factory _PleromaApiClientApplication(
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
          required String clientSecret}) = _$_PleromaApiClientApplication;

  factory _PleromaApiClientApplication.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiClientApplication.fromJson;

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
  _$PleromaApiClientApplicationCopyWith<_PleromaApiClientApplication>
      get copyWith => throw _privateConstructorUsedError;
}
