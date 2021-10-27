// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_my_account_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiMyAccountPleromaAdapter _$UnifediApiMyAccountPleromaAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiMyAccountPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiMyAccountPleromaAdapterTearOff {
  const _$UnifediApiMyAccountPleromaAdapterTearOff();

  _UnifediApiMyAccountPleromaAdapter call(
      @HiveField(0) PleromaApiMyAccount value) {
    return _UnifediApiMyAccountPleromaAdapter(
      value,
    );
  }

  UnifediApiMyAccountPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiMyAccountPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiMyAccountPleromaAdapter =
    _$UnifediApiMyAccountPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiMyAccountPleromaAdapter {
  @HiveField(0)
  PleromaApiMyAccount get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiMyAccountPleromaAdapterCopyWith<UnifediApiMyAccountPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiMyAccountPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiMyAccountPleromaAdapterCopyWith(
          UnifediApiMyAccountPleromaAdapter value,
          $Res Function(UnifediApiMyAccountPleromaAdapter) then) =
      _$UnifediApiMyAccountPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiMyAccount value});

  $PleromaApiMyAccountCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiMyAccountPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiMyAccountPleromaAdapterCopyWith<$Res> {
  _$UnifediApiMyAccountPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiMyAccountPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiMyAccountPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiMyAccount,
    ));
  }

  @override
  $PleromaApiMyAccountCopyWith<$Res> get value {
    return $PleromaApiMyAccountCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiMyAccountPleromaAdapterCopyWith<$Res>
    implements $UnifediApiMyAccountPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiMyAccountPleromaAdapterCopyWith(
          _UnifediApiMyAccountPleromaAdapter value,
          $Res Function(_UnifediApiMyAccountPleromaAdapter) then) =
      __$UnifediApiMyAccountPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiMyAccount value});

  @override
  $PleromaApiMyAccountCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiMyAccountPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiMyAccountPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiMyAccountPleromaAdapterCopyWith<$Res> {
  __$UnifediApiMyAccountPleromaAdapterCopyWithImpl(
      _UnifediApiMyAccountPleromaAdapter _value,
      $Res Function(_UnifediApiMyAccountPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiMyAccountPleromaAdapter));

  @override
  _UnifediApiMyAccountPleromaAdapter get _value =>
      super._value as _UnifediApiMyAccountPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiMyAccountPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiMyAccount,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiMyAccountPleromaAdapter
    extends _UnifediApiMyAccountPleromaAdapter {
  const _$_UnifediApiMyAccountPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiMyAccountPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiMyAccountPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiMyAccount value;

  @override
  String toString() {
    return 'UnifediApiMyAccountPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiMyAccountPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiMyAccountPleromaAdapterCopyWith<
          _UnifediApiMyAccountPleromaAdapter>
      get copyWith => __$UnifediApiMyAccountPleromaAdapterCopyWithImpl<
          _UnifediApiMyAccountPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiMyAccountPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiMyAccountPleromaAdapter
    extends UnifediApiMyAccountPleromaAdapter {
  const factory _UnifediApiMyAccountPleromaAdapter(
          @HiveField(0) PleromaApiMyAccount value) =
      _$_UnifediApiMyAccountPleromaAdapter;
  const _UnifediApiMyAccountPleromaAdapter._() : super._();

  factory _UnifediApiMyAccountPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiMyAccountPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiMyAccount get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiMyAccountPleromaAdapterCopyWith<
          _UnifediApiMyAccountPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
