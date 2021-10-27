// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_access_scopes_item_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccessScopesItemPleromaAdapter
    _$UnifediApiAccessScopesItemPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiAccessScopesItemPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessScopesItemPleromaAdapterTearOff {
  const _$UnifediApiAccessScopesItemPleromaAdapterTearOff();

  _UnifediApiAccessScopesItemPleromaAdapter call(
      @HiveField(0) PleromaApiAccessScopesItem value) {
    return _UnifediApiAccessScopesItemPleromaAdapter(
      value,
    );
  }

  UnifediApiAccessScopesItemPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiAccessScopesItemPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccessScopesItemPleromaAdapter =
    _$UnifediApiAccessScopesItemPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAccessScopesItemPleromaAdapter {
  @HiveField(0)
  PleromaApiAccessScopesItem get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessScopesItemPleromaAdapterCopyWith<
          UnifediApiAccessScopesItemPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessScopesItemPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiAccessScopesItemPleromaAdapterCopyWith(
          UnifediApiAccessScopesItemPleromaAdapter value,
          $Res Function(UnifediApiAccessScopesItemPleromaAdapter) then) =
      _$UnifediApiAccessScopesItemPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiAccessScopesItem value});

  $PleromaApiAccessScopesItemCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAccessScopesItemPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiAccessScopesItemPleromaAdapterCopyWith<$Res> {
  _$UnifediApiAccessScopesItemPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiAccessScopesItemPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccessScopesItemPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessScopesItem,
    ));
  }

  @override
  $PleromaApiAccessScopesItemCopyWith<$Res> get value {
    return $PleromaApiAccessScopesItemCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccessScopesItemPleromaAdapterCopyWith<$Res>
    implements $UnifediApiAccessScopesItemPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiAccessScopesItemPleromaAdapterCopyWith(
          _UnifediApiAccessScopesItemPleromaAdapter value,
          $Res Function(_UnifediApiAccessScopesItemPleromaAdapter) then) =
      __$UnifediApiAccessScopesItemPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiAccessScopesItem value});

  @override
  $PleromaApiAccessScopesItemCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAccessScopesItemPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAccessScopesItemPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAccessScopesItemPleromaAdapterCopyWith<$Res> {
  __$UnifediApiAccessScopesItemPleromaAdapterCopyWithImpl(
      _UnifediApiAccessScopesItemPleromaAdapter _value,
      $Res Function(_UnifediApiAccessScopesItemPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiAccessScopesItemPleromaAdapter));

  @override
  _UnifediApiAccessScopesItemPleromaAdapter get _value =>
      super._value as _UnifediApiAccessScopesItemPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAccessScopesItemPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccessScopesItem,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccessScopesItemPleromaAdapter
    extends _UnifediApiAccessScopesItemPleromaAdapter {
  const _$_UnifediApiAccessScopesItemPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAccessScopesItemPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccessScopesItemPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiAccessScopesItem value;

  @override
  String toString() {
    return 'UnifediApiAccessScopesItemPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiAccessScopesItemPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccessScopesItemPleromaAdapterCopyWith<
          _UnifediApiAccessScopesItemPleromaAdapter>
      get copyWith => __$UnifediApiAccessScopesItemPleromaAdapterCopyWithImpl<
          _UnifediApiAccessScopesItemPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessScopesItemPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiAccessScopesItemPleromaAdapter
    extends UnifediApiAccessScopesItemPleromaAdapter {
  const factory _UnifediApiAccessScopesItemPleromaAdapter(
          @HiveField(0) PleromaApiAccessScopesItem value) =
      _$_UnifediApiAccessScopesItemPleromaAdapter;
  const _UnifediApiAccessScopesItemPleromaAdapter._() : super._();

  factory _UnifediApiAccessScopesItemPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiAccessScopesItemPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiAccessScopesItem get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessScopesItemPleromaAdapterCopyWith<
          _UnifediApiAccessScopesItemPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
