// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_post_status_poll_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPostStatusPollMastodonAdapter
    _$UnifediApiPostStatusPollMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiPostStatusPollMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiPostStatusPollMastodonAdapterTearOff {
  const _$UnifediApiPostStatusPollMastodonAdapterTearOff();

  _UnifediApiPostStatusPollMastodonAdapter call(
      @HiveField(0) MastodonApiPostStatusPoll value) {
    return _UnifediApiPostStatusPollMastodonAdapter(
      value,
    );
  }

  UnifediApiPostStatusPollMastodonAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiPostStatusPollMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPostStatusPollMastodonAdapter =
    _$UnifediApiPostStatusPollMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiPostStatusPollMastodonAdapter {
  @HiveField(0)
  MastodonApiPostStatusPoll get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPostStatusPollMastodonAdapterCopyWith<
          UnifediApiPostStatusPollMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPostStatusPollMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiPostStatusPollMastodonAdapterCopyWith(
          UnifediApiPostStatusPollMastodonAdapter value,
          $Res Function(UnifediApiPostStatusPollMastodonAdapter) then) =
      _$UnifediApiPostStatusPollMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiPostStatusPoll value});

  $MastodonApiPostStatusPollCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiPostStatusPollMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiPostStatusPollMastodonAdapterCopyWith<$Res> {
  _$UnifediApiPostStatusPollMastodonAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiPostStatusPollMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPostStatusPollMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiPostStatusPoll,
    ));
  }

  @override
  $MastodonApiPostStatusPollCopyWith<$Res> get value {
    return $MastodonApiPostStatusPollCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiPostStatusPollMastodonAdapterCopyWith<$Res>
    implements $UnifediApiPostStatusPollMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiPostStatusPollMastodonAdapterCopyWith(
          _UnifediApiPostStatusPollMastodonAdapter value,
          $Res Function(_UnifediApiPostStatusPollMastodonAdapter) then) =
      __$UnifediApiPostStatusPollMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiPostStatusPoll value});

  @override
  $MastodonApiPostStatusPollCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiPostStatusPollMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiPostStatusPollMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiPostStatusPollMastodonAdapterCopyWith<$Res> {
  __$UnifediApiPostStatusPollMastodonAdapterCopyWithImpl(
      _UnifediApiPostStatusPollMastodonAdapter _value,
      $Res Function(_UnifediApiPostStatusPollMastodonAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiPostStatusPollMastodonAdapter));

  @override
  _UnifediApiPostStatusPollMastodonAdapter get _value =>
      super._value as _UnifediApiPostStatusPollMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiPostStatusPollMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiPostStatusPoll,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPostStatusPollMastodonAdapter
    extends _UnifediApiPostStatusPollMastodonAdapter {
  const _$_UnifediApiPostStatusPollMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiPostStatusPollMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiPostStatusPollMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiPostStatusPoll value;

  @override
  String toString() {
    return 'UnifediApiPostStatusPollMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiPostStatusPollMastodonAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPostStatusPollMastodonAdapterCopyWith<
          _UnifediApiPostStatusPollMastodonAdapter>
      get copyWith => __$UnifediApiPostStatusPollMastodonAdapterCopyWithImpl<
          _UnifediApiPostStatusPollMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPostStatusPollMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiPostStatusPollMastodonAdapter
    extends UnifediApiPostStatusPollMastodonAdapter {
  const factory _UnifediApiPostStatusPollMastodonAdapter(
          @HiveField(0) MastodonApiPostStatusPoll value) =
      _$_UnifediApiPostStatusPollMastodonAdapter;
  const _UnifediApiPostStatusPollMastodonAdapter._() : super._();

  factory _UnifediApiPostStatusPollMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiPostStatusPollMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiPostStatusPoll get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPostStatusPollMastodonAdapterCopyWith<
          _UnifediApiPostStatusPollMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
