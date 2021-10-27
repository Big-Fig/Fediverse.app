// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_pagination_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPaginationPleromaAdapter _$UnifediApiPaginationPleromaAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiPaginationPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiPaginationPleromaAdapterTearOff {
  const _$UnifediApiPaginationPleromaAdapterTearOff();

  _UnifediApiPaginationPleromaAdapter call(
      @HiveField(0) PleromaApiPagination valuePagination) {
    return _UnifediApiPaginationPleromaAdapter(
      valuePagination,
    );
  }

  UnifediApiPaginationPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiPaginationPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPaginationPleromaAdapter =
    _$UnifediApiPaginationPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiPaginationPleromaAdapter {
  @HiveField(0)
  PleromaApiPagination get valuePagination =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPaginationPleromaAdapterCopyWith<
          UnifediApiPaginationPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPaginationPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiPaginationPleromaAdapterCopyWith(
          UnifediApiPaginationPleromaAdapter value,
          $Res Function(UnifediApiPaginationPleromaAdapter) then) =
      _$UnifediApiPaginationPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiPagination valuePagination});

  $PleromaApiPaginationCopyWith<$Res> get valuePagination;
}

/// @nodoc
class _$UnifediApiPaginationPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiPaginationPleromaAdapterCopyWith<$Res> {
  _$UnifediApiPaginationPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiPaginationPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPaginationPleromaAdapter) _then;

  @override
  $Res call({
    Object? valuePagination = freezed,
  }) {
    return _then(_value.copyWith(
      valuePagination: valuePagination == freezed
          ? _value.valuePagination
          : valuePagination // ignore: cast_nullable_to_non_nullable
              as PleromaApiPagination,
    ));
  }

  @override
  $PleromaApiPaginationCopyWith<$Res> get valuePagination {
    return $PleromaApiPaginationCopyWith<$Res>(_value.valuePagination, (value) {
      return _then(_value.copyWith(valuePagination: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiPaginationPleromaAdapterCopyWith<$Res>
    implements $UnifediApiPaginationPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiPaginationPleromaAdapterCopyWith(
          _UnifediApiPaginationPleromaAdapter value,
          $Res Function(_UnifediApiPaginationPleromaAdapter) then) =
      __$UnifediApiPaginationPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiPagination valuePagination});

  @override
  $PleromaApiPaginationCopyWith<$Res> get valuePagination;
}

/// @nodoc
class __$UnifediApiPaginationPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiPaginationPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiPaginationPleromaAdapterCopyWith<$Res> {
  __$UnifediApiPaginationPleromaAdapterCopyWithImpl(
      _UnifediApiPaginationPleromaAdapter _value,
      $Res Function(_UnifediApiPaginationPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiPaginationPleromaAdapter));

  @override
  _UnifediApiPaginationPleromaAdapter get _value =>
      super._value as _UnifediApiPaginationPleromaAdapter;

  @override
  $Res call({
    Object? valuePagination = freezed,
  }) {
    return _then(_UnifediApiPaginationPleromaAdapter(
      valuePagination == freezed
          ? _value.valuePagination
          : valuePagination // ignore: cast_nullable_to_non_nullable
              as PleromaApiPagination,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPaginationPleromaAdapter
    extends _UnifediApiPaginationPleromaAdapter {
  const _$_UnifediApiPaginationPleromaAdapter(
      @HiveField(0) this.valuePagination)
      : super._();

  factory _$_UnifediApiPaginationPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiPaginationPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiPagination valuePagination;

  @override
  String toString() {
    return 'UnifediApiPaginationPleromaAdapter(valuePagination: $valuePagination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiPaginationPleromaAdapter &&
            (identical(other.valuePagination, valuePagination) ||
                other.valuePagination == valuePagination));
  }

  @override
  int get hashCode => Object.hash(runtimeType, valuePagination);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPaginationPleromaAdapterCopyWith<
          _UnifediApiPaginationPleromaAdapter>
      get copyWith => __$UnifediApiPaginationPleromaAdapterCopyWithImpl<
          _UnifediApiPaginationPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPaginationPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiPaginationPleromaAdapter
    extends UnifediApiPaginationPleromaAdapter {
  const factory _UnifediApiPaginationPleromaAdapter(
          @HiveField(0) PleromaApiPagination valuePagination) =
      _$_UnifediApiPaginationPleromaAdapter;
  const _UnifediApiPaginationPleromaAdapter._() : super._();

  factory _UnifediApiPaginationPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiPaginationPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiPagination get valuePagination;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPaginationPleromaAdapterCopyWith<
          _UnifediApiPaginationPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
