// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_status_context_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiStatusContextPleromaAdapter
    _$UnifediApiStatusContextPleromaAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiStatusContextPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiStatusContextPleromaAdapterTearOff {
  const _$UnifediApiStatusContextPleromaAdapterTearOff();

  _UnifediApiStatusContextPleromaAdapter call(
      @HiveField(0) PleromaApiStatusContext value) {
    return _UnifediApiStatusContextPleromaAdapter(
      value,
    );
  }

  UnifediApiStatusContextPleromaAdapter fromJson(Map<String, Object> json) {
    return UnifediApiStatusContextPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiStatusContextPleromaAdapter =
    _$UnifediApiStatusContextPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiStatusContextPleromaAdapter {
  @HiveField(0)
  PleromaApiStatusContext get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiStatusContextPleromaAdapterCopyWith<
          UnifediApiStatusContextPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiStatusContextPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiStatusContextPleromaAdapterCopyWith(
          UnifediApiStatusContextPleromaAdapter value,
          $Res Function(UnifediApiStatusContextPleromaAdapter) then) =
      _$UnifediApiStatusContextPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiStatusContext value});

  $PleromaApiStatusContextCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiStatusContextPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiStatusContextPleromaAdapterCopyWith<$Res> {
  _$UnifediApiStatusContextPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiStatusContextPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiStatusContextPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiStatusContext,
    ));
  }

  @override
  $PleromaApiStatusContextCopyWith<$Res> get value {
    return $PleromaApiStatusContextCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiStatusContextPleromaAdapterCopyWith<$Res>
    implements $UnifediApiStatusContextPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiStatusContextPleromaAdapterCopyWith(
          _UnifediApiStatusContextPleromaAdapter value,
          $Res Function(_UnifediApiStatusContextPleromaAdapter) then) =
      __$UnifediApiStatusContextPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiStatusContext value});

  @override
  $PleromaApiStatusContextCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiStatusContextPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiStatusContextPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiStatusContextPleromaAdapterCopyWith<$Res> {
  __$UnifediApiStatusContextPleromaAdapterCopyWithImpl(
      _UnifediApiStatusContextPleromaAdapter _value,
      $Res Function(_UnifediApiStatusContextPleromaAdapter) _then)
      : super(
            _value, (v) => _then(v as _UnifediApiStatusContextPleromaAdapter));

  @override
  _UnifediApiStatusContextPleromaAdapter get _value =>
      super._value as _UnifediApiStatusContextPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiStatusContextPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiStatusContext,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiStatusContextPleromaAdapter
    extends _UnifediApiStatusContextPleromaAdapter {
  const _$_UnifediApiStatusContextPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiStatusContextPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiStatusContextPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiStatusContext value;

  @override
  String toString() {
    return 'UnifediApiStatusContextPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiStatusContextPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiStatusContextPleromaAdapterCopyWith<
          _UnifediApiStatusContextPleromaAdapter>
      get copyWith => __$UnifediApiStatusContextPleromaAdapterCopyWithImpl<
          _UnifediApiStatusContextPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiStatusContextPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiStatusContextPleromaAdapter
    extends UnifediApiStatusContextPleromaAdapter {
  const factory _UnifediApiStatusContextPleromaAdapter(
          @HiveField(0) PleromaApiStatusContext value) =
      _$_UnifediApiStatusContextPleromaAdapter;
  const _UnifediApiStatusContextPleromaAdapter._() : super._();

  factory _UnifediApiStatusContextPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiStatusContextPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiStatusContext get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiStatusContextPleromaAdapterCopyWith<
          _UnifediApiStatusContextPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
