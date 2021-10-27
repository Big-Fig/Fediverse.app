// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_poll_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPollMastodonAdapter _$UnifediApiPollMastodonAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiPollMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiPollMastodonAdapterTearOff {
  const _$UnifediApiPollMastodonAdapterTearOff();

  _UnifediApiPollMastodonAdapter call(@HiveField(0) MastodonApiPoll value) {
    return _UnifediApiPollMastodonAdapter(
      value,
    );
  }

  UnifediApiPollMastodonAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiPollMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPollMastodonAdapter = _$UnifediApiPollMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiPollMastodonAdapter {
  @HiveField(0)
  MastodonApiPoll get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPollMastodonAdapterCopyWith<UnifediApiPollMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPollMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiPollMastodonAdapterCopyWith(
          UnifediApiPollMastodonAdapter value,
          $Res Function(UnifediApiPollMastodonAdapter) then) =
      _$UnifediApiPollMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiPoll value});

  $MastodonApiPollCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiPollMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiPollMastodonAdapterCopyWith<$Res> {
  _$UnifediApiPollMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiPollMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPollMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiPoll,
    ));
  }

  @override
  $MastodonApiPollCopyWith<$Res> get value {
    return $MastodonApiPollCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiPollMastodonAdapterCopyWith<$Res>
    implements $UnifediApiPollMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiPollMastodonAdapterCopyWith(
          _UnifediApiPollMastodonAdapter value,
          $Res Function(_UnifediApiPollMastodonAdapter) then) =
      __$UnifediApiPollMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiPoll value});

  @override
  $MastodonApiPollCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiPollMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiPollMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiPollMastodonAdapterCopyWith<$Res> {
  __$UnifediApiPollMastodonAdapterCopyWithImpl(
      _UnifediApiPollMastodonAdapter _value,
      $Res Function(_UnifediApiPollMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiPollMastodonAdapter));

  @override
  _UnifediApiPollMastodonAdapter get _value =>
      super._value as _UnifediApiPollMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiPollMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiPoll,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPollMastodonAdapter extends _UnifediApiPollMastodonAdapter {
  const _$_UnifediApiPollMastodonAdapter(@HiveField(0) this.value) : super._();

  factory _$_UnifediApiPollMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiPollMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiPoll value;

  @override
  String toString() {
    return 'UnifediApiPollMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiPollMastodonAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPollMastodonAdapterCopyWith<_UnifediApiPollMastodonAdapter>
      get copyWith => __$UnifediApiPollMastodonAdapterCopyWithImpl<
          _UnifediApiPollMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPollMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiPollMastodonAdapter
    extends UnifediApiPollMastodonAdapter {
  const factory _UnifediApiPollMastodonAdapter(
      @HiveField(0) MastodonApiPoll value) = _$_UnifediApiPollMastodonAdapter;
  const _UnifediApiPollMastodonAdapter._() : super._();

  factory _UnifediApiPollMastodonAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiPollMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiPoll get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPollMastodonAdapterCopyWith<_UnifediApiPollMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
