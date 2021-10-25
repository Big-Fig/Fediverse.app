// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_poll_limits_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstancePollLimits _$UnifediApiInstancePollLimitsFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiInstancePollLimits.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstancePollLimitsTearOff {
  const _$UnifediApiInstancePollLimitsTearOff();

  _UnifediApiInstancePollLimits call(
      {@HiveField(0)
      @JsonKey(name: 'max_expiration')
          required int? maxExpiration,
      @HiveField(1)
      @JsonKey(name: 'max_option_chars')
          required int? maxOptionChars,
      @HiveField(2)
      @JsonKey(name: 'max_options')
          required int? maxOptions,
      @HiveField(3)
      @JsonKey(name: 'min_expiration')
          required int? minExpiration}) {
    return _UnifediApiInstancePollLimits(
      maxExpiration: maxExpiration,
      maxOptionChars: maxOptionChars,
      maxOptions: maxOptions,
      minExpiration: minExpiration,
    );
  }

  UnifediApiInstancePollLimits fromJson(Map<String, Object> json) {
    return UnifediApiInstancePollLimits.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstancePollLimits = _$UnifediApiInstancePollLimitsTearOff();

/// @nodoc
mixin _$UnifediApiInstancePollLimits {
  @HiveField(0)
  @JsonKey(name: 'max_expiration')
  int? get maxExpiration => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'max_option_chars')
  int? get maxOptionChars => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'max_options')
  int? get maxOptions => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'min_expiration')
  int? get minExpiration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiInstancePollLimitsCopyWith<UnifediApiInstancePollLimits>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstancePollLimitsCopyWith<$Res> {
  factory $UnifediApiInstancePollLimitsCopyWith(
          UnifediApiInstancePollLimits value,
          $Res Function(UnifediApiInstancePollLimits) then) =
      _$UnifediApiInstancePollLimitsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) @JsonKey(name: 'max_expiration') int? maxExpiration,
      @HiveField(1) @JsonKey(name: 'max_option_chars') int? maxOptionChars,
      @HiveField(2) @JsonKey(name: 'max_options') int? maxOptions,
      @HiveField(3) @JsonKey(name: 'min_expiration') int? minExpiration});
}

/// @nodoc
class _$UnifediApiInstancePollLimitsCopyWithImpl<$Res>
    implements $UnifediApiInstancePollLimitsCopyWith<$Res> {
  _$UnifediApiInstancePollLimitsCopyWithImpl(this._value, this._then);

  final UnifediApiInstancePollLimits _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstancePollLimits) _then;

  @override
  $Res call({
    Object? maxExpiration = freezed,
    Object? maxOptionChars = freezed,
    Object? maxOptions = freezed,
    Object? minExpiration = freezed,
  }) {
    return _then(_value.copyWith(
      maxExpiration: maxExpiration == freezed
          ? _value.maxExpiration
          : maxExpiration // ignore: cast_nullable_to_non_nullable
              as int?,
      maxOptionChars: maxOptionChars == freezed
          ? _value.maxOptionChars
          : maxOptionChars // ignore: cast_nullable_to_non_nullable
              as int?,
      maxOptions: maxOptions == freezed
          ? _value.maxOptions
          : maxOptions // ignore: cast_nullable_to_non_nullable
              as int?,
      minExpiration: minExpiration == freezed
          ? _value.minExpiration
          : minExpiration // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiInstancePollLimitsCopyWith<$Res>
    implements $UnifediApiInstancePollLimitsCopyWith<$Res> {
  factory _$UnifediApiInstancePollLimitsCopyWith(
          _UnifediApiInstancePollLimits value,
          $Res Function(_UnifediApiInstancePollLimits) then) =
      __$UnifediApiInstancePollLimitsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) @JsonKey(name: 'max_expiration') int? maxExpiration,
      @HiveField(1) @JsonKey(name: 'max_option_chars') int? maxOptionChars,
      @HiveField(2) @JsonKey(name: 'max_options') int? maxOptions,
      @HiveField(3) @JsonKey(name: 'min_expiration') int? minExpiration});
}

