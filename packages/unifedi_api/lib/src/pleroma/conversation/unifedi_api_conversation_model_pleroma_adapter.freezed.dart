// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_conversation_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiConversationPleromaAdapter
    _$UnifediApiConversationPleromaAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiConversationPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiConversationPleromaAdapterTearOff {
  const _$UnifediApiConversationPleromaAdapterTearOff();

  _UnifediApiConversationPleromaAdapter call(
      @HiveField(0) PleromaApiConversation value) {
    return _UnifediApiConversationPleromaAdapter(
      value,
    );
  }

  UnifediApiConversationPleromaAdapter fromJson(Map<String, Object> json) {
    return UnifediApiConversationPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiConversationPleromaAdapter =
    _$UnifediApiConversationPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiConversationPleromaAdapter {
  @HiveField(0)
  PleromaApiConversation get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiConversationPleromaAdapterCopyWith<
          UnifediApiConversationPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiConversationPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiConversationPleromaAdapterCopyWith(
          UnifediApiConversationPleromaAdapter value,
          $Res Function(UnifediApiConversationPleromaAdapter) then) =
      _$UnifediApiConversationPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiConversation value});

  $PleromaApiConversationCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiConversationPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiConversationPleromaAdapterCopyWith<$Res> {
  _$UnifediApiConversationPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiConversationPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiConversationPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiConversation,
    ));
  }

  @override
  $PleromaApiConversationCopyWith<$Res> get value {
    return $PleromaApiConversationCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiConversationPleromaAdapterCopyWith<$Res>
    implements $UnifediApiConversationPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiConversationPleromaAdapterCopyWith(
          _UnifediApiConversationPleromaAdapter value,
          $Res Function(_UnifediApiConversationPleromaAdapter) then) =
      __$UnifediApiConversationPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiConversation value});

  @override
  $PleromaApiConversationCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiConversationPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiConversationPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiConversationPleromaAdapterCopyWith<$Res> {
  __$UnifediApiConversationPleromaAdapterCopyWithImpl(
      _UnifediApiConversationPleromaAdapter _value,
      $Res Function(_UnifediApiConversationPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiConversationPleromaAdapter));

  @override
  _UnifediApiConversationPleromaAdapter get _value =>
      super._value as _UnifediApiConversationPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiConversationPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiConversation,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiConversationPleromaAdapter
    extends _UnifediApiConversationPleromaAdapter {
  const _$_UnifediApiConversationPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiConversationPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiConversationPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiConversation value;

  @override
  String toString() {
    return 'UnifediApiConversationPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiConversationPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiConversationPleromaAdapterCopyWith<
          _UnifediApiConversationPleromaAdapter>
      get copyWith => __$UnifediApiConversationPleromaAdapterCopyWithImpl<
          _UnifediApiConversationPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiConversationPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiConversationPleromaAdapter
    extends UnifediApiConversationPleromaAdapter {
  const factory _UnifediApiConversationPleromaAdapter(
          @HiveField(0) PleromaApiConversation value) =
      _$_UnifediApiConversationPleromaAdapter;
  const _UnifediApiConversationPleromaAdapter._() : super._();

  factory _UnifediApiConversationPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiConversationPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiConversation get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiConversationPleromaAdapterCopyWith<
          _UnifediApiConversationPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
