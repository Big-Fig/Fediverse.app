// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_post_status_poll_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPostStatusPoll _$UnifediApiPostStatusPollFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiPostStatusPoll.fromJson(json);
}

/// @nodoc
class _$UnifediApiPostStatusPollTearOff {
  const _$UnifediApiPostStatusPollTearOff();

  _UnifediApiPostStatusPoll call(
      {@HiveField(0)
      @JsonKey(name: 'expires_in')
          required int expiresInSeconds,
      @HiveField(1)
      @JsonKey(name: 'hide_totals', includeIfNull: false)
          required bool hideTotals,
      @HiveField(2)
          required bool multiple,
      @HiveField(3)
      @JsonKey(name: 'options')
          required List<String> options}) {
    return _UnifediApiPostStatusPoll(
      expiresInSeconds: expiresInSeconds,
      hideTotals: hideTotals,
      multiple: multiple,
      options: options,
    );
  }

  UnifediApiPostStatusPoll fromJson(Map<String, Object?> json) {
    return UnifediApiPostStatusPoll.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPostStatusPoll = _$UnifediApiPostStatusPollTearOff();

/// @nodoc
mixin _$UnifediApiPostStatusPoll {
  @HiveField(0)
  @JsonKey(name: 'expires_in')
  int get expiresInSeconds => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'hide_totals', includeIfNull: false)
  bool get hideTotals => throw _privateConstructorUsedError;
  @HiveField(2)
  bool get multiple => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'options')
  List<String> get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPostStatusPollCopyWith<UnifediApiPostStatusPoll> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPostStatusPollCopyWith<$Res> {
  factory $UnifediApiPostStatusPollCopyWith(UnifediApiPostStatusPoll value,
          $Res Function(UnifediApiPostStatusPoll) then) =
      _$UnifediApiPostStatusPollCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'expires_in')
          int expiresInSeconds,
      @HiveField(1)
      @JsonKey(name: 'hide_totals', includeIfNull: false)
          bool hideTotals,
      @HiveField(2)
          bool multiple,
      @HiveField(3)
      @JsonKey(name: 'options')
          List<String> options});
}

/// @nodoc
class _$UnifediApiPostStatusPollCopyWithImpl<$Res>
    implements $UnifediApiPostStatusPollCopyWith<$Res> {
  _$UnifediApiPostStatusPollCopyWithImpl(this._value, this._then);

  final UnifediApiPostStatusPoll _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPostStatusPoll) _then;

  @override
  $Res call({
    Object? expiresInSeconds = freezed,
    Object? hideTotals = freezed,
    Object? multiple = freezed,
    Object? options = freezed,
  }) {
    return _then(_value.copyWith(
      expiresInSeconds: expiresInSeconds == freezed
          ? _value.expiresInSeconds
          : expiresInSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      hideTotals: hideTotals == freezed
          ? _value.hideTotals
          : hideTotals // ignore: cast_nullable_to_non_nullable
              as bool,
      multiple: multiple == freezed
          ? _value.multiple
          : multiple // ignore: cast_nullable_to_non_nullable
              as bool,
      options: options == freezed
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiPostStatusPollCopyWith<$Res>
    implements $UnifediApiPostStatusPollCopyWith<$Res> {
  factory _$UnifediApiPostStatusPollCopyWith(_UnifediApiPostStatusPoll value,
          $Res Function(_UnifediApiPostStatusPoll) then) =
      __$UnifediApiPostStatusPollCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'expires_in')
          int expiresInSeconds,
      @HiveField(1)
      @JsonKey(name: 'hide_totals', includeIfNull: false)
          bool hideTotals,
      @HiveField(2)
          bool multiple,
      @HiveField(3)
      @JsonKey(name: 'options')
          List<String> options});
}

