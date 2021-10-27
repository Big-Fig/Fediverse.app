// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_list_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiListPleromaAdapter _$UnifediApiListPleromaAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiListPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiListPleromaAdapterTearOff {
  const _$UnifediApiListPleromaAdapterTearOff();

  _UnifediApiListPleromaAdapter call(@HiveField(0) PleromaApiList value) {
    return _UnifediApiListPleromaAdapter(
      value,
    );
  }

  UnifediApiListPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiListPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiListPleromaAdapter = _$UnifediApiListPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiListPleromaAdapter {
  @HiveField(0)
  PleromaApiList get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiListPleromaAdapterCopyWith<UnifediApiListPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiListPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiListPleromaAdapterCopyWith(
          UnifediApiListPleromaAdapter value,
          $Res Function(UnifediApiListPleromaAdapter) then) =
      _$UnifediApiListPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiList value});

  $PleromaApiListCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiListPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiListPleromaAdapterCopyWith<$Res> {
  _$UnifediApiListPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiListPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiListPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiList,
    ));
  }

  @override
  $PleromaApiListCopyWith<$Res> get value {
    return $PleromaApiListCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiListPleromaAdapterCopyWith<$Res>
    implements $UnifediApiListPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiListPleromaAdapterCopyWith(
          _UnifediApiListPleromaAdapter value,
          $Res Function(_UnifediApiListPleromaAdapter) then) =
      __$UnifediApiListPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiList value});

  @override
  $PleromaApiListCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiListPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiListPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiListPleromaAdapterCopyWith<$Res> {
  __$UnifediApiListPleromaAdapterCopyWithImpl(
      _UnifediApiListPleromaAdapter _value,
      $Res Function(_UnifediApiListPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiListPleromaAdapter));

  @override
  _UnifediApiListPleromaAdapter get _value =>
      super._value as _UnifediApiListPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiListPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiList,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiListPleromaAdapter extends _UnifediApiListPleromaAdapter {
  const _$_UnifediApiListPleromaAdapter(@HiveField(0) this.value) : super._();

  factory _$_UnifediApiListPleromaAdapter.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiListPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiList value;

  @override
  String toString() {
    return 'UnifediApiListPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiListPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiListPleromaAdapterCopyWith<_UnifediApiListPleromaAdapter>
      get copyWith => __$UnifediApiListPleromaAdapterCopyWithImpl<
          _UnifediApiListPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiListPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiListPleromaAdapter
    extends UnifediApiListPleromaAdapter {
  const factory _UnifediApiListPleromaAdapter(
      @HiveField(0) PleromaApiList value) = _$_UnifediApiListPleromaAdapter;
  const _UnifediApiListPleromaAdapter._() : super._();

  factory _UnifediApiListPleromaAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiListPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiList get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiListPleromaAdapterCopyWith<_UnifediApiListPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
