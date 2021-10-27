// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_card_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiCardPleromaAdapter _$UnifediApiCardPleromaAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiCardPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiCardPleromaAdapterTearOff {
  const _$UnifediApiCardPleromaAdapterTearOff();

  _UnifediApiCardPleromaAdapter call(@HiveField(0) PleromaApiCard value) {
    return _UnifediApiCardPleromaAdapter(
      value,
    );
  }

  UnifediApiCardPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiCardPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiCardPleromaAdapter = _$UnifediApiCardPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiCardPleromaAdapter {
  @HiveField(0)
  PleromaApiCard get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiCardPleromaAdapterCopyWith<UnifediApiCardPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiCardPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiCardPleromaAdapterCopyWith(
          UnifediApiCardPleromaAdapter value,
          $Res Function(UnifediApiCardPleromaAdapter) then) =
      _$UnifediApiCardPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiCard value});

  $PleromaApiCardCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiCardPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiCardPleromaAdapterCopyWith<$Res> {
  _$UnifediApiCardPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiCardPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiCardPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiCard,
    ));
  }

  @override
  $PleromaApiCardCopyWith<$Res> get value {
    return $PleromaApiCardCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiCardPleromaAdapterCopyWith<$Res>
    implements $UnifediApiCardPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiCardPleromaAdapterCopyWith(
          _UnifediApiCardPleromaAdapter value,
          $Res Function(_UnifediApiCardPleromaAdapter) then) =
      __$UnifediApiCardPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiCard value});

  @override
  $PleromaApiCardCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiCardPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiCardPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiCardPleromaAdapterCopyWith<$Res> {
  __$UnifediApiCardPleromaAdapterCopyWithImpl(
      _UnifediApiCardPleromaAdapter _value,
      $Res Function(_UnifediApiCardPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiCardPleromaAdapter));

  @override
  _UnifediApiCardPleromaAdapter get _value =>
      super._value as _UnifediApiCardPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiCardPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiCard,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiCardPleromaAdapter extends _UnifediApiCardPleromaAdapter {
  const _$_UnifediApiCardPleromaAdapter(@HiveField(0) this.value) : super._();

  factory _$_UnifediApiCardPleromaAdapter.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiCardPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiCard value;

  @override
  String toString() {
    return 'UnifediApiCardPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiCardPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiCardPleromaAdapterCopyWith<_UnifediApiCardPleromaAdapter>
      get copyWith => __$UnifediApiCardPleromaAdapterCopyWithImpl<
          _UnifediApiCardPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiCardPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiCardPleromaAdapter
    extends UnifediApiCardPleromaAdapter {
  const factory _UnifediApiCardPleromaAdapter(
      @HiveField(0) PleromaApiCard value) = _$_UnifediApiCardPleromaAdapter;
  const _UnifediApiCardPleromaAdapter._() : super._();

  factory _UnifediApiCardPleromaAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiCardPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiCard get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiCardPleromaAdapterCopyWith<_UnifediApiCardPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
