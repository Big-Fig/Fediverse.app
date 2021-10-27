// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_pagination_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPaginationMastodonAdapter
    _$UnifediApiPaginationMastodonAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiPaginationMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiPaginationMastodonAdapterTearOff {
  const _$UnifediApiPaginationMastodonAdapterTearOff();

  _UnifediApiPaginationMastodonAdapter call(
      @HiveField(0) MastodonApiPagination valuePagination) {
    return _UnifediApiPaginationMastodonAdapter(
      valuePagination,
    );
  }

  UnifediApiPaginationMastodonAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiPaginationMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPaginationMastodonAdapter =
    _$UnifediApiPaginationMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiPaginationMastodonAdapter {
  @HiveField(0)
  MastodonApiPagination get valuePagination =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPaginationMastodonAdapterCopyWith<
          UnifediApiPaginationMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPaginationMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiPaginationMastodonAdapterCopyWith(
          UnifediApiPaginationMastodonAdapter value,
          $Res Function(UnifediApiPaginationMastodonAdapter) then) =
      _$UnifediApiPaginationMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiPagination valuePagination});

  $MastodonApiPaginationCopyWith<$Res> get valuePagination;
}

/// @nodoc
class _$UnifediApiPaginationMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiPaginationMastodonAdapterCopyWith<$Res> {
  _$UnifediApiPaginationMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiPaginationMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPaginationMastodonAdapter) _then;

  @override
  $Res call({
    Object? valuePagination = freezed,
  }) {
    return _then(_value.copyWith(
      valuePagination: valuePagination == freezed
          ? _value.valuePagination
          : valuePagination // ignore: cast_nullable_to_non_nullable
              as MastodonApiPagination,
    ));
  }

  @override
  $MastodonApiPaginationCopyWith<$Res> get valuePagination {
    return $MastodonApiPaginationCopyWith<$Res>(_value.valuePagination,
        (value) {
      return _then(_value.copyWith(valuePagination: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiPaginationMastodonAdapterCopyWith<$Res>
    implements $UnifediApiPaginationMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiPaginationMastodonAdapterCopyWith(
          _UnifediApiPaginationMastodonAdapter value,
          $Res Function(_UnifediApiPaginationMastodonAdapter) then) =
      __$UnifediApiPaginationMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiPagination valuePagination});

  @override
  $MastodonApiPaginationCopyWith<$Res> get valuePagination;
}

/// @nodoc
class __$UnifediApiPaginationMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiPaginationMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiPaginationMastodonAdapterCopyWith<$Res> {
  __$UnifediApiPaginationMastodonAdapterCopyWithImpl(
      _UnifediApiPaginationMastodonAdapter _value,
      $Res Function(_UnifediApiPaginationMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiPaginationMastodonAdapter));

  @override
  _UnifediApiPaginationMastodonAdapter get _value =>
      super._value as _UnifediApiPaginationMastodonAdapter;

  @override
  $Res call({
    Object? valuePagination = freezed,
  }) {
    return _then(_UnifediApiPaginationMastodonAdapter(
      valuePagination == freezed
          ? _value.valuePagination
          : valuePagination // ignore: cast_nullable_to_non_nullable
              as MastodonApiPagination,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPaginationMastodonAdapter
    extends _UnifediApiPaginationMastodonAdapter {
  const _$_UnifediApiPaginationMastodonAdapter(
      @HiveField(0) this.valuePagination)
      : super._();

  factory _$_UnifediApiPaginationMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiPaginationMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiPagination valuePagination;

  @override
  String toString() {
    return 'UnifediApiPaginationMastodonAdapter(valuePagination: $valuePagination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiPaginationMastodonAdapter &&
            (identical(other.valuePagination, valuePagination) ||
                other.valuePagination == valuePagination));
  }

  @override
  int get hashCode => Object.hash(runtimeType, valuePagination);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPaginationMastodonAdapterCopyWith<
          _UnifediApiPaginationMastodonAdapter>
      get copyWith => __$UnifediApiPaginationMastodonAdapterCopyWithImpl<
          _UnifediApiPaginationMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPaginationMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiPaginationMastodonAdapter
    extends UnifediApiPaginationMastodonAdapter {
  const factory _UnifediApiPaginationMastodonAdapter(
          @HiveField(0) MastodonApiPagination valuePagination) =
      _$_UnifediApiPaginationMastodonAdapter;
  const _UnifediApiPaginationMastodonAdapter._() : super._();

  factory _UnifediApiPaginationMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiPaginationMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiPagination get valuePagination;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPaginationMastodonAdapterCopyWith<
          _UnifediApiPaginationMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
