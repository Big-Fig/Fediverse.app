// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_instance_poll_limits_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiInstancePollLimits _$PleromaApiInstancePollLimitsFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiInstancePollLimits.fromJson(json);
}

/// @nodoc
class _$PleromaApiInstancePollLimitsTearOff {
  const _$PleromaApiInstancePollLimitsTearOff();

  _PleromaApiInstancePollLimits call(
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
    return _PleromaApiInstancePollLimits(
      maxExpiration: maxExpiration,
      maxOptionChars: maxOptionChars,
      maxOptions: maxOptions,
      minExpiration: minExpiration,
    );
  }

  PleromaApiInstancePollLimits fromJson(Map<String, Object> json) {
    return PleromaApiInstancePollLimits.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiInstancePollLimits = _$PleromaApiInstancePollLimitsTearOff();

/// @nodoc
mixin _$PleromaApiInstancePollLimits {
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
  $PleromaApiInstancePollLimitsCopyWith<PleromaApiInstancePollLimits>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiInstancePollLimitsCopyWith<$Res> {
  factory $PleromaApiInstancePollLimitsCopyWith(
          PleromaApiInstancePollLimits value,
          $Res Function(PleromaApiInstancePollLimits) then) =
      _$PleromaApiInstancePollLimitsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) @JsonKey(name: 'max_expiration') int? maxExpiration,
      @HiveField(1) @JsonKey(name: 'max_option_chars') int? maxOptionChars,
      @HiveField(2) @JsonKey(name: 'max_options') int? maxOptions,
      @HiveField(3) @JsonKey(name: 'min_expiration') int? minExpiration});
}

/// @nodoc
class _$PleromaApiInstancePollLimitsCopyWithImpl<$Res>
    implements $PleromaApiInstancePollLimitsCopyWith<$Res> {
  _$PleromaApiInstancePollLimitsCopyWithImpl(this._value, this._then);

  final PleromaApiInstancePollLimits _value;
  // ignore: unused_field
  final $Res Function(PleromaApiInstancePollLimits) _then;

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
abstract class _$PleromaApiInstancePollLimitsCopyWith<$Res>
    implements $PleromaApiInstancePollLimitsCopyWith<$Res> {
  factory _$PleromaApiInstancePollLimitsCopyWith(
          _PleromaApiInstancePollLimits value,
          $Res Function(_PleromaApiInstancePollLimits) then) =
      __$PleromaApiInstancePollLimitsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) @JsonKey(name: 'max_expiration') int? maxExpiration,
      @HiveField(1) @JsonKey(name: 'max_option_chars') int? maxOptionChars,
      @HiveField(2) @JsonKey(name: 'max_options') int? maxOptions,
      @HiveField(3) @JsonKey(name: 'min_expiration') int? minExpiration});
}

/// @nodoc
class __$PleromaApiInstancePollLimitsCopyWithImpl<$Res>
    extends _$PleromaApiInstancePollLimitsCopyWithImpl<$Res>
    implements _$PleromaApiInstancePollLimitsCopyWith<$Res> {
  __$PleromaApiInstancePollLimitsCopyWithImpl(
      _PleromaApiInstancePollLimits _value,
      $Res Function(_PleromaApiInstancePollLimits) _then)
      : super(_value, (v) => _then(v as _PleromaApiInstancePollLimits));

  @override
  _PleromaApiInstancePollLimits get _value =>
      super._value as _PleromaApiInstancePollLimits;

  @override
  $Res call({
    Object? maxExpiration = freezed,
    Object? maxOptionChars = freezed,
    Object? maxOptions = freezed,
    Object? minExpiration = freezed,
  }) {
    return _then(_PleromaApiInstancePollLimits(
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
class _$_PleromaApiInstancePollLimits implements _PleromaApiInstancePollLimits {
  const _$_PleromaApiInstancePollLimits(
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

  factory _$_PleromaApiInstancePollLimits.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiInstancePollLimitsFromJson(json);

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
    return 'PleromaApiInstancePollLimits(maxExpiration: $maxExpiration, maxOptionChars: $maxOptionChars, maxOptions: $maxOptions, minExpiration: $minExpiration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiInstancePollLimits &&
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
  _$PleromaApiInstancePollLimitsCopyWith<_PleromaApiInstancePollLimits>
      get copyWith => __$PleromaApiInstancePollLimitsCopyWithImpl<
          _PleromaApiInstancePollLimits>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiInstancePollLimitsToJson(this);
  }
}

abstract class _PleromaApiInstancePollLimits
    implements PleromaApiInstancePollLimits {
  const factory _PleromaApiInstancePollLimits(
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
          required int? minExpiration}) = _$_PleromaApiInstancePollLimits;

  factory _PleromaApiInstancePollLimits.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiInstancePollLimits.fromJson;

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
  _$PleromaApiInstancePollLimitsCopyWith<_PleromaApiInstancePollLimits>
      get copyWith => throw _privateConstructorUsedError;
}
