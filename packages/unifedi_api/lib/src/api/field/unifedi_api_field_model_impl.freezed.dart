// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_field_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiField _$UnifediApiFieldFromJson(Map<String, dynamic> json) {
  return _UnifediApiField.fromJson(json);
}

/// @nodoc
class _$UnifediApiFieldTearOff {
  const _$UnifediApiFieldTearOff();

  _UnifediApiField call(
      {@HiveField(0)
          required String? name,
      @HiveField(1)
          required String? value,
      @HiveField(2)
      @JsonKey(name: 'verified_at')
          required DateTime? verifiedAt}) {
    return _UnifediApiField(
      name: name,
      value: value,
      verifiedAt: verifiedAt,
    );
  }

  UnifediApiField fromJson(Map<String, Object> json) {
    return UnifediApiField.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiField = _$UnifediApiFieldTearOff();

/// @nodoc
mixin _$UnifediApiField {
  @HiveField(0)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get value => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'verified_at')
  DateTime? get verifiedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiFieldCopyWith<UnifediApiField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiFieldCopyWith<$Res> {
  factory $UnifediApiFieldCopyWith(
          UnifediApiField value, $Res Function(UnifediApiField) then) =
      _$UnifediApiFieldCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String? name,
      @HiveField(1) String? value,
      @HiveField(2) @JsonKey(name: 'verified_at') DateTime? verifiedAt});
}

/// @nodoc
class _$UnifediApiFieldCopyWithImpl<$Res>
    implements $UnifediApiFieldCopyWith<$Res> {
  _$UnifediApiFieldCopyWithImpl(this._value, this._then);

  final UnifediApiField _value;
  // ignore: unused_field
  final $Res Function(UnifediApiField) _then;

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
abstract class _$UnifediApiFieldCopyWith<$Res>
    implements $UnifediApiFieldCopyWith<$Res> {
  factory _$UnifediApiFieldCopyWith(
          _UnifediApiField value, $Res Function(_UnifediApiField) then) =
      __$UnifediApiFieldCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String? name,
      @HiveField(1) String? value,
      @HiveField(2) @JsonKey(name: 'verified_at') DateTime? verifiedAt});
}

/// @nodoc
class __$UnifediApiFieldCopyWithImpl<$Res>
    extends _$UnifediApiFieldCopyWithImpl<$Res>
    implements _$UnifediApiFieldCopyWith<$Res> {
  __$UnifediApiFieldCopyWithImpl(
      _UnifediApiField _value, $Res Function(_UnifediApiField) _then)
      : super(_value, (v) => _then(v as _UnifediApiField));

  @override
  _UnifediApiField get _value => super._value as _UnifediApiField;

  @override
  $Res call({
    Object? name = freezed,
    Object? value = freezed,
    Object? verifiedAt = freezed,
  }) {
    return _then(_UnifediApiField(
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
class _$_UnifediApiField implements _UnifediApiField {
  const _$_UnifediApiField(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.value,
      @HiveField(2) @JsonKey(name: 'verified_at') required this.verifiedAt});

  factory _$_UnifediApiField.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiFieldFromJson(json);

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
    return 'UnifediApiField(name: $name, value: $value, verifiedAt: $verifiedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiField &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.verifiedAt, verifiedAt) ||
                const DeepCollectionEquality()
                    .equals(other.verifiedAt, verifiedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(verifiedAt);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiFieldCopyWith<_UnifediApiField> get copyWith =>
      __$UnifediApiFieldCopyWithImpl<_UnifediApiField>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiFieldToJson(this);
  }
}

abstract class _UnifediApiField implements UnifediApiField {
  const factory _UnifediApiField(
      {@HiveField(0)
          required String? name,
      @HiveField(1)
          required String? value,
      @HiveField(2)
      @JsonKey(name: 'verified_at')
          required DateTime? verifiedAt}) = _$_UnifediApiField;

  factory _UnifediApiField.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiField.fromJson;

  @override
  @HiveField(0)
  String? get name => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String? get value => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'verified_at')
  DateTime? get verifiedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiFieldCopyWith<_UnifediApiField> get copyWith =>
      throw _privateConstructorUsedError;
}
