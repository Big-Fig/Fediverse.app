// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_access_application_token_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccessApplicationTokenPleromaAdapter
    _$UnifediApiAccessApplicationTokenPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiAccessApplicationTokenPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessApplicationTokenPleromaAdapterTearOff {
  const _$UnifediApiAccessApplicationTokenPleromaAdapterTearOff();

  _UnifediApiAccessApplicationTokenPleromaAdapter call(
      @HiveField(0) PleromaApiAccessApplicationToken value) {
    return _UnifediApiAccessApplicationTokenPleromaAdapter(
      value,
    );
  }

  UnifediApiAccessApplicationTokenPleromaAdapter fromJson(
      Map<String, Object?> json) {
    return UnifediApiAccessApplicationTokenPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccessApplicationTokenPleromaAdapter =
    _$UnifediApiAccessApplicationTokenPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAccessApplicationTokenPleromaAdapter {
  @HiveField(0)
  PleromaApiAccessApplicationToken get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessApplicationTokenPleromaAdapterCopyWith<
          UnifediApiAccessApplicationTokenPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessApplicationTokenPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiAccessApplicationTokenPleromaAdapterCopyWith(
          UnifediApiAccessApplicationTokenPleromaAdapter value,
          $Res Function(UnifediApiAccessApplicationTokenPleromaAdapter) then) =
      _$UnifediApiAccessApplicationTokenPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiAccessApplicationToken value});

  $PleromaApiAccessApplicationTokenCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAccessApplicationTokenPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiAccessApplicationTokenPleromaAdapterCopyWith<$Res> {
  _$UnifediApiAccessApplicationTokenPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiAccessApplicationTokenPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccessApplicationTokenPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessApplicationToken,
    ));
  }

  @override
  $PleromaApiAccessApplicationTokenCopyWith<$Res> get value {
    return $PleromaApiAccessApplicationTokenCopyWith<$Res>(_value.value,
        (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccessApplicationTokenPleromaAdapterCopyWith<$Res>
    implements $UnifediApiAccessApplicationTokenPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiAccessApplicationTokenPleromaAdapterCopyWith(
          _UnifediApiAccessApplicationTokenPleromaAdapter value,
          $Res Function(_UnifediApiAccessApplicationTokenPleromaAdapter) then) =
      __$UnifediApiAccessApplicationTokenPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiAccessApplicationToken value});

  @override
  $PleromaApiAccessApplicationTokenCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAccessApplicationTokenPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAccessApplicationTokenPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAccessApplicationTokenPleromaAdapterCopyWith<$Res> {
  __$UnifediApiAccessApplicationTokenPleromaAdapterCopyWithImpl(
      _UnifediApiAccessApplicationTokenPleromaAdapter _value,
      $Res Function(_UnifediApiAccessApplicationTokenPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiAccessApplicationTokenPleromaAdapter));

  @override
  _UnifediApiAccessApplicationTokenPleromaAdapter get _value =>
      super._value as _UnifediApiAccessApplicationTokenPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAccessApplicationTokenPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessApplicationToken,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccessApplicationTokenPleromaAdapter
    extends _UnifediApiAccessApplicationTokenPleromaAdapter {
  const _$_UnifediApiAccessApplicationTokenPleromaAdapter(
      @HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAccessApplicationTokenPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccessApplicationTokenPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiAccessApplicationToken value;

  @override
  String toString() {
    return 'UnifediApiAccessApplicationTokenPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiAccessApplicationTokenPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccessApplicationTokenPleromaAdapterCopyWith<
          _UnifediApiAccessApplicationTokenPleromaAdapter>
      get copyWith =>
          __$UnifediApiAccessApplicationTokenPleromaAdapterCopyWithImpl<
                  _UnifediApiAccessApplicationTokenPleromaAdapter>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessApplicationTokenPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiAccessApplicationTokenPleromaAdapter
    extends UnifediApiAccessApplicationTokenPleromaAdapter {
  const factory _UnifediApiAccessApplicationTokenPleromaAdapter(
          @HiveField(0) PleromaApiAccessApplicationToken value) =
      _$_UnifediApiAccessApplicationTokenPleromaAdapter;
  const _UnifediApiAccessApplicationTokenPleromaAdapter._() : super._();

  factory _UnifediApiAccessApplicationTokenPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiAccessApplicationTokenPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiAccessApplicationToken get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessApplicationTokenPleromaAdapterCopyWith<
          _UnifediApiAccessApplicationTokenPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
