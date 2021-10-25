// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_instance_field_limits_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiInstanceFieldLimits _$PleromaApiInstanceFieldLimitsFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiInstanceFieldLimits.fromJson(json);
}

/// @nodoc
class _$PleromaApiInstanceFieldLimitsTearOff {
  const _$PleromaApiInstanceFieldLimitsTearOff();

  _PleromaApiInstanceFieldLimits call(
      {@HiveField(0)
      @JsonKey(name: 'max_fields')
          required int? maxFields,
      @JsonKey(name: 'max_remote_fields')
      @HiveField(1)
          required int? maxRemoteFields,
      @JsonKey(name: 'name_length')
      @HiveField(2)
          required int? nameLength,
      @JsonKey(name: 'value_length')
      @HiveField(3)
          required int? valueLength}) {
    return _PleromaApiInstanceFieldLimits(
      maxFields: maxFields,
      maxRemoteFields: maxRemoteFields,
      nameLength: nameLength,
      valueLength: valueLength,
    );
  }

  PleromaApiInstanceFieldLimits fromJson(Map<String, Object> json) {
    return PleromaApiInstanceFieldLimits.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiInstanceFieldLimits = _$PleromaApiInstanceFieldLimitsTearOff();

/// @nodoc
mixin _$PleromaApiInstanceFieldLimits {
  @HiveField(0)
  @JsonKey(name: 'max_fields')
  int? get maxFields => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_remote_fields')
  @HiveField(1)
  int? get maxRemoteFields => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_length')
  @HiveField(2)
  int? get nameLength => throw _privateConstructorUsedError;
  @JsonKey(name: 'value_length')
  @HiveField(3)
  int? get valueLength => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiInstanceFieldLimitsCopyWith<PleromaApiInstanceFieldLimits>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiInstanceFieldLimitsCopyWith<$Res> {
  factory $PleromaApiInstanceFieldLimitsCopyWith(
          PleromaApiInstanceFieldLimits value,
          $Res Function(PleromaApiInstanceFieldLimits) then) =
      _$PleromaApiInstanceFieldLimitsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) @JsonKey(name: 'max_fields') int? maxFields,
      @JsonKey(name: 'max_remote_fields') @HiveField(1) int? maxRemoteFields,
      @JsonKey(name: 'name_length') @HiveField(2) int? nameLength,
      @JsonKey(name: 'value_length') @HiveField(3) int? valueLength});
}

