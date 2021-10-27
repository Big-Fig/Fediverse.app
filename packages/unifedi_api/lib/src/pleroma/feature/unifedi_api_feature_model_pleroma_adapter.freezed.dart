// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_feature_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiFeaturePleromaAdapter _$UnifediApiFeaturePleromaAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiFeaturePleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiFeaturePleromaAdapterTearOff {
  const _$UnifediApiFeaturePleromaAdapterTearOff();

  _UnifediApiFeaturePleromaAdapter call(@HiveField(0) PleromaApiFeature value) {
    return _UnifediApiFeaturePleromaAdapter(
      value,
    );
  }

  UnifediApiFeaturePleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiFeaturePleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiFeaturePleromaAdapter =
    _$UnifediApiFeaturePleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiFeaturePleromaAdapter {
  @HiveField(0)
  PleromaApiFeature get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiFeaturePleromaAdapterCopyWith<UnifediApiFeaturePleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiFeaturePleromaAdapterCopyWith<$Res> {
  factory $UnifediApiFeaturePleromaAdapterCopyWith(
          UnifediApiFeaturePleromaAdapter value,
          $Res Function(UnifediApiFeaturePleromaAdapter) then) =
      _$UnifediApiFeaturePleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiFeature value});

  $PleromaApiFeatureCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiFeaturePleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiFeaturePleromaAdapterCopyWith<$Res> {
  _$UnifediApiFeaturePleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiFeaturePleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiFeaturePleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiFeature,
    ));
  }

  @override
  $PleromaApiFeatureCopyWith<$Res> get value {
    return $PleromaApiFeatureCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiFeaturePleromaAdapterCopyWith<$Res>
    implements $UnifediApiFeaturePleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiFeaturePleromaAdapterCopyWith(
          _UnifediApiFeaturePleromaAdapter value,
          $Res Function(_UnifediApiFeaturePleromaAdapter) then) =
      __$UnifediApiFeaturePleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiFeature value});

  @override
  $PleromaApiFeatureCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiFeaturePleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiFeaturePleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiFeaturePleromaAdapterCopyWith<$Res> {
  __$UnifediApiFeaturePleromaAdapterCopyWithImpl(
      _UnifediApiFeaturePleromaAdapter _value,
      $Res Function(_UnifediApiFeaturePleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiFeaturePleromaAdapter));

  @override
  _UnifediApiFeaturePleromaAdapter get _value =>
      super._value as _UnifediApiFeaturePleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiFeaturePleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiFeature,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiFeaturePleromaAdapter
    extends _UnifediApiFeaturePleromaAdapter {
  const _$_UnifediApiFeaturePleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiFeaturePleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiFeaturePleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiFeature value;

  @override
  String toString() {
    return 'UnifediApiFeaturePleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiFeaturePleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiFeaturePleromaAdapterCopyWith<_UnifediApiFeaturePleromaAdapter>
      get copyWith => __$UnifediApiFeaturePleromaAdapterCopyWithImpl<
          _UnifediApiFeaturePleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiFeaturePleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiFeaturePleromaAdapter
    extends UnifediApiFeaturePleromaAdapter {
  const factory _UnifediApiFeaturePleromaAdapter(
          @HiveField(0) PleromaApiFeature value) =
      _$_UnifediApiFeaturePleromaAdapter;
  const _UnifediApiFeaturePleromaAdapter._() : super._();

  factory _UnifediApiFeaturePleromaAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiFeaturePleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiFeature get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiFeaturePleromaAdapterCopyWith<_UnifediApiFeaturePleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