/// @nodoc
class __$UnifediApiPostStatusPollCopyWithImpl<$Res>
    extends _$UnifediApiPostStatusPollCopyWithImpl<$Res>
    implements _$UnifediApiPostStatusPollCopyWith<$Res> {
  __$UnifediApiPostStatusPollCopyWithImpl(_UnifediApiPostStatusPoll _value,
      $Res Function(_UnifediApiPostStatusPoll) _then)
      : super(_value, (v) => _then(v as _UnifediApiPostStatusPoll));

  @override
  _UnifediApiPostStatusPoll get _value =>
      super._value as _UnifediApiPostStatusPoll;

  @override
  $Res call({
    Object? expiresInSeconds = freezed,
    Object? hideTotals = freezed,
    Object? multiple = freezed,
    Object? options = freezed,
  }) {
    return _then(_UnifediApiPostStatusPoll(
      expiresInSeconds: expiresInSeconds == freezed
          ? _value.expiresInSeconds
          : expiresInSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      hideTotals: hideTotals == freezed
          ? _value.hideTotals
          : hideTotals // ignore: cast_nullable_to_non_nullable
              as bool,
      multiple: multiple == freezed
          ? _value.multiple
          : multiple // ignore: cast_nullable_to_non_nullable
              as bool,
      options: options == freezed
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPostStatusPoll implements _UnifediApiPostStatusPoll {
  const _$_UnifediApiPostStatusPoll(
      {@HiveField(0)
      @JsonKey(name: 'expires_in')
          required this.expiresInSeconds,
      @HiveField(1)
      @JsonKey(name: 'hide_totals', includeIfNull: false)
          required this.hideTotals,
      @HiveField(2)
          required this.multiple,
      @HiveField(3)
      @JsonKey(name: 'options')
          required this.options});

  factory _$_UnifediApiPostStatusPoll.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiPostStatusPollFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'expires_in')
  final int expiresInSeconds;
  @override
  @HiveField(1)
  @JsonKey(name: 'hide_totals', includeIfNull: false)
  final bool hideTotals;
  @override
  @HiveField(2)
  final bool multiple;
  @override
  @HiveField(3)
  @JsonKey(name: 'options')
  final List<String> options;

  @override
  String toString() {
    return 'UnifediApiPostStatusPoll(expiresInSeconds: $expiresInSeconds, hideTotals: $hideTotals, multiple: $multiple, options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiPostStatusPoll &&
            (identical(other.expiresInSeconds, expiresInSeconds) ||
                other.expiresInSeconds == expiresInSeconds) &&
            (identical(other.hideTotals, hideTotals) ||
                other.hideTotals == hideTotals) &&
            (identical(other.multiple, multiple) ||
                other.multiple == multiple) &&
            const DeepCollectionEquality().equals(other.options, options));
  }

  @override
  int get hashCode => Object.hash(runtimeType, expiresInSeconds, hideTotals,
      multiple, const DeepCollectionEquality().hash(options));

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPostStatusPollCopyWith<_UnifediApiPostStatusPoll> get copyWith =>
      __$UnifediApiPostStatusPollCopyWithImpl<_UnifediApiPostStatusPoll>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPostStatusPollToJson(this);
  }
}

abstract class _UnifediApiPostStatusPoll implements UnifediApiPostStatusPoll {
  const factory _UnifediApiPostStatusPoll(
      {@HiveField(0)
      @JsonKey(name: 'expires_in')
          required int expiresInSeconds,
      @HiveField(1)
      @JsonKey(name: 'hide_totals', includeIfNull: false)
          required bool hideTotals,
      @HiveField(2)
          required bool multiple,
      @HiveField(3)
      @JsonKey(name: 'options')
          required List<String> options}) = _$_UnifediApiPostStatusPoll;

  factory _UnifediApiPostStatusPoll.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiPostStatusPoll.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'expires_in')
  int get expiresInSeconds;
  @override
  @HiveField(1)
  @JsonKey(name: 'hide_totals', includeIfNull: false)
  bool get hideTotals;
  @override
  @HiveField(2)
  bool get multiple;
  @override
  @HiveField(3)
  @JsonKey(name: 'options')
  List<String> get options;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPostStatusPollCopyWith<_UnifediApiPostStatusPoll> get copyWith =>
      throw _privateConstructorUsedError;
}
