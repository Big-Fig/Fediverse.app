// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_account_relationship_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccountRelationshipMastodonAdapter
    _$UnifediApiAccountRelationshipMastodonAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiAccountRelationshipMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccountRelationshipMastodonAdapterTearOff {
  const _$UnifediApiAccountRelationshipMastodonAdapterTearOff();

  _UnifediApiAccountRelationshipMastodonAdapter call(
      @HiveField(0) MastodonApiAccountRelationship value) {
    return _UnifediApiAccountRelationshipMastodonAdapter(
      value,
    );
  }

  UnifediApiAccountRelationshipMastodonAdapter fromJson(
      Map<String, Object?> json) {
    return UnifediApiAccountRelationshipMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccountRelationshipMastodonAdapter =
    _$UnifediApiAccountRelationshipMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAccountRelationshipMastodonAdapter {
  @HiveField(0)
  MastodonApiAccountRelationship get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccountRelationshipMastodonAdapterCopyWith<
          UnifediApiAccountRelationshipMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccountRelationshipMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiAccountRelationshipMastodonAdapterCopyWith(
          UnifediApiAccountRelationshipMastodonAdapter value,
          $Res Function(UnifediApiAccountRelationshipMastodonAdapter) then) =
      _$UnifediApiAccountRelationshipMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiAccountRelationship value});

  $MastodonApiAccountRelationshipCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAccountRelationshipMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiAccountRelationshipMastodonAdapterCopyWith<$Res> {
  _$UnifediApiAccountRelationshipMastodonAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiAccountRelationshipMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccountRelationshipMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccountRelationship,
    ));
  }

  @override
  $MastodonApiAccountRelationshipCopyWith<$Res> get value {
    return $MastodonApiAccountRelationshipCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccountRelationshipMastodonAdapterCopyWith<$Res>
    implements $UnifediApiAccountRelationshipMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiAccountRelationshipMastodonAdapterCopyWith(
          _UnifediApiAccountRelationshipMastodonAdapter value,
          $Res Function(_UnifediApiAccountRelationshipMastodonAdapter) then) =
      __$UnifediApiAccountRelationshipMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiAccountRelationship value});

  @override
  $MastodonApiAccountRelationshipCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAccountRelationshipMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAccountRelationshipMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAccountRelationshipMastodonAdapterCopyWith<$Res> {
  __$UnifediApiAccountRelationshipMastodonAdapterCopyWithImpl(
      _UnifediApiAccountRelationshipMastodonAdapter _value,
      $Res Function(_UnifediApiAccountRelationshipMastodonAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiAccountRelationshipMastodonAdapter));

  @override
  _UnifediApiAccountRelationshipMastodonAdapter get _value =>
      super._value as _UnifediApiAccountRelationshipMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAccountRelationshipMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccountRelationship,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccountRelationshipMastodonAdapter
    extends _UnifediApiAccountRelationshipMastodonAdapter {
  const _$_UnifediApiAccountRelationshipMastodonAdapter(
      @HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAccountRelationshipMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccountRelationshipMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiAccountRelationship value;

  @override
  String toString() {
    return 'UnifediApiAccountRelationshipMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiAccountRelationshipMastodonAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccountRelationshipMastodonAdapterCopyWith<
          _UnifediApiAccountRelationshipMastodonAdapter>
      get copyWith =>
          __$UnifediApiAccountRelationshipMastodonAdapterCopyWithImpl<
              _UnifediApiAccountRelationshipMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccountRelationshipMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiAccountRelationshipMastodonAdapter
    extends UnifediApiAccountRelationshipMastodonAdapter {
  const factory _UnifediApiAccountRelationshipMastodonAdapter(
          @HiveField(0) MastodonApiAccountRelationship value) =
      _$_UnifediApiAccountRelationshipMastodonAdapter;
  const _UnifediApiAccountRelationshipMastodonAdapter._() : super._();

  factory _UnifediApiAccountRelationshipMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiAccountRelationshipMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiAccountRelationship get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccountRelationshipMastodonAdapterCopyWith<
          _UnifediApiAccountRelationshipMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
