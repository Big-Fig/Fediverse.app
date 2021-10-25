// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'access_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccessList _$AccessListFromJson(Map<String, dynamic> json) {
  return _AccessList.fromJson(json);
}

/// @nodoc
class _$AccessListTearOff {
  const _$AccessListTearOff();

  _AccessList call({@HiveField(0) required List<UnifediApiAccess> instances}) {
    return _AccessList(
      instances: instances,
    );
  }

  AccessList fromJson(Map<String, Object> json) {
    return AccessList.fromJson(json);
  }
}

/// @nodoc
const $AccessList = _$AccessListTearOff();

/// @nodoc
mixin _$AccessList {
  @HiveField(0)
  List<UnifediApiAccess> get instances => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccessListCopyWith<AccessList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessListCopyWith<$Res> {
  factory $AccessListCopyWith(
          AccessList value, $Res Function(AccessList) then) =
      _$AccessListCopyWithImpl<$Res>;
  $Res call({@HiveField(0) List<UnifediApiAccess> instances});
}

/// @nodoc
class _$AccessListCopyWithImpl<$Res> implements $AccessListCopyWith<$Res> {
  _$AccessListCopyWithImpl(this._value, this._then);

  final AccessList _value;
  // ignore: unused_field
  final $Res Function(AccessList) _then;

  @override
  $Res call({
    Object? instances = freezed,
  }) {
    return _then(_value.copyWith(
      instances: instances == freezed
          ? _value.instances
          : instances // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiAccess>,
    ));
  }
}

/// @nodoc
abstract class _$AccessListCopyWith<$Res> implements $AccessListCopyWith<$Res> {
  factory _$AccessListCopyWith(
          _AccessList value, $Res Function(_AccessList) then) =
      __$AccessListCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) List<UnifediApiAccess> instances});
}

/// @nodoc
class __$AccessListCopyWithImpl<$Res> extends _$AccessListCopyWithImpl<$Res>
    implements _$AccessListCopyWith<$Res> {
  __$AccessListCopyWithImpl(
      _AccessList _value, $Res Function(_AccessList) _then)
      : super(_value, (v) => _then(v as _AccessList));

  @override
  _AccessList get _value => super._value as _AccessList;

  @override
  $Res call({
    Object? instances = freezed,
  }) {
    return _then(_AccessList(
      instances: instances == freezed
          ? _value.instances
          : instances // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiAccess>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccessList implements _AccessList {
  const _$_AccessList({@HiveField(0) required this.instances});

  factory _$_AccessList.fromJson(Map<String, dynamic> json) =>
      _$$_AccessListFromJson(json);

  @override
  @HiveField(0)
  final List<UnifediApiAccess> instances;

  @override
  String toString() {
    return 'AccessList(instances: $instances)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AccessList &&
            (identical(other.instances, instances) ||
                const DeepCollectionEquality()
                    .equals(other.instances, instances)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(instances);

  @JsonKey(ignore: true)
  @override
  _$AccessListCopyWith<_AccessList> get copyWith =>
      __$AccessListCopyWithImpl<_AccessList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccessListToJson(this);
  }
}

abstract class _AccessList implements AccessList {
  const factory _AccessList(
          {@HiveField(0) required List<UnifediApiAccess> instances}) =
      _$_AccessList;

  factory _AccessList.fromJson(Map<String, dynamic> json) =
      _$_AccessList.fromJson;

  @override
  @HiveField(0)
  List<UnifediApiAccess> get instances => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AccessListCopyWith<_AccessList> get copyWith =>
      throw _privateConstructorUsedError;
}
