// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_field_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiFieldMastodonAdapter _$UnifediApiFieldMastodonAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiFieldMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiFieldMastodonAdapterTearOff {
  const _$UnifediApiFieldMastodonAdapterTearOff();

  _UnifediApiFieldMastodonAdapter call(
      @HiveField(0) MastodonApiField valueField) {
    return _UnifediApiFieldMastodonAdapter(
      valueField,
    );
  }

  UnifediApiFieldMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiFieldMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiFieldMastodonAdapter =
    _$UnifediApiFieldMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiFieldMastodonAdapter {
  @HiveField(0)
  MastodonApiField get valueField => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiFieldMastodonAdapterCopyWith<UnifediApiFieldMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiFieldMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiFieldMastodonAdapterCopyWith(
          UnifediApiFieldMastodonAdapter value,
          $Res Function(UnifediApiFieldMastodonAdapter) then) =
      _$UnifediApiFieldMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiField valueField});

  $MastodonApiFieldCopyWith<$Res> get valueField;
}

/// @nodoc
class _$UnifediApiFieldMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiFieldMastodonAdapterCopyWith<$Res> {
  _$UnifediApiFieldMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiFieldMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiFieldMastodonAdapter) _then;

  @override
  $Res call({
    Object? valueField = freezed,
  }) {
    return _then(_value.copyWith(
      valueField: valueField == freezed
          ? _value.valueField
          : valueField // ignore: cast_nullable_to_non_nullable
              as MastodonApiField,
    ));
  }

  @override
  $MastodonApiFieldCopyWith<$Res> get valueField {
    return $MastodonApiFieldCopyWith<$Res>(_value.valueField, (value) {
      return _then(_value.copyWith(valueField: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiFieldMastodonAdapterCopyWith<$Res>
    implements $UnifediApiFieldMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiFieldMastodonAdapterCopyWith(
          _UnifediApiFieldMastodonAdapter value,
          $Res Function(_UnifediApiFieldMastodonAdapter) then) =
      __$UnifediApiFieldMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiField valueField});

  @override
  $MastodonApiFieldCopyWith<$Res> get valueField;
}

/// @nodoc
class __$UnifediApiFieldMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiFieldMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiFieldMastodonAdapterCopyWith<$Res> {
  __$UnifediApiFieldMastodonAdapterCopyWithImpl(
      _UnifediApiFieldMastodonAdapter _value,
      $Res Function(_UnifediApiFieldMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiFieldMastodonAdapter));

  @override
  _UnifediApiFieldMastodonAdapter get _value =>
      super._value as _UnifediApiFieldMastodonAdapter;

  @override
  $Res call({
    Object? valueField = freezed,
  }) {
    return _then(_UnifediApiFieldMastodonAdapter(
      valueField == freezed
          ? _value.valueField
          : valueField // ignore: cast_nullable_to_non_nullable
              as MastodonApiField,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiFieldMastodonAdapter
    extends _UnifediApiFieldMastodonAdapter {
  const _$_UnifediApiFieldMastodonAdapter(@HiveField(0) this.valueField)
      : super._();

  factory _$_UnifediApiFieldMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiFieldMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiField valueField;

  @override
  String toString() {
    return 'UnifediApiFieldMastodonAdapter(valueField: $valueField)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiFieldMastodonAdapter &&
            (identical(other.valueField, valueField) ||
                const DeepCollectionEquality()
                    .equals(other.valueField, valueField)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(valueField);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiFieldMastodonAdapterCopyWith<_UnifediApiFieldMastodonAdapter>
      get copyWith => __$UnifediApiFieldMastodonAdapterCopyWithImpl<
          _UnifediApiFieldMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiFieldMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiFieldMastodonAdapter
    extends UnifediApiFieldMastodonAdapter {
  const factory _UnifediApiFieldMastodonAdapter(
          @HiveField(0) MastodonApiField valueField) =
      _$_UnifediApiFieldMastodonAdapter;
  const _UnifediApiFieldMastodonAdapter._() : super._();

  factory _UnifediApiFieldMastodonAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiFieldMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiField get valueField => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiFieldMastodonAdapterCopyWith<_UnifediApiFieldMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
