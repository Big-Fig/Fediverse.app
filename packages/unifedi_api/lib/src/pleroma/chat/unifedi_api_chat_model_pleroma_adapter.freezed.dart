// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_chat_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiChatPleromaAdapter _$UnifediApiChatPleromaAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiChatPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiChatPleromaAdapterTearOff {
  const _$UnifediApiChatPleromaAdapterTearOff();

  _UnifediApiChatPleromaAdapter call(@HiveField(0) PleromaApiChat value) {
    return _UnifediApiChatPleromaAdapter(
      value,
    );
  }

  UnifediApiChatPleromaAdapter fromJson(Map<String, Object> json) {
    return UnifediApiChatPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiChatPleromaAdapter = _$UnifediApiChatPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiChatPleromaAdapter {
  @HiveField(0)
  PleromaApiChat get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiChatPleromaAdapterCopyWith<UnifediApiChatPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiChatPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiChatPleromaAdapterCopyWith(
          UnifediApiChatPleromaAdapter value,
          $Res Function(UnifediApiChatPleromaAdapter) then) =
      _$UnifediApiChatPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiChat value});

  $PleromaApiChatCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiChatPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiChatPleromaAdapterCopyWith<$Res> {
  _$UnifediApiChatPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiChatPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiChatPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiChat,
    ));
  }

  @override
  $PleromaApiChatCopyWith<$Res> get value {
    return $PleromaApiChatCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiChatPleromaAdapterCopyWith<$Res>
    implements $UnifediApiChatPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiChatPleromaAdapterCopyWith(
          _UnifediApiChatPleromaAdapter value,
          $Res Function(_UnifediApiChatPleromaAdapter) then) =
      __$UnifediApiChatPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiChat value});

  @override
  $PleromaApiChatCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiChatPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiChatPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiChatPleromaAdapterCopyWith<$Res> {
  __$UnifediApiChatPleromaAdapterCopyWithImpl(
      _UnifediApiChatPleromaAdapter _value,
      $Res Function(_UnifediApiChatPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiChatPleromaAdapter));

  @override
  _UnifediApiChatPleromaAdapter get _value =>
      super._value as _UnifediApiChatPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiChatPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiChat,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiChatPleromaAdapter extends _UnifediApiChatPleromaAdapter {
  const _$_UnifediApiChatPleromaAdapter(@HiveField(0) this.value) : super._();

  factory _$_UnifediApiChatPleromaAdapter.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiChatPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiChat value;

  @override
  String toString() {
    return 'UnifediApiChatPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiChatPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiChatPleromaAdapterCopyWith<_UnifediApiChatPleromaAdapter>
      get copyWith => __$UnifediApiChatPleromaAdapterCopyWithImpl<
          _UnifediApiChatPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiChatPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiChatPleromaAdapter
    extends UnifediApiChatPleromaAdapter {
  const factory _UnifediApiChatPleromaAdapter(
      @HiveField(0) PleromaApiChat value) = _$_UnifediApiChatPleromaAdapter;
  const _UnifediApiChatPleromaAdapter._() : super._();

  factory _UnifediApiChatPleromaAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiChatPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiChat get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiChatPleromaAdapterCopyWith<_UnifediApiChatPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
