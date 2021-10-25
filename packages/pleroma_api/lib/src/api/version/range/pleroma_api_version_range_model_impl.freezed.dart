// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_version_range_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiVersionRange _$PleromaApiVersionRangeFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiVersionRange.fromJson(json);
}

/// @nodoc
class _$PleromaApiVersionRangeTearOff {
  const _$PleromaApiVersionRangeTearOff();

  _PleromaApiVersionRange call(
      {@HiveField(0)
          required PleromaApiVersion? min,
      @HiveField(1)
          required PleromaApiVersion? max,
      @HiveField(2)
      @JsonKey(name: 'min_inclusive')
          bool minInclusive = true,
      @HiveField(3)
      @JsonKey(name: 'max_inclusive')
          bool maxInclusive = false}) {
    return _PleromaApiVersionRange(
      min: min,
      max: max,
      minInclusive: minInclusive,
      maxInclusive: maxInclusive,
    );
  }

  PleromaApiVersionRange fromJson(Map<String, Object> json) {
    return PleromaApiVersionRange.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiVersionRange = _$PleromaApiVersionRangeTearOff();

/// @nodoc
mixin _$PleromaApiVersionRange {
  @HiveField(0)
  PleromaApiVersion? get min => throw _privateConstructorUsedError;
  @HiveField(1)
  PleromaApiVersion? get max => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'min_inclusive')
  bool get minInclusive => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'max_inclusive')
  bool get maxInclusive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiVersionRangeCopyWith<PleromaApiVersionRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiVersionRangeCopyWith<$Res> {
  factory $PleromaApiVersionRangeCopyWith(PleromaApiVersionRange value,
          $Res Function(PleromaApiVersionRange) then) =
      _$PleromaApiVersionRangeCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) PleromaApiVersion? min,
      @HiveField(1) PleromaApiVersion? max,
      @HiveField(2) @JsonKey(name: 'min_inclusive') bool minInclusive,
      @HiveField(3) @JsonKey(name: 'max_inclusive') bool maxInclusive});

  $PleromaApiVersionCopyWith<$Res>? get min;
  $PleromaApiVersionCopyWith<$Res>? get max;
}

