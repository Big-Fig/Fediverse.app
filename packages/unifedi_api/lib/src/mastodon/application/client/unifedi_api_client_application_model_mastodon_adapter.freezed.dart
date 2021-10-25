// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_client_application_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiClientApplicationMastodonAdapter
    _$UnifediApiClientApplicationMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiClientApplicationMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiClientApplicationMastodonAdapterTearOff {
  const _$UnifediApiClientApplicationMastodonAdapterTearOff();

  _UnifediApiClientApplicationMastodonAdapter call(
      @HiveField(0) MastodonApiClientApplication value) {
    return _UnifediApiClientApplicationMastodonAdapter(
      value,
    );
  }

  UnifediApiClientApplicationMastodonAdapter fromJson(
      Map<String, Object> json) {
    return UnifediApiClientApplicationMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiClientApplicationMastodonAdapter =
    _$UnifediApiClientApplicationMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiClientApplicationMastodonAdapter {
  @HiveField(0)
  MastodonApiClientApplication get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiClientApplicationMastodonAdapterCopyWith<
          UnifediApiClientApplicationMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiClientApplicationMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiClientApplicationMastodonAdapterCopyWith(
          UnifediApiClientApplicationMastodonAdapter value,
          $Res Function(UnifediApiClientApplicationMastodonAdapter) then) =
      _$UnifediApiClientApplicationMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiClientApplication value});

  $MastodonApiClientApplicationCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiClientApplicationMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiClientApplicationMastodonAdapterCopyWith<$Res> {
  _$UnifediApiClientApplicationMastodonAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiClientApplicationMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiClientApplicationMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiClientApplication,
    ));
  }

  @override
  $MastodonApiClientApplicationCopyWith<$Res> get value {
    return $MastodonApiClientApplicationCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiClientApplicationMastodonAdapterCopyWith<$Res>
    implements $UnifediApiClientApplicationMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiClientApplicationMastodonAdapterCopyWith(
          _UnifediApiClientApplicationMastodonAdapter value,
          $Res Function(_UnifediApiClientApplicationMastodonAdapter) then) =
      __$UnifediApiClientApplicationMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiClientApplication value});

  @override
  $MastodonApiClientApplicationCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiClientApplicationMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiClientApplicationMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiClientApplicationMastodonAdapterCopyWith<$Res> {
  __$UnifediApiClientApplicationMastodonAdapterCopyWithImpl(
      _UnifediApiClientApplicationMastodonAdapter _value,
      $Res Function(_UnifediApiClientApplicationMastodonAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiClientApplicationMastodonAdapter));

  @override
  _UnifediApiClientApplicationMastodonAdapter get _value =>
      super._value as _UnifediApiClientApplicationMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiClientApplicationMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiClientApplication,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiClientApplicationMastodonAdapter
    extends _UnifediApiClientApplicationMastodonAdapter {
  const _$_UnifediApiClientApplicationMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiClientApplicationMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiClientApplicationMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiClientApplication value;

  @override
  String toString() {
    return 'UnifediApiClientApplicationMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiClientApplicationMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiClientApplicationMastodonAdapterCopyWith<
          _UnifediApiClientApplicationMastodonAdapter>
      get copyWith => __$UnifediApiClientApplicationMastodonAdapterCopyWithImpl<
          _UnifediApiClientApplicationMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiClientApplicationMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiClientApplicationMastodonAdapter
    extends UnifediApiClientApplicationMastodonAdapter {
  const factory _UnifediApiClientApplicationMastodonAdapter(
          @HiveField(0) MastodonApiClientApplication value) =
      _$_UnifediApiClientApplicationMastodonAdapter;
  const _UnifediApiClientApplicationMastodonAdapter._() : super._();

  factory _UnifediApiClientApplicationMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiClientApplicationMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiClientApplication get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiClientApplicationMastodonAdapterCopyWith<
          _UnifediApiClientApplicationMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
