// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_rest_error_details_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiRestErrorDetailsPleromaAdapter
    _$UnifediApiRestErrorDetailsPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiRestErrorDetailsPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiRestErrorDetailsPleromaAdapterTearOff {
  const _$UnifediApiRestErrorDetailsPleromaAdapterTearOff();

  _UnifediApiRestErrorDetailsPleromaAdapter call(
      @HiveField(0) PleromaApiRestErrorDetails value) {
    return _UnifediApiRestErrorDetailsPleromaAdapter(
      value,
    );
  }

  UnifediApiRestErrorDetailsPleromaAdapter fromJson(Map<String, Object> json) {
    return UnifediApiRestErrorDetailsPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiRestErrorDetailsPleromaAdapter =
    _$UnifediApiRestErrorDetailsPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiRestErrorDetailsPleromaAdapter {
  @HiveField(0)
  PleromaApiRestErrorDetails get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiRestErrorDetailsPleromaAdapterCopyWith<
          UnifediApiRestErrorDetailsPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiRestErrorDetailsPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiRestErrorDetailsPleromaAdapterCopyWith(
          UnifediApiRestErrorDetailsPleromaAdapter value,
          $Res Function(UnifediApiRestErrorDetailsPleromaAdapter) then) =
      _$UnifediApiRestErrorDetailsPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiRestErrorDetails value});

  $PleromaApiRestErrorDetailsCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiRestErrorDetailsPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiRestErrorDetailsPleromaAdapterCopyWith<$Res> {
  _$UnifediApiRestErrorDetailsPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiRestErrorDetailsPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiRestErrorDetailsPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiRestErrorDetails,
    ));
  }

  @override
  $PleromaApiRestErrorDetailsCopyWith<$Res> get value {
    return $PleromaApiRestErrorDetailsCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiRestErrorDetailsPleromaAdapterCopyWith<$Res>
    implements $UnifediApiRestErrorDetailsPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiRestErrorDetailsPleromaAdapterCopyWith(
          _UnifediApiRestErrorDetailsPleromaAdapter value,
          $Res Function(_UnifediApiRestErrorDetailsPleromaAdapter) then) =
      __$UnifediApiRestErrorDetailsPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiRestErrorDetails value});

  @override
  $PleromaApiRestErrorDetailsCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiRestErrorDetailsPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiRestErrorDetailsPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiRestErrorDetailsPleromaAdapterCopyWith<$Res> {
  __$UnifediApiRestErrorDetailsPleromaAdapterCopyWithImpl(
      _UnifediApiRestErrorDetailsPleromaAdapter _value,
      $Res Function(_UnifediApiRestErrorDetailsPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiRestErrorDetailsPleromaAdapter));

  @override
  _UnifediApiRestErrorDetailsPleromaAdapter get _value =>
      super._value as _UnifediApiRestErrorDetailsPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiRestErrorDetailsPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiRestErrorDetails,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiRestErrorDetailsPleromaAdapter
    extends _UnifediApiRestErrorDetailsPleromaAdapter {
  const _$_UnifediApiRestErrorDetailsPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiRestErrorDetailsPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiRestErrorDetailsPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiRestErrorDetails value;

  @override
  String toString() {
    return 'UnifediApiRestErrorDetailsPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiRestErrorDetailsPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiRestErrorDetailsPleromaAdapterCopyWith<
          _UnifediApiRestErrorDetailsPleromaAdapter>
      get copyWith => __$UnifediApiRestErrorDetailsPleromaAdapterCopyWithImpl<
          _UnifediApiRestErrorDetailsPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiRestErrorDetailsPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiRestErrorDetailsPleromaAdapter
    extends UnifediApiRestErrorDetailsPleromaAdapter {
  const factory _UnifediApiRestErrorDetailsPleromaAdapter(
          @HiveField(0) PleromaApiRestErrorDetails value) =
      _$_UnifediApiRestErrorDetailsPleromaAdapter;
  const _UnifediApiRestErrorDetailsPleromaAdapter._() : super._();

  factory _UnifediApiRestErrorDetailsPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiRestErrorDetailsPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiRestErrorDetails get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiRestErrorDetailsPleromaAdapterCopyWith<
          _UnifediApiRestErrorDetailsPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
