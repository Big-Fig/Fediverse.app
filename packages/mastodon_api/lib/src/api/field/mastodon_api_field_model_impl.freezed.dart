// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_field_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiField _$MastodonApiFieldFromJson(Map<String, dynamic> json) {
  return _MastodonApiField.fromJson(json);
}

/// @nodoc
class _$MastodonApiFieldTearOff {
  const _$MastodonApiFieldTearOff();

  _MastodonApiField call(
      {@HiveField(0)
          required String? name,
      @HiveField(1)
          required String? value,
      @HiveField(2)
      @JsonKey(name: 'verified_at')
          required DateTime? verifiedAt}) {
    return _MastodonApiField(
      name: name,
      value: value,
      verifiedAt: verifiedAt,
    );
  }

  MastodonApiField fromJson(Map<String, Object> json) {
    return MastodonApiField.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiField = _$MastodonApiFieldTearOff();

/// @nodoc
mixin _$MastodonApiField {
  @HiveField(0)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get value => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'verified_at')
  DateTime? get verifiedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiFieldCopyWith<MastodonApiField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiFieldCopyWith<$Res> {
  factory $MastodonApiFieldCopyWith(
          MastodonApiField value, $Res Function(MastodonApiField) then) =
      _$MastodonApiFieldCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String? name,
      @HiveField(1) String? value,
      @HiveField(2) @JsonKey(name: 'verified_at') DateTime? verifiedAt});
}

/// @nodoc
class _$MastodonApiFieldCopyWithImpl<$Res>
    implements $MastodonApiFieldCopyWith<$Res> {
  _$MastodonApiFieldCopyWithImpl(this._value, this._then);

  final MastodonApiField _value;
  // ignore: unused_field
  final $Res Function(MastodonApiField) _then;

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
abstract class _$MastodonApiFieldCopyWith<$Res>
    implements $MastodonApiFieldCopyWith<$Res> {
  factory _$MastodonApiFieldCopyWith(
          _MastodonApiField value, $Res Function(_MastodonApiField) then) =
      __$MastodonApiFieldCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String? name,
      @HiveField(1) String? value,
      @HiveField(2) @JsonKey(name: 'verified_at') DateTime? verifiedAt});
}

/// @nodoc
class __$MastodonApiFieldCopyWithImpl<$Res>
    extends _$MastodonApiFieldCopyWithImpl<$Res>
    implements _$MastodonApiFieldCopyWith<$Res> {
  __$MastodonApiFieldCopyWithImpl(
      _MastodonApiField _value, $Res Function(_MastodonApiField) _then)
      : super(_value, (v) => _then(v as _MastodonApiField));

  @override
  _MastodonApiField get _value => super._value as _MastodonApiField;

  @override
  $Res call({
    Object? name = freezed,
    Object? value = freezed,
    Object? verifiedAt = freezed,
  }) {
    return _then(_MastodonApiField(
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
class _$_MastodonApiField implements _MastodonApiField {
  const _$_MastodonApiField(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.value,
      @HiveField(2) @JsonKey(name: 'verified_at') required this.verifiedAt});

  factory _$_MastodonApiField.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiFieldFromJson(json);

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
    return 'MastodonApiField(name: $name, value: $value, verifiedAt: $verifiedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiField &&
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
  _$MastodonApiFieldCopyWith<_MastodonApiField> get copyWith =>
      __$MastodonApiFieldCopyWithImpl<_MastodonApiField>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiFieldToJson(this);
  }
}

abstract class _MastodonApiField implements MastodonApiField {
  const factory _MastodonApiField(
      {@HiveField(0)
          required String? name,
      @HiveField(1)
          required String? value,
      @HiveField(2)
      @JsonKey(name: 'verified_at')
          required DateTime? verifiedAt}) = _$_MastodonApiField;

  factory _MastodonApiField.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiField.fromJson;

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
  _$MastodonApiFieldCopyWith<_MastodonApiField> get copyWith =>
      throw _privateConstructorUsedError;
}
