// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_account_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccountPleromaAdapter _$UnifediApiAccountPleromaAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiAccountPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccountPleromaAdapterTearOff {
  const _$UnifediApiAccountPleromaAdapterTearOff();

  _UnifediApiAccountPleromaAdapter call(@HiveField(0) PleromaApiAccount value) {
    return _UnifediApiAccountPleromaAdapter(
      value,
    );
  }

  UnifediApiAccountPleromaAdapter fromJson(Map<String, Object> json) {
    return UnifediApiAccountPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccountPleromaAdapter =
    _$UnifediApiAccountPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAccountPleromaAdapter {
  @HiveField(0)
  PleromaApiAccount get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccountPleromaAdapterCopyWith<UnifediApiAccountPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccountPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiAccountPleromaAdapterCopyWith(
          UnifediApiAccountPleromaAdapter value,
          $Res Function(UnifediApiAccountPleromaAdapter) then) =
      _$UnifediApiAccountPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiAccount value});

  $PleromaApiAccountCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAccountPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiAccountPleromaAdapterCopyWith<$Res> {
  _$UnifediApiAccountPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiAccountPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccountPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccount,
    ));
  }

  @override
  $PleromaApiAccountCopyWith<$Res> get value {
    return $PleromaApiAccountCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccountPleromaAdapterCopyWith<$Res>
    implements $UnifediApiAccountPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiAccountPleromaAdapterCopyWith(
          _UnifediApiAccountPleromaAdapter value,
          $Res Function(_UnifediApiAccountPleromaAdapter) then) =
      __$UnifediApiAccountPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiAccount value});

  @override
  $PleromaApiAccountCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAccountPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAccountPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAccountPleromaAdapterCopyWith<$Res> {
  __$UnifediApiAccountPleromaAdapterCopyWithImpl(
      _UnifediApiAccountPleromaAdapter _value,
      $Res Function(_UnifediApiAccountPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiAccountPleromaAdapter));

  @override
  _UnifediApiAccountPleromaAdapter get _value =>
      super._value as _UnifediApiAccountPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAccountPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccount,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccountPleromaAdapter
    extends _UnifediApiAccountPleromaAdapter {
  const _$_UnifediApiAccountPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAccountPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccountPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiAccount value;

  @override
  String toString() {
    return 'UnifediApiAccountPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiAccountPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccountPleromaAdapterCopyWith<_UnifediApiAccountPleromaAdapter>
      get copyWith => __$UnifediApiAccountPleromaAdapterCopyWithImpl<
          _UnifediApiAccountPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccountPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiAccountPleromaAdapter
    extends UnifediApiAccountPleromaAdapter {
  const factory _UnifediApiAccountPleromaAdapter(
          @HiveField(0) PleromaApiAccount value) =
      _$_UnifediApiAccountPleromaAdapter;
  const _UnifediApiAccountPleromaAdapter._() : super._();

  factory _UnifediApiAccountPleromaAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiAccountPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiAccount get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccountPleromaAdapterCopyWith<_UnifediApiAccountPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
