// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstancePleromaAdapter _$UnifediApiInstancePleromaAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiInstancePleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstancePleromaAdapterTearOff {
  const _$UnifediApiInstancePleromaAdapterTearOff();

  _UnifediApiInstancePleromaAdapter call(
      @HiveField(0) PleromaApiInstance value) {
    return _UnifediApiInstancePleromaAdapter(
      value,
    );
  }

  UnifediApiInstancePleromaAdapter fromJson(Map<String, Object> json) {
    return UnifediApiInstancePleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstancePleromaAdapter =
    _$UnifediApiInstancePleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiInstancePleromaAdapter {
  @HiveField(0)
  PleromaApiInstance get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiInstancePleromaAdapterCopyWith<UnifediApiInstancePleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstancePleromaAdapterCopyWith<$Res> {
  factory $UnifediApiInstancePleromaAdapterCopyWith(
          UnifediApiInstancePleromaAdapter value,
          $Res Function(UnifediApiInstancePleromaAdapter) then) =
      _$UnifediApiInstancePleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiInstance value});

  $PleromaApiInstanceCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiInstancePleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiInstancePleromaAdapterCopyWith<$Res> {
  _$UnifediApiInstancePleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiInstancePleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstancePleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstance,
    ));
  }

  @override
  $PleromaApiInstanceCopyWith<$Res> get value {
    return $PleromaApiInstanceCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiInstancePleromaAdapterCopyWith<$Res>
    implements $UnifediApiInstancePleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiInstancePleromaAdapterCopyWith(
          _UnifediApiInstancePleromaAdapter value,
          $Res Function(_UnifediApiInstancePleromaAdapter) then) =
      __$UnifediApiInstancePleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiInstance value});

  @override
  $PleromaApiInstanceCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiInstancePleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiInstancePleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiInstancePleromaAdapterCopyWith<$Res> {
  __$UnifediApiInstancePleromaAdapterCopyWithImpl(
      _UnifediApiInstancePleromaAdapter _value,
      $Res Function(_UnifediApiInstancePleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiInstancePleromaAdapter));

  @override
  _UnifediApiInstancePleromaAdapter get _value =>
      super._value as _UnifediApiInstancePleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiInstancePleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstance,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiInstancePleromaAdapter
    extends _UnifediApiInstancePleromaAdapter {
  const _$_UnifediApiInstancePleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiInstancePleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiInstancePleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiInstance value;

  @override
  String toString() {
    return 'UnifediApiInstancePleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiInstancePleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiInstancePleromaAdapterCopyWith<_UnifediApiInstancePleromaAdapter>
      get copyWith => __$UnifediApiInstancePleromaAdapterCopyWithImpl<
          _UnifediApiInstancePleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstancePleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiInstancePleromaAdapter
    extends UnifediApiInstancePleromaAdapter {
  const factory _UnifediApiInstancePleromaAdapter(
          @HiveField(0) PleromaApiInstance value) =
      _$_UnifediApiInstancePleromaAdapter;
  const _UnifediApiInstancePleromaAdapter._() : super._();

  factory _UnifediApiInstancePleromaAdapter.fromJson(
      Map<String, dynamic> json) = _$_UnifediApiInstancePleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiInstance get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiInstancePleromaAdapterCopyWith<_UnifediApiInstancePleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
