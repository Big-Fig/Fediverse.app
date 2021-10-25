// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_mention_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiMentionMastodonAdapter _$UnifediApiMentionMastodonAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiMentionMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiMentionMastodonAdapterTearOff {
  const _$UnifediApiMentionMastodonAdapterTearOff();

  _UnifediApiMentionMastodonAdapter call(
      @HiveField(0) MastodonApiMention value) {
    return _UnifediApiMentionMastodonAdapter(
      value,
    );
  }

  UnifediApiMentionMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiMentionMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiMentionMastodonAdapter =
    _$UnifediApiMentionMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiMentionMastodonAdapter {
  @HiveField(0)
  MastodonApiMention get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiMentionMastodonAdapterCopyWith<UnifediApiMentionMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiMentionMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiMentionMastodonAdapterCopyWith(
          UnifediApiMentionMastodonAdapter value,
          $Res Function(UnifediApiMentionMastodonAdapter) then) =
      _$UnifediApiMentionMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiMention value});

  $MastodonApiMentionCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiMentionMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiMentionMastodonAdapterCopyWith<$Res> {
  _$UnifediApiMentionMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiMentionMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiMentionMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiMention,
    ));
  }

  @override
  $MastodonApiMentionCopyWith<$Res> get value {
    return $MastodonApiMentionCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiMentionMastodonAdapterCopyWith<$Res>
    implements $UnifediApiMentionMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiMentionMastodonAdapterCopyWith(
          _UnifediApiMentionMastodonAdapter value,
          $Res Function(_UnifediApiMentionMastodonAdapter) then) =
      __$UnifediApiMentionMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiMention value});

  @override
  $MastodonApiMentionCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiMentionMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiMentionMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiMentionMastodonAdapterCopyWith<$Res> {
  __$UnifediApiMentionMastodonAdapterCopyWithImpl(
      _UnifediApiMentionMastodonAdapter _value,
      $Res Function(_UnifediApiMentionMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiMentionMastodonAdapter));

  @override
  _UnifediApiMentionMastodonAdapter get _value =>
      super._value as _UnifediApiMentionMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiMentionMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiMention,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiMentionMastodonAdapter
    extends _UnifediApiMentionMastodonAdapter {
  const _$_UnifediApiMentionMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiMentionMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiMentionMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiMention value;

  @override
  String toString() {
    return 'UnifediApiMentionMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiMentionMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiMentionMastodonAdapterCopyWith<_UnifediApiMentionMastodonAdapter>
      get copyWith => __$UnifediApiMentionMastodonAdapterCopyWithImpl<
          _UnifediApiMentionMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiMentionMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiMentionMastodonAdapter
    extends UnifediApiMentionMastodonAdapter {
  const factory _UnifediApiMentionMastodonAdapter(
          @HiveField(0) MastodonApiMention value) =
      _$_UnifediApiMentionMastodonAdapter;
  const _UnifediApiMentionMastodonAdapter._() : super._();

  factory _UnifediApiMentionMastodonAdapter.fromJson(
      Map<String, dynamic> json) = _$_UnifediApiMentionMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiMention get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiMentionMastodonAdapterCopyWith<_UnifediApiMentionMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
