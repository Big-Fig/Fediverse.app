// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_application_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiApplicationMastodonAdapter
    _$UnifediApiApplicationMastodonAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiApplicationMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiApplicationMastodonAdapterTearOff {
  const _$UnifediApiApplicationMastodonAdapterTearOff();

  _UnifediApiApplicationMastodonAdapter call(
      @HiveField(0) MastodonApiApplication value) {
    return _UnifediApiApplicationMastodonAdapter(
      value,
    );
  }

  UnifediApiApplicationMastodonAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiApplicationMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiApplicationMastodonAdapter =
    _$UnifediApiApplicationMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiApplicationMastodonAdapter {
  @HiveField(0)
  MastodonApiApplication get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiApplicationMastodonAdapterCopyWith<
          UnifediApiApplicationMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiApplicationMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiApplicationMastodonAdapterCopyWith(
          UnifediApiApplicationMastodonAdapter value,
          $Res Function(UnifediApiApplicationMastodonAdapter) then) =
      _$UnifediApiApplicationMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiApplication value});

  $MastodonApiApplicationCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiApplicationMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiApplicationMastodonAdapterCopyWith<$Res> {
  _$UnifediApiApplicationMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiApplicationMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiApplicationMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiApplication,
    ));
  }

  @override
  $MastodonApiApplicationCopyWith<$Res> get value {
    return $MastodonApiApplicationCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiApplicationMastodonAdapterCopyWith<$Res>
    implements $UnifediApiApplicationMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiApplicationMastodonAdapterCopyWith(
          _UnifediApiApplicationMastodonAdapter value,
          $Res Function(_UnifediApiApplicationMastodonAdapter) then) =
      __$UnifediApiApplicationMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiApplication value});

  @override
  $MastodonApiApplicationCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiApplicationMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiApplicationMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiApplicationMastodonAdapterCopyWith<$Res> {
  __$UnifediApiApplicationMastodonAdapterCopyWithImpl(
      _UnifediApiApplicationMastodonAdapter _value,
      $Res Function(_UnifediApiApplicationMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiApplicationMastodonAdapter));

  @override
  _UnifediApiApplicationMastodonAdapter get _value =>
      super._value as _UnifediApiApplicationMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiApplicationMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiApplication,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiApplicationMastodonAdapter
    extends _UnifediApiApplicationMastodonAdapter {
  const _$_UnifediApiApplicationMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiApplicationMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiApplicationMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiApplication value;

  @override
  String toString() {
    return 'UnifediApiApplicationMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiApplicationMastodonAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiApplicationMastodonAdapterCopyWith<
          _UnifediApiApplicationMastodonAdapter>
      get copyWith => __$UnifediApiApplicationMastodonAdapterCopyWithImpl<
          _UnifediApiApplicationMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiApplicationMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiApplicationMastodonAdapter
    extends UnifediApiApplicationMastodonAdapter {
  const factory _UnifediApiApplicationMastodonAdapter(
          @HiveField(0) MastodonApiApplication value) =
      _$_UnifediApiApplicationMastodonAdapter;
  const _UnifediApiApplicationMastodonAdapter._() : super._();

  factory _UnifediApiApplicationMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiApplicationMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiApplication get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiApplicationMastodonAdapterCopyWith<
          _UnifediApiApplicationMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
