// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_chat_message_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiChatMessagePleromaAdapter
    _$UnifediApiChatMessagePleromaAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiChatMessagePleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiChatMessagePleromaAdapterTearOff {
  const _$UnifediApiChatMessagePleromaAdapterTearOff();

  _UnifediApiChatMessagePleromaAdapter call(
      @HiveField(0) PleromaApiChatMessage value) {
    return _UnifediApiChatMessagePleromaAdapter(
      value,
    );
  }

  UnifediApiChatMessagePleromaAdapter fromJson(Map<String, Object> json) {
    return UnifediApiChatMessagePleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiChatMessagePleromaAdapter =
    _$UnifediApiChatMessagePleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiChatMessagePleromaAdapter {
  @HiveField(0)
  PleromaApiChatMessage get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiChatMessagePleromaAdapterCopyWith<
          UnifediApiChatMessagePleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiChatMessagePleromaAdapterCopyWith<$Res> {
  factory $UnifediApiChatMessagePleromaAdapterCopyWith(
          UnifediApiChatMessagePleromaAdapter value,
          $Res Function(UnifediApiChatMessagePleromaAdapter) then) =
      _$UnifediApiChatMessagePleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiChatMessage value});

  $PleromaApiChatMessageCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiChatMessagePleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiChatMessagePleromaAdapterCopyWith<$Res> {
  _$UnifediApiChatMessagePleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiChatMessagePleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiChatMessagePleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiChatMessage,
    ));
  }

  @override
  $PleromaApiChatMessageCopyWith<$Res> get value {
    return $PleromaApiChatMessageCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiChatMessagePleromaAdapterCopyWith<$Res>
    implements $UnifediApiChatMessagePleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiChatMessagePleromaAdapterCopyWith(
          _UnifediApiChatMessagePleromaAdapter value,
          $Res Function(_UnifediApiChatMessagePleromaAdapter) then) =
      __$UnifediApiChatMessagePleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiChatMessage value});

  @override
  $PleromaApiChatMessageCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiChatMessagePleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiChatMessagePleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiChatMessagePleromaAdapterCopyWith<$Res> {
  __$UnifediApiChatMessagePleromaAdapterCopyWithImpl(
      _UnifediApiChatMessagePleromaAdapter _value,
      $Res Function(_UnifediApiChatMessagePleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiChatMessagePleromaAdapter));

  @override
  _UnifediApiChatMessagePleromaAdapter get _value =>
      super._value as _UnifediApiChatMessagePleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiChatMessagePleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiChatMessage,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiChatMessagePleromaAdapter
    extends _UnifediApiChatMessagePleromaAdapter {
  const _$_UnifediApiChatMessagePleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiChatMessagePleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiChatMessagePleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiChatMessage value;

  @override
  String toString() {
    return 'UnifediApiChatMessagePleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiChatMessagePleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiChatMessagePleromaAdapterCopyWith<
          _UnifediApiChatMessagePleromaAdapter>
      get copyWith => __$UnifediApiChatMessagePleromaAdapterCopyWithImpl<
          _UnifediApiChatMessagePleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiChatMessagePleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiChatMessagePleromaAdapter
    extends UnifediApiChatMessagePleromaAdapter {
  const factory _UnifediApiChatMessagePleromaAdapter(
          @HiveField(0) PleromaApiChatMessage value) =
      _$_UnifediApiChatMessagePleromaAdapter;
  const _UnifediApiChatMessagePleromaAdapter._() : super._();

  factory _UnifediApiChatMessagePleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiChatMessagePleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiChatMessage get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiChatMessagePleromaAdapterCopyWith<
          _UnifediApiChatMessagePleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
