// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_field_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiFieldPleromaAdapter _$UnifediApiFieldPleromaAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiFieldPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiFieldPleromaAdapterTearOff {
  const _$UnifediApiFieldPleromaAdapterTearOff();

  _UnifediApiFieldPleromaAdapter call(
      @HiveField(0) PleromaApiField valueField) {
    return _UnifediApiFieldPleromaAdapter(
      valueField,
    );
  }

  UnifediApiFieldPleromaAdapter fromJson(Map<String, Object> json) {
    return UnifediApiFieldPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiFieldPleromaAdapter = _$UnifediApiFieldPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiFieldPleromaAdapter {
  @HiveField(0)
  PleromaApiField get valueField => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiFieldPleromaAdapterCopyWith<UnifediApiFieldPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiFieldPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiFieldPleromaAdapterCopyWith(
          UnifediApiFieldPleromaAdapter value,
          $Res Function(UnifediApiFieldPleromaAdapter) then) =
      _$UnifediApiFieldPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiField valueField});

  $PleromaApiFieldCopyWith<$Res> get valueField;
}

/// @nodoc
class _$UnifediApiFieldPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiFieldPleromaAdapterCopyWith<$Res> {
  _$UnifediApiFieldPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiFieldPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiFieldPleromaAdapter) _then;

  @override
  $Res call({
    Object? valueField = freezed,
  }) {
    return _then(_value.copyWith(
      valueField: valueField == freezed
          ? _value.valueField
          : valueField // ignore: cast_nullable_to_non_nullable
              as PleromaApiField,
    ));
  }

  @override
  $PleromaApiFieldCopyWith<$Res> get valueField {
    return $PleromaApiFieldCopyWith<$Res>(_value.valueField, (value) {
      return _then(_value.copyWith(valueField: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiFieldPleromaAdapterCopyWith<$Res>
    implements $UnifediApiFieldPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiFieldPleromaAdapterCopyWith(
          _UnifediApiFieldPleromaAdapter value,
          $Res Function(_UnifediApiFieldPleromaAdapter) then) =
      __$UnifediApiFieldPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiField valueField});

  @override
  $PleromaApiFieldCopyWith<$Res> get valueField;
}

/// @nodoc
class __$UnifediApiFieldPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiFieldPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiFieldPleromaAdapterCopyWith<$Res> {
  __$UnifediApiFieldPleromaAdapterCopyWithImpl(
      _UnifediApiFieldPleromaAdapter _value,
      $Res Function(_UnifediApiFieldPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiFieldPleromaAdapter));

  @override
  _UnifediApiFieldPleromaAdapter get _value =>
      super._value as _UnifediApiFieldPleromaAdapter;

  @override
  $Res call({
    Object? valueField = freezed,
  }) {
    return _then(_UnifediApiFieldPleromaAdapter(
      valueField == freezed
          ? _value.valueField
          : valueField // ignore: cast_nullable_to_non_nullable
              as PleromaApiField,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiFieldPleromaAdapter extends _UnifediApiFieldPleromaAdapter {
  const _$_UnifediApiFieldPleromaAdapter(@HiveField(0) this.valueField)
      : super._();

  factory _$_UnifediApiFieldPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiFieldPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiField valueField;

  @override
  String toString() {
    return 'UnifediApiFieldPleromaAdapter(valueField: $valueField)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiFieldPleromaAdapter &&
            (identical(other.valueField, valueField) ||
                const DeepCollectionEquality()
                    .equals(other.valueField, valueField)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(valueField);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiFieldPleromaAdapterCopyWith<_UnifediApiFieldPleromaAdapter>
      get copyWith => __$UnifediApiFieldPleromaAdapterCopyWithImpl<
          _UnifediApiFieldPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiFieldPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiFieldPleromaAdapter
    extends UnifediApiFieldPleromaAdapter {
  const factory _UnifediApiFieldPleromaAdapter(
          @HiveField(0) PleromaApiField valueField) =
      _$_UnifediApiFieldPleromaAdapter;
  const _UnifediApiFieldPleromaAdapter._() : super._();

  factory _UnifediApiFieldPleromaAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiFieldPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiField get valueField => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiFieldPleromaAdapterCopyWith<_UnifediApiFieldPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
