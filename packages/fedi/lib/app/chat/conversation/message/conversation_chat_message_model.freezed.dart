// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'conversation_chat_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ConversationChatMessageStatusAdapterTearOff {
  const _$ConversationChatMessageStatusAdapterTearOff();

  _ConversationChatMessageStatusAdapter call({required IStatus status}) {
    return _ConversationChatMessageStatusAdapter(
      status: status,
    );
  }
}

/// @nodoc
const $ConversationChatMessageStatusAdapter =
    _$ConversationChatMessageStatusAdapterTearOff();

/// @nodoc
mixin _$ConversationChatMessageStatusAdapter {
  IStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConversationChatMessageStatusAdapterCopyWith<
          ConversationChatMessageStatusAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationChatMessageStatusAdapterCopyWith<$Res> {
  factory $ConversationChatMessageStatusAdapterCopyWith(
          ConversationChatMessageStatusAdapter value,
          $Res Function(ConversationChatMessageStatusAdapter) then) =
      _$ConversationChatMessageStatusAdapterCopyWithImpl<$Res>;
  $Res call({IStatus status});
}

/// @nodoc
class _$ConversationChatMessageStatusAdapterCopyWithImpl<$Res>
    implements $ConversationChatMessageStatusAdapterCopyWith<$Res> {
  _$ConversationChatMessageStatusAdapterCopyWithImpl(this._value, this._then);

  final ConversationChatMessageStatusAdapter _value;
  // ignore: unused_field
  final $Res Function(ConversationChatMessageStatusAdapter) _then;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as IStatus,
    ));
  }
}

/// @nodoc
abstract class _$ConversationChatMessageStatusAdapterCopyWith<$Res>
    implements $ConversationChatMessageStatusAdapterCopyWith<$Res> {
  factory _$ConversationChatMessageStatusAdapterCopyWith(
          _ConversationChatMessageStatusAdapter value,
          $Res Function(_ConversationChatMessageStatusAdapter) then) =
      __$ConversationChatMessageStatusAdapterCopyWithImpl<$Res>;
  @override
  $Res call({IStatus status});
}

/// @nodoc
class __$ConversationChatMessageStatusAdapterCopyWithImpl<$Res>
    extends _$ConversationChatMessageStatusAdapterCopyWithImpl<$Res>
    implements _$ConversationChatMessageStatusAdapterCopyWith<$Res> {
  __$ConversationChatMessageStatusAdapterCopyWithImpl(
      _ConversationChatMessageStatusAdapter _value,
      $Res Function(_ConversationChatMessageStatusAdapter) _then)
      : super(_value, (v) => _then(v as _ConversationChatMessageStatusAdapter));

  @override
  _ConversationChatMessageStatusAdapter get _value =>
      super._value as _ConversationChatMessageStatusAdapter;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_ConversationChatMessageStatusAdapter(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as IStatus,
    ));
  }
}

/// @nodoc

class _$_ConversationChatMessageStatusAdapter
    extends _ConversationChatMessageStatusAdapter {
  const _$_ConversationChatMessageStatusAdapter({required this.status})
      : super._();

  @override
  final IStatus status;

  @override
  String toString() {
    return 'ConversationChatMessageStatusAdapter(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ConversationChatMessageStatusAdapter &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$ConversationChatMessageStatusAdapterCopyWith<
          _ConversationChatMessageStatusAdapter>
      get copyWith => __$ConversationChatMessageStatusAdapterCopyWithImpl<
          _ConversationChatMessageStatusAdapter>(this, _$identity);
}

abstract class _ConversationChatMessageStatusAdapter
    extends ConversationChatMessageStatusAdapter {
  const factory _ConversationChatMessageStatusAdapter(
      {required IStatus status}) = _$_ConversationChatMessageStatusAdapter;
  const _ConversationChatMessageStatusAdapter._() : super._();

  @override
  IStatus get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ConversationChatMessageStatusAdapterCopyWith<
          _ConversationChatMessageStatusAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
