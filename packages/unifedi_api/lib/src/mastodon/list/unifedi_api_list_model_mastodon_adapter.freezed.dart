// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_list_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiListMastodonAdapter _$UnifediApiListMastodonAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiListMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiListMastodonAdapterTearOff {
  const _$UnifediApiListMastodonAdapterTearOff();

  _UnifediApiListMastodonAdapter call(@HiveField(0) MastodonApiList value) {
    return _UnifediApiListMastodonAdapter(
      value,
    );
  }

  UnifediApiListMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiListMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiListMastodonAdapter = _$UnifediApiListMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiListMastodonAdapter {
  @HiveField(0)
  MastodonApiList get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiListMastodonAdapterCopyWith<UnifediApiListMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiListMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiListMastodonAdapterCopyWith(
          UnifediApiListMastodonAdapter value,
          $Res Function(UnifediApiListMastodonAdapter) then) =
      _$UnifediApiListMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiList value});

  $MastodonApiListCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiListMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiListMastodonAdapterCopyWith<$Res> {
  _$UnifediApiListMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiListMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiListMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiList,
    ));
  }

  @override
  $MastodonApiListCopyWith<$Res> get value {
    return $MastodonApiListCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiListMastodonAdapterCopyWith<$Res>
    implements $UnifediApiListMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiListMastodonAdapterCopyWith(
          _UnifediApiListMastodonAdapter value,
          $Res Function(_UnifediApiListMastodonAdapter) then) =
      __$UnifediApiListMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiList value});

  @override
  $MastodonApiListCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiListMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiListMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiListMastodonAdapterCopyWith<$Res> {
  __$UnifediApiListMastodonAdapterCopyWithImpl(
      _UnifediApiListMastodonAdapter _value,
      $Res Function(_UnifediApiListMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiListMastodonAdapter));

  @override
  _UnifediApiListMastodonAdapter get _value =>
      super._value as _UnifediApiListMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiListMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiList,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiListMastodonAdapter extends _UnifediApiListMastodonAdapter {
  const _$_UnifediApiListMastodonAdapter(@HiveField(0) this.value) : super._();

  factory _$_UnifediApiListMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiListMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiList value;

  @override
  String toString() {
    return 'UnifediApiListMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiListMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiListMastodonAdapterCopyWith<_UnifediApiListMastodonAdapter>
      get copyWith => __$UnifediApiListMastodonAdapterCopyWithImpl<
          _UnifediApiListMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiListMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiListMastodonAdapter
    extends UnifediApiListMastodonAdapter {
  const factory _UnifediApiListMastodonAdapter(
      @HiveField(0) MastodonApiList value) = _$_UnifediApiListMastodonAdapter;
  const _UnifediApiListMastodonAdapter._() : super._();

  factory _UnifediApiListMastodonAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiListMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiList get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiListMastodonAdapterCopyWith<_UnifediApiListMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
