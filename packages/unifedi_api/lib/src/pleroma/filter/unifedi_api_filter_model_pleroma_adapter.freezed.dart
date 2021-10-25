// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_filter_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiFilterPleromaAdapter _$UnifediApiFilterPleromaAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiFilterPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiFilterPleromaAdapterTearOff {
  const _$UnifediApiFilterPleromaAdapterTearOff();

  _UnifediApiFilterPleromaAdapter call(@HiveField(0) PleromaApiFilter value) {
    return _UnifediApiFilterPleromaAdapter(
      value,
    );
  }

  UnifediApiFilterPleromaAdapter fromJson(Map<String, Object> json) {
    return UnifediApiFilterPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiFilterPleromaAdapter =
    _$UnifediApiFilterPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiFilterPleromaAdapter {
  @HiveField(0)
  PleromaApiFilter get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiFilterPleromaAdapterCopyWith<UnifediApiFilterPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiFilterPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiFilterPleromaAdapterCopyWith(
          UnifediApiFilterPleromaAdapter value,
          $Res Function(UnifediApiFilterPleromaAdapter) then) =
      _$UnifediApiFilterPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiFilter value});

  $PleromaApiFilterCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiFilterPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiFilterPleromaAdapterCopyWith<$Res> {
  _$UnifediApiFilterPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiFilterPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiFilterPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiFilter,
    ));
  }

  @override
  $PleromaApiFilterCopyWith<$Res> get value {
    return $PleromaApiFilterCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiFilterPleromaAdapterCopyWith<$Res>
    implements $UnifediApiFilterPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiFilterPleromaAdapterCopyWith(
          _UnifediApiFilterPleromaAdapter value,
          $Res Function(_UnifediApiFilterPleromaAdapter) then) =
      __$UnifediApiFilterPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiFilter value});

  @override
  $PleromaApiFilterCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiFilterPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiFilterPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiFilterPleromaAdapterCopyWith<$Res> {
  __$UnifediApiFilterPleromaAdapterCopyWithImpl(
      _UnifediApiFilterPleromaAdapter _value,
      $Res Function(_UnifediApiFilterPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiFilterPleromaAdapter));

  @override
  _UnifediApiFilterPleromaAdapter get _value =>
      super._value as _UnifediApiFilterPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiFilterPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiFilter,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiFilterPleromaAdapter
    extends _UnifediApiFilterPleromaAdapter {
  const _$_UnifediApiFilterPleromaAdapter(@HiveField(0) this.value) : super._();

  factory _$_UnifediApiFilterPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiFilterPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiFilter value;

  @override
  String toString() {
    return 'UnifediApiFilterPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiFilterPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiFilterPleromaAdapterCopyWith<_UnifediApiFilterPleromaAdapter>
      get copyWith => __$UnifediApiFilterPleromaAdapterCopyWithImpl<
          _UnifediApiFilterPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiFilterPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiFilterPleromaAdapter
    extends UnifediApiFilterPleromaAdapter {
  const factory _UnifediApiFilterPleromaAdapter(
      @HiveField(0) PleromaApiFilter value) = _$_UnifediApiFilterPleromaAdapter;
  const _UnifediApiFilterPleromaAdapter._() : super._();

  factory _UnifediApiFilterPleromaAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiFilterPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiFilter get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiFilterPleromaAdapterCopyWith<_UnifediApiFilterPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
