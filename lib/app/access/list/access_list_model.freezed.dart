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

UnifediApiAccessList _$UnifediApiAccessListFromJson(Map<String, dynamic> json) {
  return _UnifediApiAccessList.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessListTearOff {
  const _$UnifediApiAccessListTearOff();

  _UnifediApiAccessList call(
      {@HiveField(0) required List<UnifediApiAccess> instances}) {
    return _UnifediApiAccessList(
      instances: instances,
    );
  }

  UnifediApiAccessList fromJson(Map<String, Object> json) {
    return UnifediApiAccessList.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccessList = _$UnifediApiAccessListTearOff();

/// @nodoc
mixin _$UnifediApiAccessList {
  @HiveField(0)
  List<UnifediApiAccess> get instances => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessListCopyWith<UnifediApiAccessList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessListCopyWith<$Res> {
  factory $UnifediApiAccessListCopyWith(UnifediApiAccessList value,
          $Res Function(UnifediApiAccessList) then) =
      _$UnifediApiAccessListCopyWithImpl<$Res>;
  $Res call({@HiveField(0) List<UnifediApiAccess> instances});
}

/// @nodoc
class _$UnifediApiAccessListCopyWithImpl<$Res>
    implements $UnifediApiAccessListCopyWith<$Res> {
  _$UnifediApiAccessListCopyWithImpl(this._value, this._then);

  final UnifediApiAccessList _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccessList) _then;

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
abstract class _$UnifediApiAccessListCopyWith<$Res>
    implements $UnifediApiAccessListCopyWith<$Res> {
  factory _$UnifediApiAccessListCopyWith(_UnifediApiAccessList value,
          $Res Function(_UnifediApiAccessList) then) =
      __$UnifediApiAccessListCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) List<UnifediApiAccess> instances});
}

/// @nodoc
class __$UnifediApiAccessListCopyWithImpl<$Res>
    extends _$UnifediApiAccessListCopyWithImpl<$Res>
    implements _$UnifediApiAccessListCopyWith<$Res> {
  __$UnifediApiAccessListCopyWithImpl(
      _UnifediApiAccessList _value, $Res Function(_UnifediApiAccessList) _then)
      : super(_value, (v) => _then(v as _UnifediApiAccessList));

  @override
  _UnifediApiAccessList get _value => super._value as _UnifediApiAccessList;

  @override
  $Res call({
    Object? instances = freezed,
  }) {
    return _then(_UnifediApiAccessList(
      instances: instances == freezed
          ? _value.instances
          : instances // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiAccess>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccessList implements _UnifediApiAccessList {
  const _$_UnifediApiAccessList({@HiveField(0) required this.instances});

  factory _$_UnifediApiAccessList.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiAccessListFromJson(json);

  @override
  @HiveField(0)
  final List<UnifediApiAccess> instances;

  @override
  String toString() {
    return 'UnifediApiAccessList(instances: $instances)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiAccessList &&
            (identical(other.instances, instances) ||
                const DeepCollectionEquality()
                    .equals(other.instances, instances)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(instances);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccessListCopyWith<_UnifediApiAccessList> get copyWith =>
      __$UnifediApiAccessListCopyWithImpl<_UnifediApiAccessList>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessListToJson(this);
  }
}

abstract class _UnifediApiAccessList implements UnifediApiAccessList {
  const factory _UnifediApiAccessList(
          {@HiveField(0) required List<UnifediApiAccess> instances}) =
      _$_UnifediApiAccessList;

  factory _UnifediApiAccessList.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiAccessList.fromJson;

  @override
  @HiveField(0)
  List<UnifediApiAccess> get instances => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessListCopyWith<_UnifediApiAccessList> get copyWith =>
      throw _privateConstructorUsedError;
}
