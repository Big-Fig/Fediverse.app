// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_status_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiStatusPleromaAdapter _$UnifediApiStatusPleromaAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiStatusPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiStatusPleromaAdapterTearOff {
  const _$UnifediApiStatusPleromaAdapterTearOff();

  _UnifediApiStatusPleromaAdapter call(@HiveField(0) PleromaApiStatus value) {
    return _UnifediApiStatusPleromaAdapter(
      value,
    );
  }

  UnifediApiStatusPleromaAdapter fromJson(Map<String, Object> json) {
    return UnifediApiStatusPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiStatusPleromaAdapter =
    _$UnifediApiStatusPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiStatusPleromaAdapter {
  @HiveField(0)
  PleromaApiStatus get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiStatusPleromaAdapterCopyWith<UnifediApiStatusPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiStatusPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiStatusPleromaAdapterCopyWith(
          UnifediApiStatusPleromaAdapter value,
          $Res Function(UnifediApiStatusPleromaAdapter) then) =
      _$UnifediApiStatusPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiStatus value});

  $PleromaApiStatusCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiStatusPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiStatusPleromaAdapterCopyWith<$Res> {
  _$UnifediApiStatusPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiStatusPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiStatusPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiStatus,
    ));
  }

  @override
  $PleromaApiStatusCopyWith<$Res> get value {
    return $PleromaApiStatusCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiStatusPleromaAdapterCopyWith<$Res>
    implements $UnifediApiStatusPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiStatusPleromaAdapterCopyWith(
          _UnifediApiStatusPleromaAdapter value,
          $Res Function(_UnifediApiStatusPleromaAdapter) then) =
      __$UnifediApiStatusPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiStatus value});

  @override
  $PleromaApiStatusCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiStatusPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiStatusPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiStatusPleromaAdapterCopyWith<$Res> {
  __$UnifediApiStatusPleromaAdapterCopyWithImpl(
      _UnifediApiStatusPleromaAdapter _value,
      $Res Function(_UnifediApiStatusPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiStatusPleromaAdapter));

  @override
  _UnifediApiStatusPleromaAdapter get _value =>
      super._value as _UnifediApiStatusPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiStatusPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiStatusPleromaAdapter
    extends _UnifediApiStatusPleromaAdapter {
  const _$_UnifediApiStatusPleromaAdapter(@HiveField(0) this.value) : super._();

  factory _$_UnifediApiStatusPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiStatusPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiStatus value;

  @override
  String toString() {
    return 'UnifediApiStatusPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiStatusPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiStatusPleromaAdapterCopyWith<_UnifediApiStatusPleromaAdapter>
      get copyWith => __$UnifediApiStatusPleromaAdapterCopyWithImpl<
          _UnifediApiStatusPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiStatusPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiStatusPleromaAdapter
    extends UnifediApiStatusPleromaAdapter {
  const factory _UnifediApiStatusPleromaAdapter(
      @HiveField(0) PleromaApiStatus value) = _$_UnifediApiStatusPleromaAdapter;
  const _UnifediApiStatusPleromaAdapter._() : super._();

  factory _UnifediApiStatusPleromaAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiStatusPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiStatus get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiStatusPleromaAdapterCopyWith<_UnifediApiStatusPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
