// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_tag_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiTagPleromaAdapter _$UnifediApiTagPleromaAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiTagPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiTagPleromaAdapterTearOff {
  const _$UnifediApiTagPleromaAdapterTearOff();

  _UnifediApiTagPleromaAdapter call(@HiveField(0) PleromaApiTag value) {
    return _UnifediApiTagPleromaAdapter(
      value,
    );
  }

  UnifediApiTagPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiTagPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiTagPleromaAdapter = _$UnifediApiTagPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiTagPleromaAdapter {
  @HiveField(0)
  PleromaApiTag get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiTagPleromaAdapterCopyWith<UnifediApiTagPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiTagPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiTagPleromaAdapterCopyWith(
          UnifediApiTagPleromaAdapter value,
          $Res Function(UnifediApiTagPleromaAdapter) then) =
      _$UnifediApiTagPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiTag value});

  $PleromaApiTagCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiTagPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiTagPleromaAdapterCopyWith<$Res> {
  _$UnifediApiTagPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiTagPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiTagPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiTag,
    ));
  }

  @override
  $PleromaApiTagCopyWith<$Res> get value {
    return $PleromaApiTagCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiTagPleromaAdapterCopyWith<$Res>
    implements $UnifediApiTagPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiTagPleromaAdapterCopyWith(
          _UnifediApiTagPleromaAdapter value,
          $Res Function(_UnifediApiTagPleromaAdapter) then) =
      __$UnifediApiTagPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiTag value});

  @override
  $PleromaApiTagCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiTagPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiTagPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiTagPleromaAdapterCopyWith<$Res> {
  __$UnifediApiTagPleromaAdapterCopyWithImpl(
      _UnifediApiTagPleromaAdapter _value,
      $Res Function(_UnifediApiTagPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiTagPleromaAdapter));

  @override
  _UnifediApiTagPleromaAdapter get _value =>
      super._value as _UnifediApiTagPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiTagPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiTag,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiTagPleromaAdapter extends _UnifediApiTagPleromaAdapter {
  const _$_UnifediApiTagPleromaAdapter(@HiveField(0) this.value) : super._();

  factory _$_UnifediApiTagPleromaAdapter.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiTagPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiTag value;

  @override
  String toString() {
    return 'UnifediApiTagPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiTagPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiTagPleromaAdapterCopyWith<_UnifediApiTagPleromaAdapter>
      get copyWith => __$UnifediApiTagPleromaAdapterCopyWithImpl<
          _UnifediApiTagPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiTagPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiTagPleromaAdapter
    extends UnifediApiTagPleromaAdapter {
  const factory _UnifediApiTagPleromaAdapter(
      @HiveField(0) PleromaApiTag value) = _$_UnifediApiTagPleromaAdapter;
  const _UnifediApiTagPleromaAdapter._() : super._();

  factory _UnifediApiTagPleromaAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiTagPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiTag get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiTagPleromaAdapterCopyWith<_UnifediApiTagPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
