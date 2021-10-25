// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_scheduled_status_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiScheduledStatusMastodonAdapter
    _$UnifediApiScheduledStatusMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiScheduledStatusMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiScheduledStatusMastodonAdapterTearOff {
  const _$UnifediApiScheduledStatusMastodonAdapterTearOff();

  _UnifediApiScheduledStatusMastodonAdapter call(
      @HiveField(0) MastodonApiScheduledStatus value) {
    return _UnifediApiScheduledStatusMastodonAdapter(
      value,
    );
  }

  UnifediApiScheduledStatusMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiScheduledStatusMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiScheduledStatusMastodonAdapter =
    _$UnifediApiScheduledStatusMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiScheduledStatusMastodonAdapter {
  @HiveField(0)
  MastodonApiScheduledStatus get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiScheduledStatusMastodonAdapterCopyWith<
          UnifediApiScheduledStatusMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiScheduledStatusMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiScheduledStatusMastodonAdapterCopyWith(
          UnifediApiScheduledStatusMastodonAdapter value,
          $Res Function(UnifediApiScheduledStatusMastodonAdapter) then) =
      _$UnifediApiScheduledStatusMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiScheduledStatus value});

  $MastodonApiScheduledStatusCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiScheduledStatusMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiScheduledStatusMastodonAdapterCopyWith<$Res> {
  _$UnifediApiScheduledStatusMastodonAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiScheduledStatusMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiScheduledStatusMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiScheduledStatus,
    ));
  }

  @override
  $MastodonApiScheduledStatusCopyWith<$Res> get value {
    return $MastodonApiScheduledStatusCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiScheduledStatusMastodonAdapterCopyWith<$Res>
    implements $UnifediApiScheduledStatusMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiScheduledStatusMastodonAdapterCopyWith(
          _UnifediApiScheduledStatusMastodonAdapter value,
          $Res Function(_UnifediApiScheduledStatusMastodonAdapter) then) =
      __$UnifediApiScheduledStatusMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiScheduledStatus value});

  @override
  $MastodonApiScheduledStatusCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiScheduledStatusMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiScheduledStatusMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiScheduledStatusMastodonAdapterCopyWith<$Res> {
  __$UnifediApiScheduledStatusMastodonAdapterCopyWithImpl(
      _UnifediApiScheduledStatusMastodonAdapter _value,
      $Res Function(_UnifediApiScheduledStatusMastodonAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiScheduledStatusMastodonAdapter));

  @override
  _UnifediApiScheduledStatusMastodonAdapter get _value =>
      super._value as _UnifediApiScheduledStatusMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiScheduledStatusMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiScheduledStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiScheduledStatusMastodonAdapter
    extends _UnifediApiScheduledStatusMastodonAdapter {
  const _$_UnifediApiScheduledStatusMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiScheduledStatusMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiScheduledStatusMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiScheduledStatus value;

  @override
  String toString() {
    return 'UnifediApiScheduledStatusMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiScheduledStatusMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiScheduledStatusMastodonAdapterCopyWith<
          _UnifediApiScheduledStatusMastodonAdapter>
      get copyWith => __$UnifediApiScheduledStatusMastodonAdapterCopyWithImpl<
          _UnifediApiScheduledStatusMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiScheduledStatusMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiScheduledStatusMastodonAdapter
    extends UnifediApiScheduledStatusMastodonAdapter {
  const factory _UnifediApiScheduledStatusMastodonAdapter(
          @HiveField(0) MastodonApiScheduledStatus value) =
      _$_UnifediApiScheduledStatusMastodonAdapter;
  const _UnifediApiScheduledStatusMastodonAdapter._() : super._();

  factory _UnifediApiScheduledStatusMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiScheduledStatusMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiScheduledStatus get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiScheduledStatusMastodonAdapterCopyWith<
          _UnifediApiScheduledStatusMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
