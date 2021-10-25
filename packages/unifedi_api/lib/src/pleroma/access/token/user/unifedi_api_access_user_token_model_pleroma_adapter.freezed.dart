// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_access_user_token_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccessUserTokenPleromaAdapter
    _$UnifediApiAccessUserTokenPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiAccessUserTokenPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessUserTokenPleromaAdapterTearOff {
  const _$UnifediApiAccessUserTokenPleromaAdapterTearOff();

  _UnifediApiAccessUserTokenPleromaAdapter call(
      @HiveField(0) PleromaApiAccessUserToken value) {
    return _UnifediApiAccessUserTokenPleromaAdapter(
      value,
    );
  }

  UnifediApiAccessUserTokenPleromaAdapter fromJson(Map<String, Object> json) {
    return UnifediApiAccessUserTokenPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccessUserTokenPleromaAdapter =
    _$UnifediApiAccessUserTokenPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAccessUserTokenPleromaAdapter {
  @HiveField(0)
  PleromaApiAccessUserToken get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessUserTokenPleromaAdapterCopyWith<
          UnifediApiAccessUserTokenPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessUserTokenPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiAccessUserTokenPleromaAdapterCopyWith(
          UnifediApiAccessUserTokenPleromaAdapter value,
          $Res Function(UnifediApiAccessUserTokenPleromaAdapter) then) =
      _$UnifediApiAccessUserTokenPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiAccessUserToken value});

  $PleromaApiAccessUserTokenCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAccessUserTokenPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiAccessUserTokenPleromaAdapterCopyWith<$Res> {
  _$UnifediApiAccessUserTokenPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiAccessUserTokenPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccessUserTokenPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessUserToken,
    ));
  }

  @override
  $PleromaApiAccessUserTokenCopyWith<$Res> get value {
    return $PleromaApiAccessUserTokenCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccessUserTokenPleromaAdapterCopyWith<$Res>
    implements $UnifediApiAccessUserTokenPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiAccessUserTokenPleromaAdapterCopyWith(
          _UnifediApiAccessUserTokenPleromaAdapter value,
          $Res Function(_UnifediApiAccessUserTokenPleromaAdapter) then) =
      __$UnifediApiAccessUserTokenPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiAccessUserToken value});

  @override
  $PleromaApiAccessUserTokenCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAccessUserTokenPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAccessUserTokenPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAccessUserTokenPleromaAdapterCopyWith<$Res> {
  __$UnifediApiAccessUserTokenPleromaAdapterCopyWithImpl(
      _UnifediApiAccessUserTokenPleromaAdapter _value,
      $Res Function(_UnifediApiAccessUserTokenPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiAccessUserTokenPleromaAdapter));

  @override
  _UnifediApiAccessUserTokenPleromaAdapter get _value =>
      super._value as _UnifediApiAccessUserTokenPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAccessUserTokenPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessUserToken,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccessUserTokenPleromaAdapter
    extends _UnifediApiAccessUserTokenPleromaAdapter {
  const _$_UnifediApiAccessUserTokenPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAccessUserTokenPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccessUserTokenPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiAccessUserToken value;

  @override
  String toString() {
    return 'UnifediApiAccessUserTokenPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiAccessUserTokenPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccessUserTokenPleromaAdapterCopyWith<
          _UnifediApiAccessUserTokenPleromaAdapter>
      get copyWith => __$UnifediApiAccessUserTokenPleromaAdapterCopyWithImpl<
          _UnifediApiAccessUserTokenPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessUserTokenPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiAccessUserTokenPleromaAdapter
    extends UnifediApiAccessUserTokenPleromaAdapter {
  const factory _UnifediApiAccessUserTokenPleromaAdapter(
          @HiveField(0) PleromaApiAccessUserToken value) =
      _$_UnifediApiAccessUserTokenPleromaAdapter;
  const _UnifediApiAccessUserTokenPleromaAdapter._() : super._();

  factory _UnifediApiAccessUserTokenPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiAccessUserTokenPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiAccessUserToken get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessUserTokenPleromaAdapterCopyWith<
          _UnifediApiAccessUserTokenPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
