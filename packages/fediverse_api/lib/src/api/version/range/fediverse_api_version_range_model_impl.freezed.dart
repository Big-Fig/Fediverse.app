// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fediverse_api_version_range_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FediverseApiVersionRange _$FediverseApiVersionRangeFromJson(
    Map<String, dynamic> json) {
  return _FediverseApiVersionRange.fromJson(json);
}

/// @nodoc
class _$FediverseApiVersionRangeTearOff {
  const _$FediverseApiVersionRangeTearOff();

  _FediverseApiVersionRange call(
      {@HiveField(0)
          required FediverseApiVersion? min,
      @HiveField(1)
          required FediverseApiVersion? max,
      @HiveField(2)
      @JsonKey(name: 'min_inclusive')
          bool minInclusive = true,
      @HiveField(3)
      @JsonKey(name: 'max_inclusive')
          bool maxInclusive = false}) {
    return _FediverseApiVersionRange(
      min: min,
      max: max,
      minInclusive: minInclusive,
      maxInclusive: maxInclusive,
    );
  }

  FediverseApiVersionRange fromJson(Map<String, Object> json) {
    return FediverseApiVersionRange.fromJson(json);
  }
}

/// @nodoc
const $FediverseApiVersionRange = _$FediverseApiVersionRangeTearOff();

/// @nodoc
mixin _$FediverseApiVersionRange {
  @HiveField(0)
  FediverseApiVersion? get min => throw _privateConstructorUsedError;
  @HiveField(1)
  FediverseApiVersion? get max => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'min_inclusive')
  bool get minInclusive => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'max_inclusive')
  bool get maxInclusive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FediverseApiVersionRangeCopyWith<FediverseApiVersionRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FediverseApiVersionRangeCopyWith<$Res> {
  factory $FediverseApiVersionRangeCopyWith(FediverseApiVersionRange value,
          $Res Function(FediverseApiVersionRange) then) =
      _$FediverseApiVersionRangeCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) FediverseApiVersion? min,
      @HiveField(1) FediverseApiVersion? max,
      @HiveField(2) @JsonKey(name: 'min_inclusive') bool minInclusive,
      @HiveField(3) @JsonKey(name: 'max_inclusive') bool maxInclusive});

  $FediverseApiVersionCopyWith<$Res>? get min;
  $FediverseApiVersionCopyWith<$Res>? get max;
}

/// @nodoc
class _$FediverseApiVersionRangeCopyWithImpl<$Res>
    implements $FediverseApiVersionRangeCopyWith<$Res> {
  _$FediverseApiVersionRangeCopyWithImpl(this._value, this._then);

  final FediverseApiVersionRange _value;
  // ignore: unused_field
  final $Res Function(FediverseApiVersionRange) _then;

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
              as FediverseApiVersion?,
      max: max == freezed
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as FediverseApiVersion?,
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
  $FediverseApiVersionCopyWith<$Res>? get min {
    if (_value.min == null) {
      return null;
    }

    return $FediverseApiVersionCopyWith<$Res>(_value.min!, (value) {
      return _then(_value.copyWith(min: value));
    });
  }

  @override
  $FediverseApiVersionCopyWith<$Res>? get max {
    if (_value.max == null) {
      return null;
    }

    return $FediverseApiVersionCopyWith<$Res>(_value.max!, (value) {
      return _then(_value.copyWith(max: value));
    });
  }
}

/// @nodoc
abstract class _$FediverseApiVersionRangeCopyWith<$Res>
    implements $FediverseApiVersionRangeCopyWith<$Res> {
  factory _$FediverseApiVersionRangeCopyWith(_FediverseApiVersionRange value,
          $Res Function(_FediverseApiVersionRange) then) =
      __$FediverseApiVersionRangeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) FediverseApiVersion? min,
      @HiveField(1) FediverseApiVersion? max,
      @HiveField(2) @JsonKey(name: 'min_inclusive') bool minInclusive,
      @HiveField(3) @JsonKey(name: 'max_inclusive') bool maxInclusive});

  @override
  $FediverseApiVersionCopyWith<$Res>? get min;
  @override
  $FediverseApiVersionCopyWith<$Res>? get max;
}

/// @nodoc
class __$FediverseApiVersionRangeCopyWithImpl<$Res>
    extends _$FediverseApiVersionRangeCopyWithImpl<$Res>
    implements _$FediverseApiVersionRangeCopyWith<$Res> {
  __$FediverseApiVersionRangeCopyWithImpl(_FediverseApiVersionRange _value,
      $Res Function(_FediverseApiVersionRange) _then)
      : super(_value, (v) => _then(v as _FediverseApiVersionRange));

  @override
  _FediverseApiVersionRange get _value =>
      super._value as _FediverseApiVersionRange;

  @override
  $Res call({
    Object? min = freezed,
    Object? max = freezed,
    Object? minInclusive = freezed,
    Object? maxInclusive = freezed,
  }) {
    return _then(_FediverseApiVersionRange(
      min: min == freezed
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as FediverseApiVersion?,
      max: max == freezed
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as FediverseApiVersion?,
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
class _$_FediverseApiVersionRange implements _FediverseApiVersionRange {
  const _$_FediverseApiVersionRange(
      {@HiveField(0) required this.min,
      @HiveField(1) required this.max,
      @HiveField(2) @JsonKey(name: 'min_inclusive') this.minInclusive = true,
      @HiveField(3) @JsonKey(name: 'max_inclusive') this.maxInclusive = false});

  factory _$_FediverseApiVersionRange.fromJson(Map<String, dynamic> json) =>
      _$$_FediverseApiVersionRangeFromJson(json);

  @override
  @HiveField(0)
  final FediverseApiVersion? min;
  @override
  @HiveField(1)
  final FediverseApiVersion? max;
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
    return 'FediverseApiVersionRange(min: $min, max: $max, minInclusive: $minInclusive, maxInclusive: $maxInclusive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FediverseApiVersionRange &&
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
  _$FediverseApiVersionRangeCopyWith<_FediverseApiVersionRange> get copyWith =>
      __$FediverseApiVersionRangeCopyWithImpl<_FediverseApiVersionRange>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FediverseApiVersionRangeToJson(this);
  }
}

abstract class _FediverseApiVersionRange implements FediverseApiVersionRange {
  const factory _FediverseApiVersionRange(
          {@HiveField(0) required FediverseApiVersion? min,
          @HiveField(1) required FediverseApiVersion? max,
          @HiveField(2) @JsonKey(name: 'min_inclusive') bool minInclusive,
          @HiveField(3) @JsonKey(name: 'max_inclusive') bool maxInclusive}) =
      _$_FediverseApiVersionRange;

  factory _FediverseApiVersionRange.fromJson(Map<String, dynamic> json) =
      _$_FediverseApiVersionRange.fromJson;

  @override
  @HiveField(0)
  FediverseApiVersion? get min => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  FediverseApiVersion? get max => throw _privateConstructorUsedError;
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
  _$FediverseApiVersionRangeCopyWith<_FediverseApiVersionRange> get copyWith =>
      throw _privateConstructorUsedError;
}
