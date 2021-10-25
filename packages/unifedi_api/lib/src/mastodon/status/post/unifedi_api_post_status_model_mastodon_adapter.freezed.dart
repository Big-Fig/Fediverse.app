// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_post_status_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPostStatusMastodonAdapter
    _$UnifediApiPostStatusMastodonAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiPostStatusMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiPostStatusMastodonAdapterTearOff {
  const _$UnifediApiPostStatusMastodonAdapterTearOff();

  _UnifediApiPostStatusMastodonAdapter call(
      @HiveField(0) MastodonApiPostStatus value) {
    return _UnifediApiPostStatusMastodonAdapter(
      value,
    );
  }

  UnifediApiPostStatusMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiPostStatusMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPostStatusMastodonAdapter =
    _$UnifediApiPostStatusMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiPostStatusMastodonAdapter {
  @HiveField(0)
  MastodonApiPostStatus get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPostStatusMastodonAdapterCopyWith<
          UnifediApiPostStatusMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPostStatusMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiPostStatusMastodonAdapterCopyWith(
          UnifediApiPostStatusMastodonAdapter value,
          $Res Function(UnifediApiPostStatusMastodonAdapter) then) =
      _$UnifediApiPostStatusMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiPostStatus value});

  $MastodonApiPostStatusCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiPostStatusMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiPostStatusMastodonAdapterCopyWith<$Res> {
  _$UnifediApiPostStatusMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiPostStatusMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPostStatusMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiPostStatus,
    ));
  }

  @override
  $MastodonApiPostStatusCopyWith<$Res> get value {
    return $MastodonApiPostStatusCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiPostStatusMastodonAdapterCopyWith<$Res>
    implements $UnifediApiPostStatusMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiPostStatusMastodonAdapterCopyWith(
          _UnifediApiPostStatusMastodonAdapter value,
          $Res Function(_UnifediApiPostStatusMastodonAdapter) then) =
      __$UnifediApiPostStatusMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiPostStatus value});

  @override
  $MastodonApiPostStatusCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiPostStatusMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiPostStatusMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiPostStatusMastodonAdapterCopyWith<$Res> {
  __$UnifediApiPostStatusMastodonAdapterCopyWithImpl(
      _UnifediApiPostStatusMastodonAdapter _value,
      $Res Function(_UnifediApiPostStatusMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiPostStatusMastodonAdapter));

  @override
  _UnifediApiPostStatusMastodonAdapter get _value =>
      super._value as _UnifediApiPostStatusMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiPostStatusMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiPostStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPostStatusMastodonAdapter
    extends _UnifediApiPostStatusMastodonAdapter {
  const _$_UnifediApiPostStatusMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiPostStatusMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiPostStatusMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiPostStatus value;

  @override
  String toString() {
    return 'UnifediApiPostStatusMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiPostStatusMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPostStatusMastodonAdapterCopyWith<
          _UnifediApiPostStatusMastodonAdapter>
      get copyWith => __$UnifediApiPostStatusMastodonAdapterCopyWithImpl<
          _UnifediApiPostStatusMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPostStatusMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiPostStatusMastodonAdapter
    extends UnifediApiPostStatusMastodonAdapter {
  const factory _UnifediApiPostStatusMastodonAdapter(
          @HiveField(0) MastodonApiPostStatus value) =
      _$_UnifediApiPostStatusMastodonAdapter;
  const _UnifediApiPostStatusMastodonAdapter._() : super._();

  factory _UnifediApiPostStatusMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiPostStatusMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiPostStatus get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPostStatusMastodonAdapterCopyWith<
          _UnifediApiPostStatusMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
