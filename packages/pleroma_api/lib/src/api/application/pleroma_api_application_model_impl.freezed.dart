// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_application_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiApplication _$PleromaApiApplicationFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiApplication.fromJson(json);
}

/// @nodoc
class _$PleromaApiApplicationTearOff {
  const _$PleromaApiApplicationTearOff();

  _PleromaApiApplication call(
      {@HiveField(3) required String? name,
      @HiveField(4) required String? website,
      @JsonKey(name: 'vapid_key') @HiveField(2) required String? vapidKey}) {
    return _PleromaApiApplication(
      name: name,
      website: website,
      vapidKey: vapidKey,
    );
  }

  PleromaApiApplication fromJson(Map<String, Object?> json) {
    return PleromaApiApplication.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiApplication = _$PleromaApiApplicationTearOff();

/// @nodoc
mixin _$PleromaApiApplication {
  @HiveField(3)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get website => throw _privateConstructorUsedError;
  @JsonKey(name: 'vapid_key')
  @HiveField(2)
  String? get vapidKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiApplicationCopyWith<PleromaApiApplication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiApplicationCopyWith<$Res> {
  factory $PleromaApiApplicationCopyWith(PleromaApiApplication value,
          $Res Function(PleromaApiApplication) then) =
      _$PleromaApiApplicationCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(3) String? name,
      @HiveField(4) String? website,
      @JsonKey(name: 'vapid_key') @HiveField(2) String? vapidKey});
}

/// @nodoc
class _$PleromaApiApplicationCopyWithImpl<$Res>
    implements $PleromaApiApplicationCopyWith<$Res> {
  _$PleromaApiApplicationCopyWithImpl(this._value, this._then);

  final PleromaApiApplication _value;
  // ignore: unused_field
  final $Res Function(PleromaApiApplication) _then;

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
abstract class _$PleromaApiApplicationCopyWith<$Res>
    implements $PleromaApiApplicationCopyWith<$Res> {
  factory _$PleromaApiApplicationCopyWith(_PleromaApiApplication value,
          $Res Function(_PleromaApiApplication) then) =
      __$PleromaApiApplicationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(3) String? name,
      @HiveField(4) String? website,
      @JsonKey(name: 'vapid_key') @HiveField(2) String? vapidKey});
}

/// @nodoc
class __$PleromaApiApplicationCopyWithImpl<$Res>
    extends _$PleromaApiApplicationCopyWithImpl<$Res>
    implements _$PleromaApiApplicationCopyWith<$Res> {
  __$PleromaApiApplicationCopyWithImpl(_PleromaApiApplication _value,
      $Res Function(_PleromaApiApplication) _then)
      : super(_value, (v) => _then(v as _PleromaApiApplication));

  @override
  _PleromaApiApplication get _value => super._value as _PleromaApiApplication;

  @override
  $Res call({
    Object? name = freezed,
    Object? website = freezed,
    Object? vapidKey = freezed,
  }) {
    return _then(_PleromaApiApplication(
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
class _$_PleromaApiApplication implements _PleromaApiApplication {
  const _$_PleromaApiApplication(
      {@HiveField(3) required this.name,
      @HiveField(4) required this.website,
      @JsonKey(name: 'vapid_key') @HiveField(2) required this.vapidKey});

  factory _$_PleromaApiApplication.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiApplicationFromJson(json);

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
    return 'PleromaApiApplication(name: $name, website: $website, vapidKey: $vapidKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiApplication &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.vapidKey, vapidKey) ||
                other.vapidKey == vapidKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, website, vapidKey);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiApplicationCopyWith<_PleromaApiApplication> get copyWith =>
      __$PleromaApiApplicationCopyWithImpl<_PleromaApiApplication>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiApplicationToJson(this);
  }
}

abstract class _PleromaApiApplication implements PleromaApiApplication {
  const factory _PleromaApiApplication(
      {@HiveField(3)
          required String? name,
      @HiveField(4)
          required String? website,
      @JsonKey(name: 'vapid_key')
      @HiveField(2)
          required String? vapidKey}) = _$_PleromaApiApplication;

  factory _PleromaApiApplication.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiApplication.fromJson;

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
  _$PleromaApiApplicationCopyWith<_PleromaApiApplication> get copyWith =>
      throw _privateConstructorUsedError;
}
