// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_application_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiApplication _$MastodonApiApplicationFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiApplication.fromJson(json);
}

/// @nodoc
class _$MastodonApiApplicationTearOff {
  const _$MastodonApiApplicationTearOff();

  _MastodonApiApplication call(
      {@HiveField(3) required String? name,
      @HiveField(4) required String? website,
      @JsonKey(name: 'vapid_key') @HiveField(2) required String? vapidKey}) {
    return _MastodonApiApplication(
      name: name,
      website: website,
      vapidKey: vapidKey,
    );
  }

  MastodonApiApplication fromJson(Map<String, Object> json) {
    return MastodonApiApplication.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiApplication = _$MastodonApiApplicationTearOff();

/// @nodoc
mixin _$MastodonApiApplication {
  @HiveField(3)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get website => throw _privateConstructorUsedError;
  @JsonKey(name: 'vapid_key')
  @HiveField(2)
  String? get vapidKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiApplicationCopyWith<MastodonApiApplication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiApplicationCopyWith<$Res> {
  factory $MastodonApiApplicationCopyWith(MastodonApiApplication value,
          $Res Function(MastodonApiApplication) then) =
      _$MastodonApiApplicationCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(3) String? name,
      @HiveField(4) String? website,
      @JsonKey(name: 'vapid_key') @HiveField(2) String? vapidKey});
}

/// @nodoc
class _$MastodonApiApplicationCopyWithImpl<$Res>
    implements $MastodonApiApplicationCopyWith<$Res> {
  _$MastodonApiApplicationCopyWithImpl(this._value, this._then);

  final MastodonApiApplication _value;
  // ignore: unused_field
  final $Res Function(MastodonApiApplication) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? website = freezed,
    Object? vapidKey = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$MastodonApiApplicationCopyWith<$Res>
    implements $MastodonApiApplicationCopyWith<$Res> {
  factory _$MastodonApiApplicationCopyWith(_MastodonApiApplication value,
          $Res Function(_MastodonApiApplication) then) =
      __$MastodonApiApplicationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(3) String? name,
      @HiveField(4) String? website,
      @JsonKey(name: 'vapid_key') @HiveField(2) String? vapidKey});
}

/// @nodoc
class __$MastodonApiApplicationCopyWithImpl<$Res>
    extends _$MastodonApiApplicationCopyWithImpl<$Res>
    implements _$MastodonApiApplicationCopyWith<$Res> {
  __$MastodonApiApplicationCopyWithImpl(_MastodonApiApplication _value,
      $Res Function(_MastodonApiApplication) _then)
      : super(_value, (v) => _then(v as _MastodonApiApplication));

  @override
  _MastodonApiApplication get _value => super._value as _MastodonApiApplication;

  @override
  $Res call({
    Object? name = freezed,
    Object? website = freezed,
    Object? vapidKey = freezed,
  }) {
    return _then(_MastodonApiApplication(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiApplication implements _MastodonApiApplication {
  const _$_MastodonApiApplication(
      {@HiveField(3) required this.name,
      @HiveField(4) required this.website,
      @JsonKey(name: 'vapid_key') @HiveField(2) required this.vapidKey});

  factory _$_MastodonApiApplication.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiApplicationFromJson(json);

  @override
  @HiveField(3)
  final String? name;
  @override
  @HiveField(4)
  final String? website;
  @override
  @JsonKey(name: 'vapid_key')
  @HiveField(2)
  final String? vapidKey;

  @override
  String toString() {
    return 'MastodonApiApplication(name: $name, website: $website, vapidKey: $vapidKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiApplication &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.website, website) ||
                const DeepCollectionEquality()
                    .equals(other.website, website)) &&
            (identical(other.vapidKey, vapidKey) ||
                const DeepCollectionEquality()
                    .equals(other.vapidKey, vapidKey)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(website) ^
      const DeepCollectionEquality().hash(vapidKey);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiApplicationCopyWith<_MastodonApiApplication> get copyWith =>
      __$MastodonApiApplicationCopyWithImpl<_MastodonApiApplication>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiApplicationToJson(this);
  }
}

abstract class _MastodonApiApplication implements MastodonApiApplication {
  const factory _MastodonApiApplication(
      {@HiveField(3)
          required String? name,
      @HiveField(4)
          required String? website,
      @JsonKey(name: 'vapid_key')
      @HiveField(2)
          required String? vapidKey}) = _$_MastodonApiApplication;

  factory _MastodonApiApplication.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiApplication.fromJson;

  @override
  @HiveField(3)
  String? get name => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  String? get website => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'vapid_key')
  @HiveField(2)
  String? get vapidKey => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiApplicationCopyWith<_MastodonApiApplication> get copyWith =>
      throw _privateConstructorUsedError;
}
