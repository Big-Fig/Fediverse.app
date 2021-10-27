// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_post_chat_message_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPostChatMessagePleromaAdapter
    _$UnifediApiPostChatMessagePleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiPostChatMessagePleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiPostChatMessagePleromaAdapterTearOff {
  const _$UnifediApiPostChatMessagePleromaAdapterTearOff();

  _UnifediApiPostChatMessagePleromaAdapter call(
      @HiveField(0) PleromaApiPostChatMessage value) {
    return _UnifediApiPostChatMessagePleromaAdapter(
      value,
    );
  }

  UnifediApiPostChatMessagePleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiPostChatMessagePleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPostChatMessagePleromaAdapter =
    _$UnifediApiPostChatMessagePleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiPostChatMessagePleromaAdapter {
  @HiveField(0)
  PleromaApiPostChatMessage get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPostChatMessagePleromaAdapterCopyWith<
          UnifediApiPostChatMessagePleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPostChatMessagePleromaAdapterCopyWith<$Res> {
  factory $UnifediApiPostChatMessagePleromaAdapterCopyWith(
          UnifediApiPostChatMessagePleromaAdapter value,
          $Res Function(UnifediApiPostChatMessagePleromaAdapter) then) =
      _$UnifediApiPostChatMessagePleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiPostChatMessage value});

  $PleromaApiPostChatMessageCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiPostChatMessagePleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiPostChatMessagePleromaAdapterCopyWith<$Res> {
  _$UnifediApiPostChatMessagePleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiPostChatMessagePleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPostChatMessagePleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiPostChatMessage,
    ));
  }

  @override
  $PleromaApiPostChatMessageCopyWith<$Res> get value {
    return $PleromaApiPostChatMessageCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiPostChatMessagePleromaAdapterCopyWith<$Res>
    implements $UnifediApiPostChatMessagePleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiPostChatMessagePleromaAdapterCopyWith(
          _UnifediApiPostChatMessagePleromaAdapter value,
          $Res Function(_UnifediApiPostChatMessagePleromaAdapter) then) =
      __$UnifediApiPostChatMessagePleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiPostChatMessage value});

  @override
  $PleromaApiPostChatMessageCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiPostChatMessagePleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiPostChatMessagePleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiPostChatMessagePleromaAdapterCopyWith<$Res> {
  __$UnifediApiPostChatMessagePleromaAdapterCopyWithImpl(
      _UnifediApiPostChatMessagePleromaAdapter _value,
      $Res Function(_UnifediApiPostChatMessagePleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiPostChatMessagePleromaAdapter));

  @override
  _UnifediApiPostChatMessagePleromaAdapter get _value =>
      super._value as _UnifediApiPostChatMessagePleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiPostChatMessagePleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiPostChatMessage,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPostChatMessagePleromaAdapter
    extends _UnifediApiPostChatMessagePleromaAdapter {
  const _$_UnifediApiPostChatMessagePleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiPostChatMessagePleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiPostChatMessagePleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiPostChatMessage value;

  @override
  String toString() {
    return 'UnifediApiPostChatMessagePleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiPostChatMessagePleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPostChatMessagePleromaAdapterCopyWith<
          _UnifediApiPostChatMessagePleromaAdapter>
      get copyWith => __$UnifediApiPostChatMessagePleromaAdapterCopyWithImpl<
          _UnifediApiPostChatMessagePleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPostChatMessagePleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiPostChatMessagePleromaAdapter
    extends UnifediApiPostChatMessagePleromaAdapter {
  const factory _UnifediApiPostChatMessagePleromaAdapter(
          @HiveField(0) PleromaApiPostChatMessage value) =
      _$_UnifediApiPostChatMessagePleromaAdapter;
  const _UnifediApiPostChatMessagePleromaAdapter._() : super._();

  factory _UnifediApiPostChatMessagePleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiPostChatMessagePleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiPostChatMessage get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPostChatMessagePleromaAdapterCopyWith<
          _UnifediApiPostChatMessagePleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
