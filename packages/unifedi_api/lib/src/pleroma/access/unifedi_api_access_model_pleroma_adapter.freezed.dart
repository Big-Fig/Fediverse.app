// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_access_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccessPleromaAdapter _$UnifediApiAccessPleromaAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiAccessPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessPleromaAdapterTearOff {
  const _$UnifediApiAccessPleromaAdapterTearOff();

  _UnifediApiAccessPleromaAdapter call(@HiveField(0) PleromaApiAccess value) {
    return _UnifediApiAccessPleromaAdapter(
      value,
    );
  }

  UnifediApiAccessPleromaAdapter fromJson(Map<String, Object> json) {
    return UnifediApiAccessPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccessPleromaAdapter =
    _$UnifediApiAccessPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAccessPleromaAdapter {
  @HiveField(0)
  PleromaApiAccess get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessPleromaAdapterCopyWith<UnifediApiAccessPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiAccessPleromaAdapterCopyWith(
          UnifediApiAccessPleromaAdapter value,
          $Res Function(UnifediApiAccessPleromaAdapter) then) =
      _$UnifediApiAccessPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiAccess value});

  $PleromaApiAccessCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAccessPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiAccessPleromaAdapterCopyWith<$Res> {
  _$UnifediApiAccessPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiAccessPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccessPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccess,
    ));
  }

  @override
  $PleromaApiAccessCopyWith<$Res> get value {
    return $PleromaApiAccessCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccessPleromaAdapterCopyWith<$Res>
    implements $UnifediApiAccessPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiAccessPleromaAdapterCopyWith(
          _UnifediApiAccessPleromaAdapter value,
          $Res Function(_UnifediApiAccessPleromaAdapter) then) =
      __$UnifediApiAccessPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiAccess value});

  @override
  $PleromaApiAccessCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAccessPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAccessPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAccessPleromaAdapterCopyWith<$Res> {
  __$UnifediApiAccessPleromaAdapterCopyWithImpl(
      _UnifediApiAccessPleromaAdapter _value,
      $Res Function(_UnifediApiAccessPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiAccessPleromaAdapter));

  @override
  _UnifediApiAccessPleromaAdapter get _value =>
      super._value as _UnifediApiAccessPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAccessPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccess,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccessPleromaAdapter
    extends _UnifediApiAccessPleromaAdapter {
  const _$_UnifediApiAccessPleromaAdapter(@HiveField(0) this.value) : super._();

  factory _$_UnifediApiAccessPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccessPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiAccess value;

  @override
  String toString() {
    return 'UnifediApiAccessPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiAccessPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccessPleromaAdapterCopyWith<_UnifediApiAccessPleromaAdapter>
      get copyWith => __$UnifediApiAccessPleromaAdapterCopyWithImpl<
          _UnifediApiAccessPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiAccessPleromaAdapter
    extends UnifediApiAccessPleromaAdapter {
  const factory _UnifediApiAccessPleromaAdapter(
      @HiveField(0) PleromaApiAccess value) = _$_UnifediApiAccessPleromaAdapter;
  const _UnifediApiAccessPleromaAdapter._() : super._();

  factory _UnifediApiAccessPleromaAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiAccessPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiAccess get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessPleromaAdapterCopyWith<_UnifediApiAccessPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