/// @nodoc
class _$PleromaApiVersionRangeCopyWithImpl<$Res>
    implements $PleromaApiVersionRangeCopyWith<$Res> {
  _$PleromaApiVersionRangeCopyWithImpl(this._value, this._then);

  final PleromaApiVersionRange _value;
  // ignore: unused_field
  final $Res Function(PleromaApiVersionRange) _then;

  @override
  $Res call({
    Object? min = freezed,
    Object? max = freezed,
    Object? minInclusive = freezed,
    Object? maxInclusive = freezed,
  }) {
    return _then(_value.copyWith(
      min: min == freezed
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as PleromaApiVersion?,
      max: max == freezed
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as PleromaApiVersion?,
      minInclusive: minInclusive == freezed
          ? _value.minInclusive
          : minInclusive // ignore: cast_nullable_to_non_nullable
              as bool,
      maxInclusive: maxInclusive == freezed
          ? _value.maxInclusive
          : maxInclusive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $PleromaApiVersionCopyWith<$Res>? get min {
    if (_value.min == null) {
      return null;
    }

    return $PleromaApiVersionCopyWith<$Res>(_value.min!, (value) {
      return _then(_value.copyWith(min: value));
    });
  }

  @override
  $PleromaApiVersionCopyWith<$Res>? get max {
    if (_value.max == null) {
      return null;
    }

    return $PleromaApiVersionCopyWith<$Res>(_value.max!, (value) {
      return _then(_value.copyWith(max: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiVersionRangeCopyWith<$Res>
    implements $PleromaApiVersionRangeCopyWith<$Res> {
  factory _$PleromaApiVersionRangeCopyWith(_PleromaApiVersionRange value,
          $Res Function(_PleromaApiVersionRange) then) =
      __$PleromaApiVersionRangeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) PleromaApiVersion? min,
      @HiveField(1) PleromaApiVersion? max,
      @HiveField(2) @JsonKey(name: 'min_inclusive') bool minInclusive,
      @HiveField(3) @JsonKey(name: 'max_inclusive') bool maxInclusive});

  @override
  $PleromaApiVersionCopyWith<$Res>? get min;
  @override
  $PleromaApiVersionCopyWith<$Res>? get max;
}

/// @nodoc
class __$PleromaApiVersionRangeCopyWithImpl<$Res>
    extends _$PleromaApiVersionRangeCopyWithImpl<$Res>
    implements _$PleromaApiVersionRangeCopyWith<$Res> {
  __$PleromaApiVersionRangeCopyWithImpl(_PleromaApiVersionRange _value,
      $Res Function(_PleromaApiVersionRange) _then)
      : super(_value, (v) => _then(v as _PleromaApiVersionRange));

  @override
  _PleromaApiVersionRange get _value => super._value as _PleromaApiVersionRange;

  @override
  $Res call({
    Object? min = freezed,
    Object? max = freezed,
    Object? minInclusive = freezed,
    Object? maxInclusive = freezed,
  }) {
    return _then(_PleromaApiVersionRange(
      min: min == freezed
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as PleromaApiVersion?,
      max: max == freezed
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as PleromaApiVersion?,
      minInclusive: minInclusive == freezed
          ? _value.minInclusive
          : minInclusive // ignore: cast_nullable_to_non_nullable
              as bool,
      maxInclusive: maxInclusive == freezed
          ? _value.maxInclusive
          : maxInclusive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiVersionRange implements _PleromaApiVersionRange {
  const _$_PleromaApiVersionRange(
      {@HiveField(0) required this.min,
      @HiveField(1) required this.max,
      @HiveField(2) @JsonKey(name: 'min_inclusive') this.minInclusive = true,
      @HiveField(3) @JsonKey(name: 'max_inclusive') this.maxInclusive = false});

  factory _$_PleromaApiVersionRange.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiVersionRangeFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiVersion? min;
  @override
  @HiveField(1)
  final PleromaApiVersion? max;
  @override
  @HiveField(2)
  @JsonKey(name: 'min_inclusive')
  final bool minInclusive;
  @override
  @HiveField(3)
  @JsonKey(name: 'max_inclusive')
  final bool maxInclusive;

  @override
  String toString() {
    return 'PleromaApiVersionRange(min: $min, max: $max, minInclusive: $minInclusive, maxInclusive: $maxInclusive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiVersionRange &&
            (identical(other.min, min) ||
                const DeepCollectionEquality().equals(other.min, min)) &&
            (identical(other.max, max) ||
                const DeepCollectionEquality().equals(other.max, max)) &&
            (identical(other.minInclusive, minInclusive) ||
                const DeepCollectionEquality()
                    .equals(other.minInclusive, minInclusive)) &&
            (identical(other.maxInclusive, maxInclusive) ||
                const DeepCollectionEquality()
                    .equals(other.maxInclusive, maxInclusive)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(min) ^
      const DeepCollectionEquality().hash(max) ^
      const DeepCollectionEquality().hash(minInclusive) ^
      const DeepCollectionEquality().hash(maxInclusive);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiVersionRangeCopyWith<_PleromaApiVersionRange> get copyWith =>
      __$PleromaApiVersionRangeCopyWithImpl<_PleromaApiVersionRange>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiVersionRangeToJson(this);
  }
}

abstract class _PleromaApiVersionRange implements PleromaApiVersionRange {
  const factory _PleromaApiVersionRange(
          {@HiveField(0) required PleromaApiVersion? min,
          @HiveField(1) required PleromaApiVersion? max,
          @HiveField(2) @JsonKey(name: 'min_inclusive') bool minInclusive,
          @HiveField(3) @JsonKey(name: 'max_inclusive') bool maxInclusive}) =
      _$_PleromaApiVersionRange;

  factory _PleromaApiVersionRange.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiVersionRange.fromJson;

  @override
  @HiveField(0)
  PleromaApiVersion? get min => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  PleromaApiVersion? get max => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'min_inclusive')
  bool get minInclusive => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  @JsonKey(name: 'max_inclusive')
  bool get maxInclusive => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiVersionRangeCopyWith<_PleromaApiVersionRange> get copyWith =>
      throw _privateConstructorUsedError;
}
