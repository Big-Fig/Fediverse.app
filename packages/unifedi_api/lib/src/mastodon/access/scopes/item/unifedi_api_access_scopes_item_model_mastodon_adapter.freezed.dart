// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_access_scopes_item_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccessScopesItemMastodonAdapter
    _$UnifediApiAccessScopesItemMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiAccessScopesItemMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessScopesItemMastodonAdapterTearOff {
  const _$UnifediApiAccessScopesItemMastodonAdapterTearOff();

  _UnifediApiAccessScopesItemMastodonAdapter call(
      @HiveField(0) MastodonApiAccessScopesItem value) {
    return _UnifediApiAccessScopesItemMastodonAdapter(
      value,
    );
  }

  UnifediApiAccessScopesItemMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiAccessScopesItemMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccessScopesItemMastodonAdapter =
    _$UnifediApiAccessScopesItemMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAccessScopesItemMastodonAdapter {
  @HiveField(0)
  MastodonApiAccessScopesItem get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessScopesItemMastodonAdapterCopyWith<
          UnifediApiAccessScopesItemMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessScopesItemMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiAccessScopesItemMastodonAdapterCopyWith(
          UnifediApiAccessScopesItemMastodonAdapter value,
          $Res Function(UnifediApiAccessScopesItemMastodonAdapter) then) =
      _$UnifediApiAccessScopesItemMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiAccessScopesItem value});

  $MastodonApiAccessScopesItemCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAccessScopesItemMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiAccessScopesItemMastodonAdapterCopyWith<$Res> {
  _$UnifediApiAccessScopesItemMastodonAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiAccessScopesItemMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccessScopesItemMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessScopesItem,
    ));
  }

  @override
  $MastodonApiAccessScopesItemCopyWith<$Res> get value {
    return $MastodonApiAccessScopesItemCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccessScopesItemMastodonAdapterCopyWith<$Res>
    implements $UnifediApiAccessScopesItemMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiAccessScopesItemMastodonAdapterCopyWith(
          _UnifediApiAccessScopesItemMastodonAdapter value,
          $Res Function(_UnifediApiAccessScopesItemMastodonAdapter) then) =
      __$UnifediApiAccessScopesItemMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiAccessScopesItem value});

  @override
  $MastodonApiAccessScopesItemCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAccessScopesItemMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAccessScopesItemMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAccessScopesItemMastodonAdapterCopyWith<$Res> {
  __$UnifediApiAccessScopesItemMastodonAdapterCopyWithImpl(
      _UnifediApiAccessScopesItemMastodonAdapter _value,
      $Res Function(_UnifediApiAccessScopesItemMastodonAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiAccessScopesItemMastodonAdapter));

  @override
  _UnifediApiAccessScopesItemMastodonAdapter get _value =>
      super._value as _UnifediApiAccessScopesItemMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAccessScopesItemMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccessScopesItem,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccessScopesItemMastodonAdapter
    extends _UnifediApiAccessScopesItemMastodonAdapter {
  const _$_UnifediApiAccessScopesItemMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAccessScopesItemMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccessScopesItemMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiAccessScopesItem value;

  @override
  String toString() {
    return 'UnifediApiAccessScopesItemMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiAccessScopesItemMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccessScopesItemMastodonAdapterCopyWith<
          _UnifediApiAccessScopesItemMastodonAdapter>
      get copyWith => __$UnifediApiAccessScopesItemMastodonAdapterCopyWithImpl<
          _UnifediApiAccessScopesItemMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessScopesItemMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiAccessScopesItemMastodonAdapter
    extends UnifediApiAccessScopesItemMastodonAdapter {
  const factory _UnifediApiAccessScopesItemMastodonAdapter(
          @HiveField(0) MastodonApiAccessScopesItem value) =
      _$_UnifediApiAccessScopesItemMastodonAdapter;
  const _UnifediApiAccessScopesItemMastodonAdapter._() : super._();

  factory _UnifediApiAccessScopesItemMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiAccessScopesItemMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiAccessScopesItem get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessScopesItemMastodonAdapterCopyWith<
          _UnifediApiAccessScopesItemMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
