// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_conversation_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiConversationMastodonAdapter
    _$UnifediApiConversationMastodonAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiConversationMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiConversationMastodonAdapterTearOff {
  const _$UnifediApiConversationMastodonAdapterTearOff();

  _UnifediApiConversationMastodonAdapter call(
      @HiveField(0) MastodonApiConversation value) {
    return _UnifediApiConversationMastodonAdapter(
      value,
    );
  }

  UnifediApiConversationMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiConversationMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiConversationMastodonAdapter =
    _$UnifediApiConversationMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiConversationMastodonAdapter {
  @HiveField(0)
  MastodonApiConversation get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiConversationMastodonAdapterCopyWith<
          UnifediApiConversationMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiConversationMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiConversationMastodonAdapterCopyWith(
          UnifediApiConversationMastodonAdapter value,
          $Res Function(UnifediApiConversationMastodonAdapter) then) =
      _$UnifediApiConversationMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiConversation value});

  $MastodonApiConversationCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiConversationMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiConversationMastodonAdapterCopyWith<$Res> {
  _$UnifediApiConversationMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiConversationMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiConversationMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiConversation,
    ));
  }

  @override
  $MastodonApiConversationCopyWith<$Res> get value {
    return $MastodonApiConversationCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiConversationMastodonAdapterCopyWith<$Res>
    implements $UnifediApiConversationMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiConversationMastodonAdapterCopyWith(
          _UnifediApiConversationMastodonAdapter value,
          $Res Function(_UnifediApiConversationMastodonAdapter) then) =
      __$UnifediApiConversationMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiConversation value});

  @override
  $MastodonApiConversationCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiConversationMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiConversationMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiConversationMastodonAdapterCopyWith<$Res> {
  __$UnifediApiConversationMastodonAdapterCopyWithImpl(
      _UnifediApiConversationMastodonAdapter _value,
      $Res Function(_UnifediApiConversationMastodonAdapter) _then)
      : super(
            _value, (v) => _then(v as _UnifediApiConversationMastodonAdapter));

  @override
  _UnifediApiConversationMastodonAdapter get _value =>
      super._value as _UnifediApiConversationMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiConversationMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiConversation,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiConversationMastodonAdapter
    extends _UnifediApiConversationMastodonAdapter {
  const _$_UnifediApiConversationMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiConversationMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiConversationMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiConversation value;

  @override
  String toString() {
    return 'UnifediApiConversationMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiConversationMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiConversationMastodonAdapterCopyWith<
          _UnifediApiConversationMastodonAdapter>
      get copyWith => __$UnifediApiConversationMastodonAdapterCopyWithImpl<
          _UnifediApiConversationMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiConversationMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiConversationMastodonAdapter
    extends UnifediApiConversationMastodonAdapter {
  const factory _UnifediApiConversationMastodonAdapter(
          @HiveField(0) MastodonApiConversation value) =
      _$_UnifediApiConversationMastodonAdapter;
  const _UnifediApiConversationMastodonAdapter._() : super._();

  factory _UnifediApiConversationMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiConversationMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiConversation get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiConversationMastodonAdapterCopyWith<
          _UnifediApiConversationMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
