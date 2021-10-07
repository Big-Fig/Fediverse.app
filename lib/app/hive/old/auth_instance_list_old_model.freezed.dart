// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_instance_list_old_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthInstanceListOld _$AuthInstanceListOldFromJson(Map<String, dynamic> json) {
  return _AuthInstanceListOld.fromJson(json);
}

/// @nodoc
class _$AuthInstanceListOldTearOff {
  const _$AuthInstanceListOldTearOff();

  _AuthInstanceListOld call(
      {@HiveField(0) required List<AuthInstanceOld> instances}) {
    return _AuthInstanceListOld(
      instances: instances,
    );
  }

  AuthInstanceListOld fromJson(Map<String, Object> json) {
    return AuthInstanceListOld.fromJson(json);
  }
}

/// @nodoc
const $AuthInstanceListOld = _$AuthInstanceListOldTearOff();

/// @nodoc
mixin _$AuthInstanceListOld {
  @HiveField(0)
  List<AuthInstanceOld> get instances => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthInstanceListOldCopyWith<AuthInstanceListOld> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthInstanceListOldCopyWith<$Res> {
  factory $AuthInstanceListOldCopyWith(
          AuthInstanceListOld value, $Res Function(AuthInstanceListOld) then) =
      _$AuthInstanceListOldCopyWithImpl<$Res>;
  $Res call({@HiveField(0) List<AuthInstanceOld> instances});
}

/// @nodoc
class _$AuthInstanceListOldCopyWithImpl<$Res>
    implements $AuthInstanceListOldCopyWith<$Res> {
  _$AuthInstanceListOldCopyWithImpl(this._value, this._then);

  final AuthInstanceListOld _value;
  // ignore: unused_field
  final $Res Function(AuthInstanceListOld) _then;

  @override
  $Res call({
    Object? instances = freezed,
  }) {
    return _then(_value.copyWith(
      instances: instances == freezed
          ? _value.instances
          : instances // ignore: cast_nullable_to_non_nullable
              as List<AuthInstanceOld>,
    ));
  }
}

/// @nodoc
abstract class _$AuthInstanceListOldCopyWith<$Res>
    implements $AuthInstanceListOldCopyWith<$Res> {
  factory _$AuthInstanceListOldCopyWith(_AuthInstanceListOld value,
          $Res Function(_AuthInstanceListOld) then) =
      __$AuthInstanceListOldCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) List<AuthInstanceOld> instances});
}

/// @nodoc
class __$AuthInstanceListOldCopyWithImpl<$Res>
    extends _$AuthInstanceListOldCopyWithImpl<$Res>
    implements _$AuthInstanceListOldCopyWith<$Res> {
  __$AuthInstanceListOldCopyWithImpl(
      _AuthInstanceListOld _value, $Res Function(_AuthInstanceListOld) _then)
      : super(_value, (v) => _then(v as _AuthInstanceListOld));

  @override
  _AuthInstanceListOld get _value => super._value as _AuthInstanceListOld;

  @override
  $Res call({
    Object? instances = freezed,
  }) {
    return _then(_AuthInstanceListOld(
      instances: instances == freezed
          ? _value.instances
          : instances // ignore: cast_nullable_to_non_nullable
              as List<AuthInstanceOld>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthInstanceListOld
    with DiagnosticableTreeMixin
    implements _AuthInstanceListOld {
  const _$_AuthInstanceListOld({@HiveField(0) required this.instances});

  factory _$_AuthInstanceListOld.fromJson(Map<String, dynamic> json) =>
      _$$_AuthInstanceListOldFromJson(json);

  @override
  @HiveField(0)
  final List<AuthInstanceOld> instances;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthInstanceListOld(instances: $instances)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthInstanceListOld'))
      ..add(DiagnosticsProperty('instances', instances));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthInstanceListOld &&
            (identical(other.instances, instances) ||
                const DeepCollectionEquality()
                    .equals(other.instances, instances)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(instances);

  @JsonKey(ignore: true)
  @override
  _$AuthInstanceListOldCopyWith<_AuthInstanceListOld> get copyWith =>
      __$AuthInstanceListOldCopyWithImpl<_AuthInstanceListOld>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthInstanceListOldToJson(this);
  }
}

abstract class _AuthInstanceListOld implements AuthInstanceListOld {
  const factory _AuthInstanceListOld(
          {@HiveField(0) required List<AuthInstanceOld> instances}) =
      _$_AuthInstanceListOld;

  factory _AuthInstanceListOld.fromJson(Map<String, dynamic> json) =
      _$_AuthInstanceListOld.fromJson;

  @override
  @HiveField(0)
  List<AuthInstanceOld> get instances => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthInstanceListOldCopyWith<_AuthInstanceListOld> get copyWith =>
      throw _privateConstructorUsedError;
}
