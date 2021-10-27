// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_card_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiCardMastodonAdapter _$UnifediApiCardMastodonAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiCardMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiCardMastodonAdapterTearOff {
  const _$UnifediApiCardMastodonAdapterTearOff();

  _UnifediApiCardMastodonAdapter call(@HiveField(0) MastodonApiCard value) {
    return _UnifediApiCardMastodonAdapter(
      value,
    );
  }

  UnifediApiCardMastodonAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiCardMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiCardMastodonAdapter = _$UnifediApiCardMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiCardMastodonAdapter {
  @HiveField(0)
  MastodonApiCard get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiCardMastodonAdapterCopyWith<UnifediApiCardMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiCardMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiCardMastodonAdapterCopyWith(
          UnifediApiCardMastodonAdapter value,
          $Res Function(UnifediApiCardMastodonAdapter) then) =
      _$UnifediApiCardMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiCard value});

  $MastodonApiCardCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiCardMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiCardMastodonAdapterCopyWith<$Res> {
  _$UnifediApiCardMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiCardMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiCardMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiCard,
    ));
  }

  @override
  $MastodonApiCardCopyWith<$Res> get value {
    return $MastodonApiCardCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiCardMastodonAdapterCopyWith<$Res>
    implements $UnifediApiCardMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiCardMastodonAdapterCopyWith(
          _UnifediApiCardMastodonAdapter value,
          $Res Function(_UnifediApiCardMastodonAdapter) then) =
      __$UnifediApiCardMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiCard value});

  @override
  $MastodonApiCardCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiCardMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiCardMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiCardMastodonAdapterCopyWith<$Res> {
  __$UnifediApiCardMastodonAdapterCopyWithImpl(
      _UnifediApiCardMastodonAdapter _value,
      $Res Function(_UnifediApiCardMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiCardMastodonAdapter));

  @override
  _UnifediApiCardMastodonAdapter get _value =>
      super._value as _UnifediApiCardMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiCardMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiCard,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiCardMastodonAdapter extends _UnifediApiCardMastodonAdapter {
  const _$_UnifediApiCardMastodonAdapter(@HiveField(0) this.value) : super._();

  factory _$_UnifediApiCardMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiCardMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiCard value;

  @override
  String toString() {
    return 'UnifediApiCardMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiCardMastodonAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiCardMastodonAdapterCopyWith<_UnifediApiCardMastodonAdapter>
      get copyWith => __$UnifediApiCardMastodonAdapterCopyWithImpl<
          _UnifediApiCardMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiCardMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiCardMastodonAdapter
    extends UnifediApiCardMastodonAdapter {
  const factory _UnifediApiCardMastodonAdapter(
      @HiveField(0) MastodonApiCard value) = _$_UnifediApiCardMastodonAdapter;
  const _UnifediApiCardMastodonAdapter._() : super._();

  factory _UnifediApiCardMastodonAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiCardMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiCard get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiCardMastodonAdapterCopyWith<_UnifediApiCardMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