/// @nodoc
class _$PleromaApiInstanceFieldLimitsCopyWithImpl<$Res>
    implements $PleromaApiInstanceFieldLimitsCopyWith<$Res> {
  _$PleromaApiInstanceFieldLimitsCopyWithImpl(this._value, this._then);

  final PleromaApiInstanceFieldLimits _value;
  // ignore: unused_field
  final $Res Function(PleromaApiInstanceFieldLimits) _then;

  @override
  $Res call({
    Object? maxFields = freezed,
    Object? maxRemoteFields = freezed,
    Object? nameLength = freezed,
    Object? valueLength = freezed,
  }) {
    return _then(_value.copyWith(
      maxFields: maxFields == freezed
          ? _value.maxFields
          : maxFields // ignore: cast_nullable_to_non_nullable
              as int?,
      maxRemoteFields: maxRemoteFields == freezed
          ? _value.maxRemoteFields
          : maxRemoteFields // ignore: cast_nullable_to_non_nullable
              as int?,
      nameLength: nameLength == freezed
          ? _value.nameLength
          : nameLength // ignore: cast_nullable_to_non_nullable
              as int?,
      valueLength: valueLength == freezed
          ? _value.valueLength
          : valueLength // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiInstanceFieldLimitsCopyWith<$Res>
    implements $PleromaApiInstanceFieldLimitsCopyWith<$Res> {
  factory _$PleromaApiInstanceFieldLimitsCopyWith(
          _PleromaApiInstanceFieldLimits value,
          $Res Function(_PleromaApiInstanceFieldLimits) then) =
      __$PleromaApiInstanceFieldLimitsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) @JsonKey(name: 'max_fields') int? maxFields,
      @JsonKey(name: 'max_remote_fields') @HiveField(1) int? maxRemoteFields,
      @JsonKey(name: 'name_length') @HiveField(2) int? nameLength,
      @JsonKey(name: 'value_length') @HiveField(3) int? valueLength});
}

/// @nodoc
class __$PleromaApiInstanceFieldLimitsCopyWithImpl<$Res>
    extends _$PleromaApiInstanceFieldLimitsCopyWithImpl<$Res>
    implements _$PleromaApiInstanceFieldLimitsCopyWith<$Res> {
  __$PleromaApiInstanceFieldLimitsCopyWithImpl(
      _PleromaApiInstanceFieldLimits _value,
      $Res Function(_PleromaApiInstanceFieldLimits) _then)
      : super(_value, (v) => _then(v as _PleromaApiInstanceFieldLimits));

  @override
  _PleromaApiInstanceFieldLimits get _value =>
      super._value as _PleromaApiInstanceFieldLimits;

  @override
  $Res call({
    Object? maxFields = freezed,
    Object? maxRemoteFields = freezed,
    Object? nameLength = freezed,
    Object? valueLength = freezed,
  }) {
    return _then(_PleromaApiInstanceFieldLimits(
      maxFields: maxFields == freezed
          ? _value.maxFields
          : maxFields // ignore: cast_nullable_to_non_nullable
              as int?,
      maxRemoteFields: maxRemoteFields == freezed
          ? _value.maxRemoteFields
          : maxRemoteFields // ignore: cast_nullable_to_non_nullable
              as int?,
      nameLength: nameLength == freezed
          ? _value.nameLength
          : nameLength // ignore: cast_nullable_to_non_nullable
              as int?,
      valueLength: valueLength == freezed
          ? _value.valueLength
          : valueLength // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiInstanceFieldLimits
    implements _PleromaApiInstanceFieldLimits {
  const _$_PleromaApiInstanceFieldLimits(
      {@HiveField(0)
      @JsonKey(name: 'max_fields')
          required this.maxFields,
      @JsonKey(name: 'max_remote_fields')
      @HiveField(1)
          required this.maxRemoteFields,
      @JsonKey(name: 'name_length')
      @HiveField(2)
          required this.nameLength,
      @JsonKey(name: 'value_length')
      @HiveField(3)
          required this.valueLength});

  factory _$_PleromaApiInstanceFieldLimits.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiInstanceFieldLimitsFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'max_fields')
  final int? maxFields;
  @override
  @JsonKey(name: 'max_remote_fields')
  @HiveField(1)
  final int? maxRemoteFields;
  @override
  @JsonKey(name: 'name_length')
  @HiveField(2)
  final int? nameLength;
  @override
  @JsonKey(name: 'value_length')
  @HiveField(3)
  final int? valueLength;

  @override
  String toString() {
    return 'PleromaApiInstanceFieldLimits(maxFields: $maxFields, maxRemoteFields: $maxRemoteFields, nameLength: $nameLength, valueLength: $valueLength)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiInstanceFieldLimits &&
            (identical(other.maxFields, maxFields) ||
                const DeepCollectionEquality()
                    .equals(other.maxFields, maxFields)) &&
            (identical(other.maxRemoteFields, maxRemoteFields) ||
                const DeepCollectionEquality()
                    .equals(other.maxRemoteFields, maxRemoteFields)) &&
            (identical(other.nameLength, nameLength) ||
                const DeepCollectionEquality()
                    .equals(other.nameLength, nameLength)) &&
            (identical(other.valueLength, valueLength) ||
                const DeepCollectionEquality()
                    .equals(other.valueLength, valueLength)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(maxFields) ^
      const DeepCollectionEquality().hash(maxRemoteFields) ^
      const DeepCollectionEquality().hash(nameLength) ^
      const DeepCollectionEquality().hash(valueLength);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiInstanceFieldLimitsCopyWith<_PleromaApiInstanceFieldLimits>
      get copyWith => __$PleromaApiInstanceFieldLimitsCopyWithImpl<
          _PleromaApiInstanceFieldLimits>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiInstanceFieldLimitsToJson(this);
  }
}

abstract class _PleromaApiInstanceFieldLimits
    implements PleromaApiInstanceFieldLimits {
  const factory _PleromaApiInstanceFieldLimits(
      {@HiveField(0)
      @JsonKey(name: 'max_fields')
          required int? maxFields,
      @JsonKey(name: 'max_remote_fields')
      @HiveField(1)
          required int? maxRemoteFields,
      @JsonKey(name: 'name_length')
      @HiveField(2)
          required int? nameLength,
      @JsonKey(name: 'value_length')
      @HiveField(3)
          required int? valueLength}) = _$_PleromaApiInstanceFieldLimits;

  factory _PleromaApiInstanceFieldLimits.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiInstanceFieldLimits.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'max_fields')
  int? get maxFields => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'max_remote_fields')
  @HiveField(1)
  int? get maxRemoteFields => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'name_length')
  @HiveField(2)
  int? get nameLength => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'value_length')
  @HiveField(3)
  int? get valueLength => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiInstanceFieldLimitsCopyWith<_PleromaApiInstanceFieldLimits>
      get copyWith => throw _privateConstructorUsedError;
}