/// @nodoc
class __$UnifediApiInstancePollLimitsCopyWithImpl<$Res>
    extends _$UnifediApiInstancePollLimitsCopyWithImpl<$Res>
    implements _$UnifediApiInstancePollLimitsCopyWith<$Res> {
  __$UnifediApiInstancePollLimitsCopyWithImpl(
      _UnifediApiInstancePollLimits _value,
      $Res Function(_UnifediApiInstancePollLimits) _then)
      : super(_value, (v) => _then(v as _UnifediApiInstancePollLimits));

  @override
  _UnifediApiInstancePollLimits get _value =>
      super._value as _UnifediApiInstancePollLimits;

  @override
  $Res call({
    Object? maxExpiration = freezed,
    Object? maxOptionChars = freezed,
    Object? maxOptions = freezed,
    Object? minExpiration = freezed,
  }) {
    return _then(_UnifediApiInstancePollLimits(
      maxExpiration: maxExpiration == freezed
          ? _value.maxExpiration
          : maxExpiration // ignore: cast_nullable_to_non_nullable
              as int?,
      maxOptionChars: maxOptionChars == freezed
          ? _value.maxOptionChars
          : maxOptionChars // ignore: cast_nullable_to_non_nullable
              as int?,
      maxOptions: maxOptions == freezed
          ? _value.maxOptions
          : maxOptions // ignore: cast_nullable_to_non_nullable
              as int?,
      minExpiration: minExpiration == freezed
          ? _value.minExpiration
          : minExpiration // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiInstancePollLimits implements _UnifediApiInstancePollLimits {
  const _$_UnifediApiInstancePollLimits(
      {@HiveField(0)
      @JsonKey(name: 'max_expiration')
          required this.maxExpiration,
      @HiveField(1)
      @JsonKey(name: 'max_option_chars')
          required this.maxOptionChars,
      @HiveField(2)
      @JsonKey(name: 'max_options')
          required this.maxOptions,
      @HiveField(3)
      @JsonKey(name: 'min_expiration')
          required this.minExpiration});

  factory _$_UnifediApiInstancePollLimits.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiInstancePollLimitsFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'max_expiration')
  final int? maxExpiration;
  @override
  @HiveField(1)
  @JsonKey(name: 'max_option_chars')
  final int? maxOptionChars;
  @override
  @HiveField(2)
  @JsonKey(name: 'max_options')
  final int? maxOptions;
  @override
  @HiveField(3)
  @JsonKey(name: 'min_expiration')
  final int? minExpiration;

  @override
  String toString() {
    return 'UnifediApiInstancePollLimits(maxExpiration: $maxExpiration, maxOptionChars: $maxOptionChars, maxOptions: $maxOptions, minExpiration: $minExpiration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiInstancePollLimits &&
            (identical(other.maxExpiration, maxExpiration) ||
                const DeepCollectionEquality()
                    .equals(other.maxExpiration, maxExpiration)) &&
            (identical(other.maxOptionChars, maxOptionChars) ||
                const DeepCollectionEquality()
                    .equals(other.maxOptionChars, maxOptionChars)) &&
            (identical(other.maxOptions, maxOptions) ||
                const DeepCollectionEquality()
                    .equals(other.maxOptions, maxOptions)) &&
            (identical(other.minExpiration, minExpiration) ||
                const DeepCollectionEquality()
                    .equals(other.minExpiration, minExpiration)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(maxExpiration) ^
      const DeepCollectionEquality().hash(maxOptionChars) ^
      const DeepCollectionEquality().hash(maxOptions) ^
      const DeepCollectionEquality().hash(minExpiration);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiInstancePollLimitsCopyWith<_UnifediApiInstancePollLimits>
      get copyWith => __$UnifediApiInstancePollLimitsCopyWithImpl<
          _UnifediApiInstancePollLimits>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstancePollLimitsToJson(this);
  }
}

abstract class _UnifediApiInstancePollLimits
    implements UnifediApiInstancePollLimits {
  const factory _UnifediApiInstancePollLimits(
      {@HiveField(0)
      @JsonKey(name: 'max_expiration')
          required int? maxExpiration,
      @HiveField(1)
      @JsonKey(name: 'max_option_chars')
          required int? maxOptionChars,
      @HiveField(2)
      @JsonKey(name: 'max_options')
          required int? maxOptions,
      @HiveField(3)
      @JsonKey(name: 'min_expiration')
          required int? minExpiration}) = _$_UnifediApiInstancePollLimits;

  factory _UnifediApiInstancePollLimits.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiInstancePollLimits.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'max_expiration')
  int? get maxExpiration => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'max_option_chars')
  int? get maxOptionChars => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'max_options')
  int? get maxOptions => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  @JsonKey(name: 'min_expiration')
  int? get minExpiration => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiInstancePollLimitsCopyWith<_UnifediApiInstancePollLimits>
      get copyWith => throw _privateConstructorUsedError;
}
