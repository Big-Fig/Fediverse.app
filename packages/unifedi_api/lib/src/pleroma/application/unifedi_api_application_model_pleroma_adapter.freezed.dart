// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_application_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiApplicationPleromaAdapter
    _$UnifediApiApplicationPleromaAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiApplicationPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiApplicationPleromaAdapterTearOff {
  const _$UnifediApiApplicationPleromaAdapterTearOff();

  _UnifediApiApplicationPleromaAdapter call(
      @HiveField(0) PleromaApiApplication value) {
    return _UnifediApiApplicationPleromaAdapter(
      value,
    );
  }

  UnifediApiApplicationPleromaAdapter fromJson(Map<String, Object> json) {
    return UnifediApiApplicationPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiApplicationPleromaAdapter =
    _$UnifediApiApplicationPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiApplicationPleromaAdapter {
  @HiveField(0)
  PleromaApiApplication get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiApplicationPleromaAdapterCopyWith<
          UnifediApiApplicationPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiApplicationPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiApplicationPleromaAdapterCopyWith(
          UnifediApiApplicationPleromaAdapter value,
          $Res Function(UnifediApiApplicationPleromaAdapter) then) =
      _$UnifediApiApplicationPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiApplication value});

  $PleromaApiApplicationCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiApplicationPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiApplicationPleromaAdapterCopyWith<$Res> {
  _$UnifediApiApplicationPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiApplicationPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiApplicationPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiApplication,
    ));
  }

  @override
  $PleromaApiApplicationCopyWith<$Res> get value {
    return $PleromaApiApplicationCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiApplicationPleromaAdapterCopyWith<$Res>
    implements $UnifediApiApplicationPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiApplicationPleromaAdapterCopyWith(
          _UnifediApiApplicationPleromaAdapter value,
          $Res Function(_UnifediApiApplicationPleromaAdapter) then) =
      __$UnifediApiApplicationPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiApplication value});

  @override
  $PleromaApiApplicationCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiApplicationPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiApplicationPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiApplicationPleromaAdapterCopyWith<$Res> {
  __$UnifediApiApplicationPleromaAdapterCopyWithImpl(
      _UnifediApiApplicationPleromaAdapter _value,
      $Res Function(_UnifediApiApplicationPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiApplicationPleromaAdapter));

  @override
  _UnifediApiApplicationPleromaAdapter get _value =>
      super._value as _UnifediApiApplicationPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiApplicationPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiApplication,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiApplicationPleromaAdapter
    extends _UnifediApiApplicationPleromaAdapter {
  const _$_UnifediApiApplicationPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiApplicationPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiApplicationPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiApplication value;

  @override
  String toString() {
    return 'UnifediApiApplicationPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiApplicationPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiApplicationPleromaAdapterCopyWith<
          _UnifediApiApplicationPleromaAdapter>
      get copyWith => __$UnifediApiApplicationPleromaAdapterCopyWithImpl<
          _UnifediApiApplicationPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiApplicationPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiApplicationPleromaAdapter
    extends UnifediApiApplicationPleromaAdapter {
  const factory _UnifediApiApplicationPleromaAdapter(
          @HiveField(0) PleromaApiApplication value) =
      _$_UnifediApiApplicationPleromaAdapter;
  const _UnifediApiApplicationPleromaAdapter._() : super._();

  factory _UnifediApiApplicationPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiApplicationPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiApplication get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiApplicationPleromaAdapterCopyWith<
          _UnifediApiApplicationPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
