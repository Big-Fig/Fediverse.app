// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_post_status_poll_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiPostStatusPoll _$MastodonApiPostStatusPollFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiPostStatusPoll.fromJson(json);
}

/// @nodoc
class _$MastodonApiPostStatusPollTearOff {
  const _$MastodonApiPostStatusPollTearOff();

  _MastodonApiPostStatusPoll call(
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
    return _MastodonApiPostStatusPoll(
      expiresInSeconds: expiresInSeconds,
      hideTotals: hideTotals,
      multiple: multiple,
      options: options,
    );
  }

  MastodonApiPostStatusPoll fromJson(Map<String, Object> json) {
    return MastodonApiPostStatusPoll.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiPostStatusPoll = _$MastodonApiPostStatusPollTearOff();

/// @nodoc
mixin _$MastodonApiPostStatusPoll {
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
  $MastodonApiPostStatusPollCopyWith<MastodonApiPostStatusPoll> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiPostStatusPollCopyWith<$Res> {
  factory $MastodonApiPostStatusPollCopyWith(MastodonApiPostStatusPoll value,
          $Res Function(MastodonApiPostStatusPoll) then) =
      _$MastodonApiPostStatusPollCopyWithImpl<$Res>;
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
class _$MastodonApiPostStatusPollCopyWithImpl<$Res>
    implements $MastodonApiPostStatusPollCopyWith<$Res> {
  _$MastodonApiPostStatusPollCopyWithImpl(this._value, this._then);

  final MastodonApiPostStatusPoll _value;
  // ignore: unused_field
  final $Res Function(MastodonApiPostStatusPoll) _then;

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
abstract class _$MastodonApiPostStatusPollCopyWith<$Res>
    implements $MastodonApiPostStatusPollCopyWith<$Res> {
  factory _$MastodonApiPostStatusPollCopyWith(_MastodonApiPostStatusPoll value,
          $Res Function(_MastodonApiPostStatusPoll) then) =
      __$MastodonApiPostStatusPollCopyWithImpl<$Res>;
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
class __$MastodonApiPostStatusPollCopyWithImpl<$Res>
    extends _$MastodonApiPostStatusPollCopyWithImpl<$Res>
    implements _$MastodonApiPostStatusPollCopyWith<$Res> {
  __$MastodonApiPostStatusPollCopyWithImpl(_MastodonApiPostStatusPoll _value,
      $Res Function(_MastodonApiPostStatusPoll) _then)
      : super(_value, (v) => _then(v as _MastodonApiPostStatusPoll));

  @override
  _MastodonApiPostStatusPoll get _value =>
      super._value as _MastodonApiPostStatusPoll;

  @override
  $Res call({
    Object? expiresInSeconds = freezed,
    Object? hideTotals = freezed,
    Object? multiple = freezed,
    Object? options = freezed,
  }) {
    return _then(_MastodonApiPostStatusPoll(
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
class _$_MastodonApiPostStatusPoll implements _MastodonApiPostStatusPoll {
  const _$_MastodonApiPostStatusPoll(
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

  factory _$_MastodonApiPostStatusPoll.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiPostStatusPollFromJson(json);

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
    return 'MastodonApiPostStatusPoll(expiresInSeconds: $expiresInSeconds, hideTotals: $hideTotals, multiple: $multiple, options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiPostStatusPoll &&
            (identical(other.expiresInSeconds, expiresInSeconds) ||
                const DeepCollectionEquality()
                    .equals(other.expiresInSeconds, expiresInSeconds)) &&
            (identical(other.hideTotals, hideTotals) ||
                const DeepCollectionEquality()
                    .equals(other.hideTotals, hideTotals)) &&
            (identical(other.multiple, multiple) ||
                const DeepCollectionEquality()
                    .equals(other.multiple, multiple)) &&
            (identical(other.options, options) ||
                const DeepCollectionEquality().equals(other.options, options)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(expiresInSeconds) ^
      const DeepCollectionEquality().hash(hideTotals) ^
      const DeepCollectionEquality().hash(multiple) ^
      const DeepCollectionEquality().hash(options);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiPostStatusPollCopyWith<_MastodonApiPostStatusPoll>
      get copyWith =>
          __$MastodonApiPostStatusPollCopyWithImpl<_MastodonApiPostStatusPoll>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiPostStatusPollToJson(this);
  }
}

abstract class _MastodonApiPostStatusPoll implements MastodonApiPostStatusPoll {
  const factory _MastodonApiPostStatusPoll(
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
          required List<String> options}) = _$_MastodonApiPostStatusPoll;

  factory _MastodonApiPostStatusPoll.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiPostStatusPoll.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'expires_in')
  int get expiresInSeconds => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'hide_totals', includeIfNull: false)
  bool get hideTotals => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  bool get multiple => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  @JsonKey(name: 'options')
  List<String> get options => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiPostStatusPollCopyWith<_MastodonApiPostStatusPoll>
      get copyWith => throw _privateConstructorUsedError;
}
