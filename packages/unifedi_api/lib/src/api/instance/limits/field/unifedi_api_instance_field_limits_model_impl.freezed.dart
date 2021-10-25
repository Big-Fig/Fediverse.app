// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_field_limits_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstanceFieldLimits _$UnifediApiInstanceFieldLimitsFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiInstanceFieldLimits.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstanceFieldLimitsTearOff {
  const _$UnifediApiInstanceFieldLimitsTearOff();

  _UnifediApiInstanceFieldLimits call(
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
    return _UnifediApiInstanceFieldLimits(
      maxFields: maxFields,
      maxRemoteFields: maxRemoteFields,
      nameLength: nameLength,
      valueLength: valueLength,
    );
  }

  UnifediApiInstanceFieldLimits fromJson(Map<String, Object> json) {
    return UnifediApiInstanceFieldLimits.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstanceFieldLimits = _$UnifediApiInstanceFieldLimitsTearOff();

/// @nodoc
mixin _$UnifediApiInstanceFieldLimits {
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
  $UnifediApiInstanceFieldLimitsCopyWith<UnifediApiInstanceFieldLimits>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstanceFieldLimitsCopyWith<$Res> {
  factory $UnifediApiInstanceFieldLimitsCopyWith(
          UnifediApiInstanceFieldLimits value,
          $Res Function(UnifediApiInstanceFieldLimits) then) =
      _$UnifediApiInstanceFieldLimitsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) @JsonKey(name: 'max_fields') int? maxFields,
      @JsonKey(name: 'max_remote_fields') @HiveField(1) int? maxRemoteFields,
      @JsonKey(name: 'name_length') @HiveField(2) int? nameLength,
      @JsonKey(name: 'value_length') @HiveField(3) int? valueLength});
}

/// @nodoc
class _$UnifediApiInstanceFieldLimitsCopyWithImpl<$Res>
    implements $UnifediApiInstanceFieldLimitsCopyWith<$Res> {
  _$UnifediApiInstanceFieldLimitsCopyWithImpl(this._value, this._then);

  final UnifediApiInstanceFieldLimits _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstanceFieldLimits) _then;

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
abstract class _$UnifediApiInstanceFieldLimitsCopyWith<$Res>
    implements $UnifediApiInstanceFieldLimitsCopyWith<$Res> {
  factory _$UnifediApiInstanceFieldLimitsCopyWith(
          _UnifediApiInstanceFieldLimits value,
          $Res Function(_UnifediApiInstanceFieldLimits) then) =
      __$UnifediApiInstanceFieldLimitsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) @JsonKey(name: 'max_fields') int? maxFields,
      @JsonKey(name: 'max_remote_fields') @HiveField(1) int? maxRemoteFields,
      @JsonKey(name: 'name_length') @HiveField(2) int? nameLength,
      @JsonKey(name: 'value_length') @HiveField(3) int? valueLength});
}

/// @nodoc
class __$UnifediApiInstanceFieldLimitsCopyWithImpl<$Res>
    extends _$UnifediApiInstanceFieldLimitsCopyWithImpl<$Res>
    implements _$UnifediApiInstanceFieldLimitsCopyWith<$Res> {
  __$UnifediApiInstanceFieldLimitsCopyWithImpl(
      _UnifediApiInstanceFieldLimits _value,
      $Res Function(_UnifediApiInstanceFieldLimits) _then)
      : super(_value, (v) => _then(v as _UnifediApiInstanceFieldLimits));

  @override
  _UnifediApiInstanceFieldLimits get _value =>
      super._value as _UnifediApiInstanceFieldLimits;

  @override
  $Res call({
    Object? maxFields = freezed,
    Object? maxRemoteFields = freezed,
    Object? nameLength = freezed,
    Object? valueLength = freezed,
  }) {
    return _then(_UnifediApiInstanceFieldLimits(
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
class _$_UnifediApiInstanceFieldLimits
    implements _UnifediApiInstanceFieldLimits {
  const _$_UnifediApiInstanceFieldLimits(
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

  factory _$_UnifediApiInstanceFieldLimits.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiInstanceFieldLimitsFromJson(json);

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
    return 'UnifediApiInstanceFieldLimits(maxFields: $maxFields, maxRemoteFields: $maxRemoteFields, nameLength: $nameLength, valueLength: $valueLength)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiInstanceFieldLimits &&
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
  _$UnifediApiInstanceFieldLimitsCopyWith<_UnifediApiInstanceFieldLimits>
      get copyWith => __$UnifediApiInstanceFieldLimitsCopyWithImpl<
          _UnifediApiInstanceFieldLimits>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstanceFieldLimitsToJson(this);
  }
}

abstract class _UnifediApiInstanceFieldLimits
    implements UnifediApiInstanceFieldLimits {
  const factory _UnifediApiInstanceFieldLimits(
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
          required int? valueLength}) = _$_UnifediApiInstanceFieldLimits;

  factory _UnifediApiInstanceFieldLimits.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiInstanceFieldLimits.fromJson;

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
  _$UnifediApiInstanceFieldLimitsCopyWith<_UnifediApiInstanceFieldLimits>
      get copyWith => throw _privateConstructorUsedError;
}
