// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_tag_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiTagMastodonAdapter _$UnifediApiTagMastodonAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiTagMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiTagMastodonAdapterTearOff {
  const _$UnifediApiTagMastodonAdapterTearOff();

  _UnifediApiTagMastodonAdapter call(@HiveField(0) MastodonApiTag value) {
    return _UnifediApiTagMastodonAdapter(
      value,
    );
  }

  UnifediApiTagMastodonAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiTagMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiTagMastodonAdapter = _$UnifediApiTagMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiTagMastodonAdapter {
  @HiveField(0)
  MastodonApiTag get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiTagMastodonAdapterCopyWith<UnifediApiTagMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiTagMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiTagMastodonAdapterCopyWith(
          UnifediApiTagMastodonAdapter value,
          $Res Function(UnifediApiTagMastodonAdapter) then) =
      _$UnifediApiTagMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiTag value});

  $MastodonApiTagCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiTagMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiTagMastodonAdapterCopyWith<$Res> {
  _$UnifediApiTagMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiTagMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiTagMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiTag,
    ));
  }

  @override
  $MastodonApiTagCopyWith<$Res> get value {
    return $MastodonApiTagCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiTagMastodonAdapterCopyWith<$Res>
    implements $UnifediApiTagMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiTagMastodonAdapterCopyWith(
          _UnifediApiTagMastodonAdapter value,
          $Res Function(_UnifediApiTagMastodonAdapter) then) =
      __$UnifediApiTagMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiTag value});

  @override
  $MastodonApiTagCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiTagMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiTagMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiTagMastodonAdapterCopyWith<$Res> {
  __$UnifediApiTagMastodonAdapterCopyWithImpl(
      _UnifediApiTagMastodonAdapter _value,
      $Res Function(_UnifediApiTagMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiTagMastodonAdapter));

  @override
  _UnifediApiTagMastodonAdapter get _value =>
      super._value as _UnifediApiTagMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiTagMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiTag,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiTagMastodonAdapter extends _UnifediApiTagMastodonAdapter {
  const _$_UnifediApiTagMastodonAdapter(@HiveField(0) this.value) : super._();

  factory _$_UnifediApiTagMastodonAdapter.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiTagMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiTag value;

  @override
  String toString() {
    return 'UnifediApiTagMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiTagMastodonAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiTagMastodonAdapterCopyWith<_UnifediApiTagMastodonAdapter>
      get copyWith => __$UnifediApiTagMastodonAdapterCopyWithImpl<
          _UnifediApiTagMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiTagMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiTagMastodonAdapter
    extends UnifediApiTagMastodonAdapter {
  const factory _UnifediApiTagMastodonAdapter(
      @HiveField(0) MastodonApiTag value) = _$_UnifediApiTagMastodonAdapter;
  const _UnifediApiTagMastodonAdapter._() : super._();

  factory _UnifediApiTagMastodonAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiTagMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiTag get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiTagMastodonAdapterCopyWith<_UnifediApiTagMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
