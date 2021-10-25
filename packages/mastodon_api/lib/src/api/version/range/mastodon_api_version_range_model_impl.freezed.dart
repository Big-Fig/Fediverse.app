// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_version_range_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiVersionRange _$MastodonApiVersionRangeFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiVersionRange.fromJson(json);
}

/// @nodoc
class _$MastodonApiVersionRangeTearOff {
  const _$MastodonApiVersionRangeTearOff();

  _MastodonApiVersionRange call(
      {@HiveField(0)
          required MastodonApiVersion? min,
      @HiveField(1)
          required MastodonApiVersion? max,
      @HiveField(2)
      @JsonKey(name: 'min_inclusive')
          bool minInclusive = true,
      @HiveField(3)
      @JsonKey(name: 'max_inclusive')
          bool maxInclusive = false}) {
    return _MastodonApiVersionRange(
      min: min,
      max: max,
      minInclusive: minInclusive,
      maxInclusive: maxInclusive,
    );
  }

  MastodonApiVersionRange fromJson(Map<String, Object> json) {
    return MastodonApiVersionRange.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiVersionRange = _$MastodonApiVersionRangeTearOff();

/// @nodoc
mixin _$MastodonApiVersionRange {
  @HiveField(0)
  MastodonApiVersion? get min => throw _privateConstructorUsedError;
  @HiveField(1)
  MastodonApiVersion? get max => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'min_inclusive')
  bool get minInclusive => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'max_inclusive')
  bool get maxInclusive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiVersionRangeCopyWith<MastodonApiVersionRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiVersionRangeCopyWith<$Res> {
  factory $MastodonApiVersionRangeCopyWith(MastodonApiVersionRange value,
          $Res Function(MastodonApiVersionRange) then) =
      _$MastodonApiVersionRangeCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) MastodonApiVersion? min,
      @HiveField(1) MastodonApiVersion? max,
      @HiveField(2) @JsonKey(name: 'min_inclusive') bool minInclusive,
      @HiveField(3) @JsonKey(name: 'max_inclusive') bool maxInclusive});

  $MastodonApiVersionCopyWith<$Res>? get min;
  $MastodonApiVersionCopyWith<$Res>? get max;
}

/// @nodoc
class _$MastodonApiVersionRangeCopyWithImpl<$Res>
    implements $MastodonApiVersionRangeCopyWith<$Res> {
  _$MastodonApiVersionRangeCopyWithImpl(this._value, this._then);

  final MastodonApiVersionRange _value;
  // ignore: unused_field
  final $Res Function(MastodonApiVersionRange) _then;

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
              as MastodonApiVersion?,
      max: max == freezed
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as MastodonApiVersion?,
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
  $MastodonApiVersionCopyWith<$Res>? get min {
    if (_value.min == null) {
      return null;
    }

    return $MastodonApiVersionCopyWith<$Res>(_value.min!, (value) {
      return _then(_value.copyWith(min: value));
    });
  }

  @override
  $MastodonApiVersionCopyWith<$Res>? get max {
    if (_value.max == null) {
      return null;
    }

    return $MastodonApiVersionCopyWith<$Res>(_value.max!, (value) {
      return _then(_value.copyWith(max: value));
    });
  }
}

/// @nodoc
abstract class _$MastodonApiVersionRangeCopyWith<$Res>
    implements $MastodonApiVersionRangeCopyWith<$Res> {
  factory _$MastodonApiVersionRangeCopyWith(_MastodonApiVersionRange value,
          $Res Function(_MastodonApiVersionRange) then) =
      __$MastodonApiVersionRangeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) MastodonApiVersion? min,
      @HiveField(1) MastodonApiVersion? max,
      @HiveField(2) @JsonKey(name: 'min_inclusive') bool minInclusive,
      @HiveField(3) @JsonKey(name: 'max_inclusive') bool maxInclusive});

  @override
  $MastodonApiVersionCopyWith<$Res>? get min;
  @override
  $MastodonApiVersionCopyWith<$Res>? get max;
}

/// @nodoc
class __$MastodonApiVersionRangeCopyWithImpl<$Res>
    extends _$MastodonApiVersionRangeCopyWithImpl<$Res>
    implements _$MastodonApiVersionRangeCopyWith<$Res> {
  __$MastodonApiVersionRangeCopyWithImpl(_MastodonApiVersionRange _value,
      $Res Function(_MastodonApiVersionRange) _then)
      : super(_value, (v) => _then(v as _MastodonApiVersionRange));

  @override
  _MastodonApiVersionRange get _value =>
      super._value as _MastodonApiVersionRange;

  @override
  $Res call({
    Object? min = freezed,
    Object? max = freezed,
    Object? minInclusive = freezed,
    Object? maxInclusive = freezed,
  }) {
    return _then(_MastodonApiVersionRange(
      min: min == freezed
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as MastodonApiVersion?,
      max: max == freezed
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as MastodonApiVersion?,
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
class _$_MastodonApiVersionRange implements _MastodonApiVersionRange {
  const _$_MastodonApiVersionRange(
      {@HiveField(0) required this.min,
      @HiveField(1) required this.max,
      @HiveField(2) @JsonKey(name: 'min_inclusive') this.minInclusive = true,
      @HiveField(3) @JsonKey(name: 'max_inclusive') this.maxInclusive = false});

  factory _$_MastodonApiVersionRange.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiVersionRangeFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiVersion? min;
  @override
  @HiveField(1)
  final MastodonApiVersion? max;
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
    return 'MastodonApiVersionRange(min: $min, max: $max, minInclusive: $minInclusive, maxInclusive: $maxInclusive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiVersionRange &&
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
  _$MastodonApiVersionRangeCopyWith<_MastodonApiVersionRange> get copyWith =>
      __$MastodonApiVersionRangeCopyWithImpl<_MastodonApiVersionRange>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiVersionRangeToJson(this);
  }
}

abstract class _MastodonApiVersionRange implements MastodonApiVersionRange {
  const factory _MastodonApiVersionRange(
          {@HiveField(0) required MastodonApiVersion? min,
          @HiveField(1) required MastodonApiVersion? max,
          @HiveField(2) @JsonKey(name: 'min_inclusive') bool minInclusive,
          @HiveField(3) @JsonKey(name: 'max_inclusive') bool maxInclusive}) =
      _$_MastodonApiVersionRange;

  factory _MastodonApiVersionRange.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiVersionRange.fromJson;

  @override
  @HiveField(0)
  MastodonApiVersion? get min => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  MastodonApiVersion? get max => throw _privateConstructorUsedError;
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
  _$MastodonApiVersionRangeCopyWith<_MastodonApiVersionRange> get copyWith =>
      throw _privateConstructorUsedError;
}
