// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_search_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiSearchResultMastodonAdapter
    _$UnifediApiSearchResultMastodonAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiSearchResultMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiSearchResultMastodonAdapterTearOff {
  const _$UnifediApiSearchResultMastodonAdapterTearOff();

  _UnifediApiSearchResultMastodonAdapter call(
      @HiveField(0) MastodonApiSearchResult value) {
    return _UnifediApiSearchResultMastodonAdapter(
      value,
    );
  }

  UnifediApiSearchResultMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiSearchResultMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiSearchResultMastodonAdapter =
    _$UnifediApiSearchResultMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiSearchResultMastodonAdapter {
  @HiveField(0)
  MastodonApiSearchResult get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiSearchResultMastodonAdapterCopyWith<
          UnifediApiSearchResultMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiSearchResultMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiSearchResultMastodonAdapterCopyWith(
          UnifediApiSearchResultMastodonAdapter value,
          $Res Function(UnifediApiSearchResultMastodonAdapter) then) =
      _$UnifediApiSearchResultMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiSearchResult value});

  $MastodonApiSearchResultCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiSearchResultMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiSearchResultMastodonAdapterCopyWith<$Res> {
  _$UnifediApiSearchResultMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiSearchResultMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiSearchResultMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiSearchResult,
    ));
  }

  @override
  $MastodonApiSearchResultCopyWith<$Res> get value {
    return $MastodonApiSearchResultCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiSearchResultMastodonAdapterCopyWith<$Res>
    implements $UnifediApiSearchResultMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiSearchResultMastodonAdapterCopyWith(
          _UnifediApiSearchResultMastodonAdapter value,
          $Res Function(_UnifediApiSearchResultMastodonAdapter) then) =
      __$UnifediApiSearchResultMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiSearchResult value});

  @override
  $MastodonApiSearchResultCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiSearchResultMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiSearchResultMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiSearchResultMastodonAdapterCopyWith<$Res> {
  __$UnifediApiSearchResultMastodonAdapterCopyWithImpl(
      _UnifediApiSearchResultMastodonAdapter _value,
      $Res Function(_UnifediApiSearchResultMastodonAdapter) _then)
      : super(
            _value, (v) => _then(v as _UnifediApiSearchResultMastodonAdapter));

  @override
  _UnifediApiSearchResultMastodonAdapter get _value =>
      super._value as _UnifediApiSearchResultMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiSearchResultMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiSearchResult,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiSearchResultMastodonAdapter
    extends _UnifediApiSearchResultMastodonAdapter {
  const _$_UnifediApiSearchResultMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiSearchResultMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiSearchResultMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiSearchResult value;

  @override
  String toString() {
    return 'UnifediApiSearchResultMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiSearchResultMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiSearchResultMastodonAdapterCopyWith<
          _UnifediApiSearchResultMastodonAdapter>
      get copyWith => __$UnifediApiSearchResultMastodonAdapterCopyWithImpl<
          _UnifediApiSearchResultMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiSearchResultMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiSearchResultMastodonAdapter
    extends UnifediApiSearchResultMastodonAdapter {
  const factory _UnifediApiSearchResultMastodonAdapter(
          @HiveField(0) MastodonApiSearchResult value) =
      _$_UnifediApiSearchResultMastodonAdapter;
  const _UnifediApiSearchResultMastodonAdapter._() : super._();

  factory _UnifediApiSearchResultMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiSearchResultMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiSearchResult get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiSearchResultMastodonAdapterCopyWith<
          _UnifediApiSearchResultMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
