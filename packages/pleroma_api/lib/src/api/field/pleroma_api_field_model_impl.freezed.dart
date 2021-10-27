// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_field_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiField _$PleromaApiFieldFromJson(Map<String, dynamic> json) {
  return _PleromaApiField.fromJson(json);
}

/// @nodoc
class _$PleromaApiFieldTearOff {
  const _$PleromaApiFieldTearOff();

  _PleromaApiField call(
      {@HiveField(0)
          required String? name,
      @HiveField(1)
          required String? value,
      @HiveField(2)
      @JsonKey(name: 'verified_at')
          required DateTime? verifiedAt}) {
    return _PleromaApiField(
      name: name,
      value: value,
      verifiedAt: verifiedAt,
    );
  }

  PleromaApiField fromJson(Map<String, Object?> json) {
    return PleromaApiField.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiField = _$PleromaApiFieldTearOff();

/// @nodoc
mixin _$PleromaApiField {
  @HiveField(0)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get value => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'verified_at')
  DateTime? get verifiedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiFieldCopyWith<PleromaApiField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiFieldCopyWith<$Res> {
  factory $PleromaApiFieldCopyWith(
          PleromaApiField value, $Res Function(PleromaApiField) then) =
      _$PleromaApiFieldCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String? name,
      @HiveField(1) String? value,
      @HiveField(2) @JsonKey(name: 'verified_at') DateTime? verifiedAt});
}

/// @nodoc
class _$PleromaApiFieldCopyWithImpl<$Res>
    implements $PleromaApiFieldCopyWith<$Res> {
  _$PleromaApiFieldCopyWithImpl(this._value, this._then);

  final PleromaApiField _value;
  // ignore: unused_field
  final $Res Function(PleromaApiField) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? value = freezed,
    Object? verifiedAt = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedAt: verifiedAt == freezed
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiFieldCopyWith<$Res>
    implements $PleromaApiFieldCopyWith<$Res> {
  factory _$PleromaApiFieldCopyWith(
          _PleromaApiField value, $Res Function(_PleromaApiField) then) =
      __$PleromaApiFieldCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String? name,
      @HiveField(1) String? value,
      @HiveField(2) @JsonKey(name: 'verified_at') DateTime? verifiedAt});
}

/// @nodoc
class __$PleromaApiFieldCopyWithImpl<$Res>
    extends _$PleromaApiFieldCopyWithImpl<$Res>
    implements _$PleromaApiFieldCopyWith<$Res> {
  __$PleromaApiFieldCopyWithImpl(
      _PleromaApiField _value, $Res Function(_PleromaApiField) _then)
      : super(_value, (v) => _then(v as _PleromaApiField));

  @override
  _PleromaApiField get _value => super._value as _PleromaApiField;

  @override
  $Res call({
    Object? name = freezed,
    Object? value = freezed,
    Object? verifiedAt = freezed,
  }) {
    return _then(_PleromaApiField(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedAt: verifiedAt == freezed
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiField implements _PleromaApiField {
  const _$_PleromaApiField(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.value,
      @HiveField(2) @JsonKey(name: 'verified_at') required this.verifiedAt});

  factory _$_PleromaApiField.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiFieldFromJson(json);

  @override
  @HiveField(0)
  final String? name;
  @override
  @HiveField(1)
  final String? value;
  @override
  @HiveField(2)
  @JsonKey(name: 'verified_at')
  final DateTime? verifiedAt;

  @override
  String toString() {
    return 'PleromaApiField(name: $name, value: $value, verifiedAt: $verifiedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiField &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, value, verifiedAt);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiFieldCopyWith<_PleromaApiField> get copyWith =>
      __$PleromaApiFieldCopyWithImpl<_PleromaApiField>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiFieldToJson(this);
  }
}

abstract class _PleromaApiField implements PleromaApiField {
  const factory _PleromaApiField(
      {@HiveField(0)
          required String? name,
      @HiveField(1)
          required String? value,
      @HiveField(2)
      @JsonKey(name: 'verified_at')
          required DateTime? verifiedAt}) = _$_PleromaApiField;

  factory _PleromaApiField.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiField.fromJson;

  @override
  @HiveField(0)
  String? get name;
  @override
  @HiveField(1)
  String? get value;
  @override
  @HiveField(2)
  @JsonKey(name: 'verified_at')
  DateTime? get verifiedAt;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiFieldCopyWith<_PleromaApiField> get copyWith =>
      throw _privateConstructorUsedError;
}
