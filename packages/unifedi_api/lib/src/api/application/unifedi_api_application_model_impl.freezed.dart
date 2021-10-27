// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_application_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiApplication _$UnifediApiApplicationFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiApplication.fromJson(json);
}

/// @nodoc
class _$UnifediApiApplicationTearOff {
  const _$UnifediApiApplicationTearOff();

  _UnifediApiApplication call(
      {@HiveField(3) required String? name,
      @HiveField(4) required String? website,
      @JsonKey(name: 'vapid_key') @HiveField(2) required String? vapidKey}) {
    return _UnifediApiApplication(
      name: name,
      website: website,
      vapidKey: vapidKey,
    );
  }

  UnifediApiApplication fromJson(Map<String, Object?> json) {
    return UnifediApiApplication.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiApplication = _$UnifediApiApplicationTearOff();

/// @nodoc
mixin _$UnifediApiApplication {
  @HiveField(3)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get website => throw _privateConstructorUsedError;
  @JsonKey(name: 'vapid_key')
  @HiveField(2)
  String? get vapidKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiApplicationCopyWith<UnifediApiApplication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiApplicationCopyWith<$Res> {
  factory $UnifediApiApplicationCopyWith(UnifediApiApplication value,
          $Res Function(UnifediApiApplication) then) =
      _$UnifediApiApplicationCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(3) String? name,
      @HiveField(4) String? website,
      @JsonKey(name: 'vapid_key') @HiveField(2) String? vapidKey});
}

/// @nodoc
class _$UnifediApiApplicationCopyWithImpl<$Res>
    implements $UnifediApiApplicationCopyWith<$Res> {
  _$UnifediApiApplicationCopyWithImpl(this._value, this._then);

  final UnifediApiApplication _value;
  // ignore: unused_field
  final $Res Function(UnifediApiApplication) _then;

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
abstract class _$UnifediApiApplicationCopyWith<$Res>
    implements $UnifediApiApplicationCopyWith<$Res> {
  factory _$UnifediApiApplicationCopyWith(_UnifediApiApplication value,
          $Res Function(_UnifediApiApplication) then) =
      __$UnifediApiApplicationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(3) String? name,
      @HiveField(4) String? website,
      @JsonKey(name: 'vapid_key') @HiveField(2) String? vapidKey});
}

/// @nodoc
class __$UnifediApiApplicationCopyWithImpl<$Res>
    extends _$UnifediApiApplicationCopyWithImpl<$Res>
    implements _$UnifediApiApplicationCopyWith<$Res> {
  __$UnifediApiApplicationCopyWithImpl(_UnifediApiApplication _value,
      $Res Function(_UnifediApiApplication) _then)
      : super(_value, (v) => _then(v as _UnifediApiApplication));

  @override
  _UnifediApiApplication get _value => super._value as _UnifediApiApplication;

  @override
  $Res call({
    Object? name = freezed,
    Object? website = freezed,
    Object? vapidKey = freezed,
  }) {
    return _then(_UnifediApiApplication(
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
class _$_UnifediApiApplication implements _UnifediApiApplication {
  const _$_UnifediApiApplication(
      {@HiveField(3) required this.name,
      @HiveField(4) required this.website,
      @JsonKey(name: 'vapid_key') @HiveField(2) required this.vapidKey});

  factory _$_UnifediApiApplication.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiApplicationFromJson(json);

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
    return 'UnifediApiApplication(name: $name, website: $website, vapidKey: $vapidKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiApplication &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.vapidKey, vapidKey) ||
                other.vapidKey == vapidKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, website, vapidKey);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiApplicationCopyWith<_UnifediApiApplication> get copyWith =>
      __$UnifediApiApplicationCopyWithImpl<_UnifediApiApplication>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiApplicationToJson(this);
  }
}

abstract class _UnifediApiApplication implements UnifediApiApplication {
  const factory _UnifediApiApplication(
      {@HiveField(3)
          required String? name,
      @HiveField(4)
          required String? website,
      @JsonKey(name: 'vapid_key')
      @HiveField(2)
          required String? vapidKey}) = _$_UnifediApiApplication;

  factory _UnifediApiApplication.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiApplication.fromJson;

  @override
  @HiveField(3)
  String? get name;
  @override
  @HiveField(4)
  String? get website;
  @override
  @JsonKey(name: 'vapid_key')
  @HiveField(2)
  String? get vapidKey;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiApplicationCopyWith<_UnifediApiApplication> get copyWith =>
      throw _privateConstructorUsedError;
}
