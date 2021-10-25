// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_activity_item_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstanceActivityItemMastodonAdapter
    _$UnifediApiInstanceActivityItemMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiInstanceActivityItemMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstanceActivityItemMastodonAdapterTearOff {
  const _$UnifediApiInstanceActivityItemMastodonAdapterTearOff();

  _UnifediApiInstanceActivityItemMastodonAdapter call(
      @HiveField(0) MastodonApiInstanceActivityItem value) {
    return _UnifediApiInstanceActivityItemMastodonAdapter(
      value,
    );
  }

  UnifediApiInstanceActivityItemMastodonAdapter fromJson(
      Map<String, Object> json) {
    return UnifediApiInstanceActivityItemMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstanceActivityItemMastodonAdapter =
    _$UnifediApiInstanceActivityItemMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiInstanceActivityItemMastodonAdapter {
  @HiveField(0)
  MastodonApiInstanceActivityItem get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiInstanceActivityItemMastodonAdapterCopyWith<
          UnifediApiInstanceActivityItemMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstanceActivityItemMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiInstanceActivityItemMastodonAdapterCopyWith(
          UnifediApiInstanceActivityItemMastodonAdapter value,
          $Res Function(UnifediApiInstanceActivityItemMastodonAdapter) then) =
      _$UnifediApiInstanceActivityItemMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiInstanceActivityItem value});

  $MastodonApiInstanceActivityItemCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiInstanceActivityItemMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiInstanceActivityItemMastodonAdapterCopyWith<$Res> {
  _$UnifediApiInstanceActivityItemMastodonAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiInstanceActivityItemMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstanceActivityItemMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiInstanceActivityItem,
    ));
  }

  @override
  $MastodonApiInstanceActivityItemCopyWith<$Res> get value {
    return $MastodonApiInstanceActivityItemCopyWith<$Res>(_value.value,
        (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiInstanceActivityItemMastodonAdapterCopyWith<$Res>
    implements $UnifediApiInstanceActivityItemMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiInstanceActivityItemMastodonAdapterCopyWith(
          _UnifediApiInstanceActivityItemMastodonAdapter value,
          $Res Function(_UnifediApiInstanceActivityItemMastodonAdapter) then) =
      __$UnifediApiInstanceActivityItemMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiInstanceActivityItem value});

  @override
  $MastodonApiInstanceActivityItemCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiInstanceActivityItemMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiInstanceActivityItemMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiInstanceActivityItemMastodonAdapterCopyWith<$Res> {
  __$UnifediApiInstanceActivityItemMastodonAdapterCopyWithImpl(
      _UnifediApiInstanceActivityItemMastodonAdapter _value,
      $Res Function(_UnifediApiInstanceActivityItemMastodonAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiInstanceActivityItemMastodonAdapter));

  @override
  _UnifediApiInstanceActivityItemMastodonAdapter get _value =>
      super._value as _UnifediApiInstanceActivityItemMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiInstanceActivityItemMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiInstanceActivityItem,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiInstanceActivityItemMastodonAdapter
    extends _UnifediApiInstanceActivityItemMastodonAdapter {
  const _$_UnifediApiInstanceActivityItemMastodonAdapter(
      @HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiInstanceActivityItemMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiInstanceActivityItemMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiInstanceActivityItem value;

  @override
  String toString() {
    return 'UnifediApiInstanceActivityItemMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiInstanceActivityItemMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiInstanceActivityItemMastodonAdapterCopyWith<
          _UnifediApiInstanceActivityItemMastodonAdapter>
      get copyWith =>
          __$UnifediApiInstanceActivityItemMastodonAdapterCopyWithImpl<
              _UnifediApiInstanceActivityItemMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstanceActivityItemMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiInstanceActivityItemMastodonAdapter
    extends UnifediApiInstanceActivityItemMastodonAdapter {
  const factory _UnifediApiInstanceActivityItemMastodonAdapter(
          @HiveField(0) MastodonApiInstanceActivityItem value) =
      _$_UnifediApiInstanceActivityItemMastodonAdapter;
  const _UnifediApiInstanceActivityItemMastodonAdapter._() : super._();

  factory _UnifediApiInstanceActivityItemMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiInstanceActivityItemMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiInstanceActivityItem get value =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiInstanceActivityItemMastodonAdapterCopyWith<
          _UnifediApiInstanceActivityItemMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
