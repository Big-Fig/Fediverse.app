// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_poll_option_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPollOptionMastodonAdapter
    _$UnifediApiPollOptionMastodonAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiPollOptionMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiPollOptionMastodonAdapterTearOff {
  const _$UnifediApiPollOptionMastodonAdapterTearOff();

  _UnifediApiPollOptionMastodonAdapter call(
      @HiveField(0) MastodonApiPollOption value) {
    return _UnifediApiPollOptionMastodonAdapter(
      value,
    );
  }

  UnifediApiPollOptionMastodonAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiPollOptionMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPollOptionMastodonAdapter =
    _$UnifediApiPollOptionMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiPollOptionMastodonAdapter {
  @HiveField(0)
  MastodonApiPollOption get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPollOptionMastodonAdapterCopyWith<
          UnifediApiPollOptionMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPollOptionMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiPollOptionMastodonAdapterCopyWith(
          UnifediApiPollOptionMastodonAdapter value,
          $Res Function(UnifediApiPollOptionMastodonAdapter) then) =
      _$UnifediApiPollOptionMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiPollOption value});

  $MastodonApiPollOptionCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiPollOptionMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiPollOptionMastodonAdapterCopyWith<$Res> {
  _$UnifediApiPollOptionMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiPollOptionMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPollOptionMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiPollOption,
    ));
  }

  @override
  $MastodonApiPollOptionCopyWith<$Res> get value {
    return $MastodonApiPollOptionCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiPollOptionMastodonAdapterCopyWith<$Res>
    implements $UnifediApiPollOptionMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiPollOptionMastodonAdapterCopyWith(
          _UnifediApiPollOptionMastodonAdapter value,
          $Res Function(_UnifediApiPollOptionMastodonAdapter) then) =
      __$UnifediApiPollOptionMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiPollOption value});

  @override
  $MastodonApiPollOptionCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiPollOptionMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiPollOptionMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiPollOptionMastodonAdapterCopyWith<$Res> {
  __$UnifediApiPollOptionMastodonAdapterCopyWithImpl(
      _UnifediApiPollOptionMastodonAdapter _value,
      $Res Function(_UnifediApiPollOptionMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiPollOptionMastodonAdapter));

  @override
  _UnifediApiPollOptionMastodonAdapter get _value =>
      super._value as _UnifediApiPollOptionMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiPollOptionMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiPollOption,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPollOptionMastodonAdapter
    extends _UnifediApiPollOptionMastodonAdapter {
  const _$_UnifediApiPollOptionMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiPollOptionMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiPollOptionMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiPollOption value;

  @override
  String toString() {
    return 'UnifediApiPollOptionMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiPollOptionMastodonAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPollOptionMastodonAdapterCopyWith<
          _UnifediApiPollOptionMastodonAdapter>
      get copyWith => __$UnifediApiPollOptionMastodonAdapterCopyWithImpl<
          _UnifediApiPollOptionMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPollOptionMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiPollOptionMastodonAdapter
    extends UnifediApiPollOptionMastodonAdapter {
  const factory _UnifediApiPollOptionMastodonAdapter(
          @HiveField(0) MastodonApiPollOption value) =
      _$_UnifediApiPollOptionMastodonAdapter;
  const _UnifediApiPollOptionMastodonAdapter._() : super._();

  factory _UnifediApiPollOptionMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiPollOptionMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiPollOption get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPollOptionMastodonAdapterCopyWith<
          _UnifediApiPollOptionMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
