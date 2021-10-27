// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_federation_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstanceFederationPleromaAdapter
    _$UnifediApiInstanceFederationPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiInstanceFederationPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstanceFederationPleromaAdapterTearOff {
  const _$UnifediApiInstanceFederationPleromaAdapterTearOff();

  _UnifediApiInstanceFederationPleromaAdapter call(
      @HiveField(0) PleromaApiInstanceFederation value) {
    return _UnifediApiInstanceFederationPleromaAdapter(
      value,
    );
  }

  UnifediApiInstanceFederationPleromaAdapter fromJson(
      Map<String, Object?> json) {
    return UnifediApiInstanceFederationPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstanceFederationPleromaAdapter =
    _$UnifediApiInstanceFederationPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiInstanceFederationPleromaAdapter {
  @HiveField(0)
  PleromaApiInstanceFederation get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiInstanceFederationPleromaAdapterCopyWith<
          UnifediApiInstanceFederationPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstanceFederationPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiInstanceFederationPleromaAdapterCopyWith(
          UnifediApiInstanceFederationPleromaAdapter value,
          $Res Function(UnifediApiInstanceFederationPleromaAdapter) then) =
      _$UnifediApiInstanceFederationPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiInstanceFederation value});

  $PleromaApiInstanceFederationCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiInstanceFederationPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiInstanceFederationPleromaAdapterCopyWith<$Res> {
  _$UnifediApiInstanceFederationPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiInstanceFederationPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstanceFederationPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstanceFederation,
    ));
  }

  @override
  $PleromaApiInstanceFederationCopyWith<$Res> get value {
    return $PleromaApiInstanceFederationCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiInstanceFederationPleromaAdapterCopyWith<$Res>
    implements $UnifediApiInstanceFederationPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiInstanceFederationPleromaAdapterCopyWith(
          _UnifediApiInstanceFederationPleromaAdapter value,
          $Res Function(_UnifediApiInstanceFederationPleromaAdapter) then) =
      __$UnifediApiInstanceFederationPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiInstanceFederation value});

  @override
  $PleromaApiInstanceFederationCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiInstanceFederationPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiInstanceFederationPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiInstanceFederationPleromaAdapterCopyWith<$Res> {
  __$UnifediApiInstanceFederationPleromaAdapterCopyWithImpl(
      _UnifediApiInstanceFederationPleromaAdapter _value,
      $Res Function(_UnifediApiInstanceFederationPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiInstanceFederationPleromaAdapter));

  @override
  _UnifediApiInstanceFederationPleromaAdapter get _value =>
      super._value as _UnifediApiInstanceFederationPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiInstanceFederationPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstanceFederation,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiInstanceFederationPleromaAdapter
    extends _UnifediApiInstanceFederationPleromaAdapter {
  const _$_UnifediApiInstanceFederationPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiInstanceFederationPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiInstanceFederationPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiInstanceFederation value;

  @override
  String toString() {
    return 'UnifediApiInstanceFederationPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiInstanceFederationPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiInstanceFederationPleromaAdapterCopyWith<
          _UnifediApiInstanceFederationPleromaAdapter>
      get copyWith => __$UnifediApiInstanceFederationPleromaAdapterCopyWithImpl<
          _UnifediApiInstanceFederationPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstanceFederationPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiInstanceFederationPleromaAdapter
    extends UnifediApiInstanceFederationPleromaAdapter {
  const factory _UnifediApiInstanceFederationPleromaAdapter(
          @HiveField(0) PleromaApiInstanceFederation value) =
      _$_UnifediApiInstanceFederationPleromaAdapter;
  const _UnifediApiInstanceFederationPleromaAdapter._() : super._();

  factory _UnifediApiInstanceFederationPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiInstanceFederationPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiInstanceFederation get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiInstanceFederationPleromaAdapterCopyWith<
          _UnifediApiInstanceFederationPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
