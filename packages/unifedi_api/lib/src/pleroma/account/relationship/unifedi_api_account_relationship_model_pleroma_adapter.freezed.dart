// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_account_relationship_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccountRelationshipPleromaAdapter
    _$UnifediApiAccountRelationshipPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiAccountRelationshipPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccountRelationshipPleromaAdapterTearOff {
  const _$UnifediApiAccountRelationshipPleromaAdapterTearOff();

  _UnifediApiAccountRelationshipPleromaAdapter call(
      @HiveField(0) PleromaApiAccountRelationship value) {
    return _UnifediApiAccountRelationshipPleromaAdapter(
      value,
    );
  }

  UnifediApiAccountRelationshipPleromaAdapter fromJson(
      Map<String, Object> json) {
    return UnifediApiAccountRelationshipPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccountRelationshipPleromaAdapter =
    _$UnifediApiAccountRelationshipPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAccountRelationshipPleromaAdapter {
  @HiveField(0)
  PleromaApiAccountRelationship get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccountRelationshipPleromaAdapterCopyWith<
          UnifediApiAccountRelationshipPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccountRelationshipPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiAccountRelationshipPleromaAdapterCopyWith(
          UnifediApiAccountRelationshipPleromaAdapter value,
          $Res Function(UnifediApiAccountRelationshipPleromaAdapter) then) =
      _$UnifediApiAccountRelationshipPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiAccountRelationship value});

  $PleromaApiAccountRelationshipCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAccountRelationshipPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiAccountRelationshipPleromaAdapterCopyWith<$Res> {
  _$UnifediApiAccountRelationshipPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiAccountRelationshipPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccountRelationshipPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccountRelationship,
    ));
  }

  @override
  $PleromaApiAccountRelationshipCopyWith<$Res> get value {
    return $PleromaApiAccountRelationshipCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccountRelationshipPleromaAdapterCopyWith<$Res>
    implements $UnifediApiAccountRelationshipPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiAccountRelationshipPleromaAdapterCopyWith(
          _UnifediApiAccountRelationshipPleromaAdapter value,
          $Res Function(_UnifediApiAccountRelationshipPleromaAdapter) then) =
      __$UnifediApiAccountRelationshipPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiAccountRelationship value});

  @override
  $PleromaApiAccountRelationshipCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAccountRelationshipPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAccountRelationshipPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAccountRelationshipPleromaAdapterCopyWith<$Res> {
  __$UnifediApiAccountRelationshipPleromaAdapterCopyWithImpl(
      _UnifediApiAccountRelationshipPleromaAdapter _value,
      $Res Function(_UnifediApiAccountRelationshipPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiAccountRelationshipPleromaAdapter));

  @override
  _UnifediApiAccountRelationshipPleromaAdapter get _value =>
      super._value as _UnifediApiAccountRelationshipPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAccountRelationshipPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccountRelationship,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccountRelationshipPleromaAdapter
    extends _UnifediApiAccountRelationshipPleromaAdapter {
  const _$_UnifediApiAccountRelationshipPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAccountRelationshipPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccountRelationshipPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiAccountRelationship value;

  @override
  String toString() {
    return 'UnifediApiAccountRelationshipPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiAccountRelationshipPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccountRelationshipPleromaAdapterCopyWith<
          _UnifediApiAccountRelationshipPleromaAdapter>
      get copyWith =>
          __$UnifediApiAccountRelationshipPleromaAdapterCopyWithImpl<
              _UnifediApiAccountRelationshipPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccountRelationshipPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiAccountRelationshipPleromaAdapter
    extends UnifediApiAccountRelationshipPleromaAdapter {
  const factory _UnifediApiAccountRelationshipPleromaAdapter(
          @HiveField(0) PleromaApiAccountRelationship value) =
      _$_UnifediApiAccountRelationshipPleromaAdapter;
  const _UnifediApiAccountRelationshipPleromaAdapter._() : super._();

  factory _UnifediApiAccountRelationshipPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiAccountRelationshipPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiAccountRelationship get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccountRelationshipPleromaAdapterCopyWith<
          _UnifediApiAccountRelationshipPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
