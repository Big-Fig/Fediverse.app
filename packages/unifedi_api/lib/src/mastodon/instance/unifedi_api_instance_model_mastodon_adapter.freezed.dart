// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstanceMastodonAdapter _$UnifediApiInstanceMastodonAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiInstanceMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstanceMastodonAdapterTearOff {
  const _$UnifediApiInstanceMastodonAdapterTearOff();

  _UnifediApiInstanceMastodonAdapter call(
      @HiveField(0) MastodonApiInstance value) {
    return _UnifediApiInstanceMastodonAdapter(
      value,
    );
  }

  UnifediApiInstanceMastodonAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiInstanceMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstanceMastodonAdapter =
    _$UnifediApiInstanceMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiInstanceMastodonAdapter {
  @HiveField(0)
  MastodonApiInstance get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiInstanceMastodonAdapterCopyWith<UnifediApiInstanceMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstanceMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiInstanceMastodonAdapterCopyWith(
          UnifediApiInstanceMastodonAdapter value,
          $Res Function(UnifediApiInstanceMastodonAdapter) then) =
      _$UnifediApiInstanceMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiInstance value});

  $MastodonApiInstanceCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiInstanceMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiInstanceMastodonAdapterCopyWith<$Res> {
  _$UnifediApiInstanceMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiInstanceMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstanceMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiInstance,
    ));
  }

  @override
  $MastodonApiInstanceCopyWith<$Res> get value {
    return $MastodonApiInstanceCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiInstanceMastodonAdapterCopyWith<$Res>
    implements $UnifediApiInstanceMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiInstanceMastodonAdapterCopyWith(
          _UnifediApiInstanceMastodonAdapter value,
          $Res Function(_UnifediApiInstanceMastodonAdapter) then) =
      __$UnifediApiInstanceMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiInstance value});

  @override
  $MastodonApiInstanceCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiInstanceMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiInstanceMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiInstanceMastodonAdapterCopyWith<$Res> {
  __$UnifediApiInstanceMastodonAdapterCopyWithImpl(
      _UnifediApiInstanceMastodonAdapter _value,
      $Res Function(_UnifediApiInstanceMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiInstanceMastodonAdapter));

  @override
  _UnifediApiInstanceMastodonAdapter get _value =>
      super._value as _UnifediApiInstanceMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiInstanceMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiInstance,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiInstanceMastodonAdapter
    extends _UnifediApiInstanceMastodonAdapter {
  const _$_UnifediApiInstanceMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiInstanceMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiInstanceMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiInstance value;

  @override
  String toString() {
    return 'UnifediApiInstanceMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiInstanceMastodonAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiInstanceMastodonAdapterCopyWith<
          _UnifediApiInstanceMastodonAdapter>
      get copyWith => __$UnifediApiInstanceMastodonAdapterCopyWithImpl<
          _UnifediApiInstanceMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstanceMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiInstanceMastodonAdapter
    extends UnifediApiInstanceMastodonAdapter {
  const factory _UnifediApiInstanceMastodonAdapter(
          @HiveField(0) MastodonApiInstance value) =
      _$_UnifediApiInstanceMastodonAdapter;
  const _UnifediApiInstanceMastodonAdapter._() : super._();

  factory _UnifediApiInstanceMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiInstanceMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiInstance get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiInstanceMastodonAdapterCopyWith<
          _UnifediApiInstanceMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
