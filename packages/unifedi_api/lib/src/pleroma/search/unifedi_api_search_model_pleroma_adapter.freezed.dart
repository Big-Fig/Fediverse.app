// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_search_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiSearchResultPleromaAdapter
    _$UnifediApiSearchResultPleromaAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiSearchResultPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiSearchResultPleromaAdapterTearOff {
  const _$UnifediApiSearchResultPleromaAdapterTearOff();

  _UnifediApiSearchResultPleromaAdapter call(
      @HiveField(0) PleromaApiSearchResult value) {
    return _UnifediApiSearchResultPleromaAdapter(
      value,
    );
  }

  UnifediApiSearchResultPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiSearchResultPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiSearchResultPleromaAdapter =
    _$UnifediApiSearchResultPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiSearchResultPleromaAdapter {
  @HiveField(0)
  PleromaApiSearchResult get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiSearchResultPleromaAdapterCopyWith<
          UnifediApiSearchResultPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiSearchResultPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiSearchResultPleromaAdapterCopyWith(
          UnifediApiSearchResultPleromaAdapter value,
          $Res Function(UnifediApiSearchResultPleromaAdapter) then) =
      _$UnifediApiSearchResultPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiSearchResult value});

  $PleromaApiSearchResultCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiSearchResultPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiSearchResultPleromaAdapterCopyWith<$Res> {
  _$UnifediApiSearchResultPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiSearchResultPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiSearchResultPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiSearchResult,
    ));
  }

  @override
  $PleromaApiSearchResultCopyWith<$Res> get value {
    return $PleromaApiSearchResultCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiSearchResultPleromaAdapterCopyWith<$Res>
    implements $UnifediApiSearchResultPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiSearchResultPleromaAdapterCopyWith(
          _UnifediApiSearchResultPleromaAdapter value,
          $Res Function(_UnifediApiSearchResultPleromaAdapter) then) =
      __$UnifediApiSearchResultPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiSearchResult value});

  @override
  $PleromaApiSearchResultCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiSearchResultPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiSearchResultPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiSearchResultPleromaAdapterCopyWith<$Res> {
  __$UnifediApiSearchResultPleromaAdapterCopyWithImpl(
      _UnifediApiSearchResultPleromaAdapter _value,
      $Res Function(_UnifediApiSearchResultPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiSearchResultPleromaAdapter));

  @override
  _UnifediApiSearchResultPleromaAdapter get _value =>
      super._value as _UnifediApiSearchResultPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiSearchResultPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiSearchResult,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiSearchResultPleromaAdapter
    extends _UnifediApiSearchResultPleromaAdapter {
  const _$_UnifediApiSearchResultPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiSearchResultPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiSearchResultPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiSearchResult value;

  @override
  String toString() {
    return 'UnifediApiSearchResultPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiSearchResultPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiSearchResultPleromaAdapterCopyWith<
          _UnifediApiSearchResultPleromaAdapter>
      get copyWith => __$UnifediApiSearchResultPleromaAdapterCopyWithImpl<
          _UnifediApiSearchResultPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiSearchResultPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiSearchResultPleromaAdapter
    extends UnifediApiSearchResultPleromaAdapter {
  const factory _UnifediApiSearchResultPleromaAdapter(
          @HiveField(0) PleromaApiSearchResult value) =
      _$_UnifediApiSearchResultPleromaAdapter;
  const _UnifediApiSearchResultPleromaAdapter._() : super._();

  factory _UnifediApiSearchResultPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiSearchResultPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiSearchResult get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiSearchResultPleromaAdapterCopyWith<
          _UnifediApiSearchResultPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
