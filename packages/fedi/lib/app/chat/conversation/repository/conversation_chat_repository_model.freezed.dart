// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'conversation_chat_repository_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ConversationChatRepositoryFiltersTearOff {
  const _$ConversationChatRepositoryFiltersTearOff();

  _ConversationChatRepositoryFilters call({bool withLastMessage = false}) {
    return _ConversationChatRepositoryFilters(
      withLastMessage: withLastMessage,
    );
  }
}

/// @nodoc
const $ConversationChatRepositoryFilters =
    _$ConversationChatRepositoryFiltersTearOff();

/// @nodoc
mixin _$ConversationChatRepositoryFilters {
  bool get withLastMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConversationChatRepositoryFiltersCopyWith<ConversationChatRepositoryFilters>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationChatRepositoryFiltersCopyWith<$Res> {
  factory $ConversationChatRepositoryFiltersCopyWith(
          ConversationChatRepositoryFilters value,
          $Res Function(ConversationChatRepositoryFilters) then) =
      _$ConversationChatRepositoryFiltersCopyWithImpl<$Res>;
  $Res call({bool withLastMessage});
}

/// @nodoc
class _$ConversationChatRepositoryFiltersCopyWithImpl<$Res>
    implements $ConversationChatRepositoryFiltersCopyWith<$Res> {
  _$ConversationChatRepositoryFiltersCopyWithImpl(this._value, this._then);

  final ConversationChatRepositoryFilters _value;
  // ignore: unused_field
  final $Res Function(ConversationChatRepositoryFilters) _then;

  @override
  $Res call({
    Object? withLastMessage = freezed,
  }) {
    return _then(_value.copyWith(
      withLastMessage: withLastMessage == freezed
          ? _value.withLastMessage
          : withLastMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ConversationChatRepositoryFiltersCopyWith<$Res>
    implements $ConversationChatRepositoryFiltersCopyWith<$Res> {
  factory _$ConversationChatRepositoryFiltersCopyWith(
          _ConversationChatRepositoryFilters value,
          $Res Function(_ConversationChatRepositoryFilters) then) =
      __$ConversationChatRepositoryFiltersCopyWithImpl<$Res>;
  @override
  $Res call({bool withLastMessage});
}

/// @nodoc
class __$ConversationChatRepositoryFiltersCopyWithImpl<$Res>
    extends _$ConversationChatRepositoryFiltersCopyWithImpl<$Res>
    implements _$ConversationChatRepositoryFiltersCopyWith<$Res> {
  __$ConversationChatRepositoryFiltersCopyWithImpl(
      _ConversationChatRepositoryFilters _value,
      $Res Function(_ConversationChatRepositoryFilters) _then)
      : super(_value, (v) => _then(v as _ConversationChatRepositoryFilters));

  @override
  _ConversationChatRepositoryFilters get _value =>
      super._value as _ConversationChatRepositoryFilters;

  @override
  $Res call({
    Object? withLastMessage = freezed,
  }) {
    return _then(_ConversationChatRepositoryFilters(
      withLastMessage: withLastMessage == freezed
          ? _value.withLastMessage
          : withLastMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ConversationChatRepositoryFilters
    extends _ConversationChatRepositoryFilters {
  const _$_ConversationChatRepositoryFilters({this.withLastMessage = false})
      : super._();

  @JsonKey(defaultValue: false)
  @override
  final bool withLastMessage;

  @override
  String toString() {
    return 'ConversationChatRepositoryFilters(withLastMessage: $withLastMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ConversationChatRepositoryFilters &&
            (identical(other.withLastMessage, withLastMessage) ||
                const DeepCollectionEquality()
                    .equals(other.withLastMessage, withLastMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(withLastMessage);

  @JsonKey(ignore: true)
  @override
  _$ConversationChatRepositoryFiltersCopyWith<
          _ConversationChatRepositoryFilters>
      get copyWith => __$ConversationChatRepositoryFiltersCopyWithImpl<
          _ConversationChatRepositoryFilters>(this, _$identity);
}

abstract class _ConversationChatRepositoryFilters
    extends ConversationChatRepositoryFilters {
  const factory _ConversationChatRepositoryFilters({bool withLastMessage}) =
      _$_ConversationChatRepositoryFilters;
  const _ConversationChatRepositoryFilters._() : super._();

  @override
  bool get withLastMessage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ConversationChatRepositoryFiltersCopyWith<
          _ConversationChatRepositoryFilters>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$ConversationRepositoryChatOrderingTermDataTearOff {
  const _$ConversationRepositoryChatOrderingTermDataTearOff();

  _ConversationRepositoryChatOrderingTermData call(
      {required ConversationChatOrderType orderType,
      required moor.OrderingMode orderingMode}) {
    return _ConversationRepositoryChatOrderingTermData(
      orderType: orderType,
      orderingMode: orderingMode,
    );
  }
}

/// @nodoc
const $ConversationRepositoryChatOrderingTermData =
    _$ConversationRepositoryChatOrderingTermDataTearOff();

/// @nodoc
mixin _$ConversationRepositoryChatOrderingTermData {
  ConversationChatOrderType get orderType => throw _privateConstructorUsedError;
  moor.OrderingMode get orderingMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConversationRepositoryChatOrderingTermDataCopyWith<
          ConversationRepositoryChatOrderingTermData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationRepositoryChatOrderingTermDataCopyWith<$Res> {
  factory $ConversationRepositoryChatOrderingTermDataCopyWith(
          ConversationRepositoryChatOrderingTermData value,
          $Res Function(ConversationRepositoryChatOrderingTermData) then) =
      _$ConversationRepositoryChatOrderingTermDataCopyWithImpl<$Res>;
  $Res call(
      {ConversationChatOrderType orderType, moor.OrderingMode orderingMode});
}

/// @nodoc
class _$ConversationRepositoryChatOrderingTermDataCopyWithImpl<$Res>
    implements $ConversationRepositoryChatOrderingTermDataCopyWith<$Res> {
  _$ConversationRepositoryChatOrderingTermDataCopyWithImpl(
      this._value, this._then);

  final ConversationRepositoryChatOrderingTermData _value;
  // ignore: unused_field
  final $Res Function(ConversationRepositoryChatOrderingTermData) _then;

  @override
  $Res call({
    Object? orderType = freezed,
    Object? orderingMode = freezed,
  }) {
    return _then(_value.copyWith(
      orderType: orderType == freezed
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as ConversationChatOrderType,
      orderingMode: orderingMode == freezed
          ? _value.orderingMode
          : orderingMode // ignore: cast_nullable_to_non_nullable
              as moor.OrderingMode,
    ));
  }
}

/// @nodoc
abstract class _$ConversationRepositoryChatOrderingTermDataCopyWith<$Res>
    implements $ConversationRepositoryChatOrderingTermDataCopyWith<$Res> {
  factory _$ConversationRepositoryChatOrderingTermDataCopyWith(
          _ConversationRepositoryChatOrderingTermData value,
          $Res Function(_ConversationRepositoryChatOrderingTermData) then) =
      __$ConversationRepositoryChatOrderingTermDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {ConversationChatOrderType orderType, moor.OrderingMode orderingMode});
}

/// @nodoc
class __$ConversationRepositoryChatOrderingTermDataCopyWithImpl<$Res>
    extends _$ConversationRepositoryChatOrderingTermDataCopyWithImpl<$Res>
    implements _$ConversationRepositoryChatOrderingTermDataCopyWith<$Res> {
  __$ConversationRepositoryChatOrderingTermDataCopyWithImpl(
      _ConversationRepositoryChatOrderingTermData _value,
      $Res Function(_ConversationRepositoryChatOrderingTermData) _then)
      : super(_value,
            (v) => _then(v as _ConversationRepositoryChatOrderingTermData));

  @override
  _ConversationRepositoryChatOrderingTermData get _value =>
      super._value as _ConversationRepositoryChatOrderingTermData;

  @override
  $Res call({
    Object? orderType = freezed,
    Object? orderingMode = freezed,
  }) {
    return _then(_ConversationRepositoryChatOrderingTermData(
      orderType: orderType == freezed
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as ConversationChatOrderType,
      orderingMode: orderingMode == freezed
          ? _value.orderingMode
          : orderingMode // ignore: cast_nullable_to_non_nullable
              as moor.OrderingMode,
    ));
  }
}

/// @nodoc

class _$_ConversationRepositoryChatOrderingTermData
    implements _ConversationRepositoryChatOrderingTermData {
  const _$_ConversationRepositoryChatOrderingTermData(
      {required this.orderType, required this.orderingMode});

  @override
  final ConversationChatOrderType orderType;
  @override
  final moor.OrderingMode orderingMode;

  @override
  String toString() {
    return 'ConversationRepositoryChatOrderingTermData(orderType: $orderType, orderingMode: $orderingMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ConversationRepositoryChatOrderingTermData &&
            (identical(other.orderType, orderType) ||
                const DeepCollectionEquality()
                    .equals(other.orderType, orderType)) &&
            (identical(other.orderingMode, orderingMode) ||
                const DeepCollectionEquality()
                    .equals(other.orderingMode, orderingMode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(orderType) ^
      const DeepCollectionEquality().hash(orderingMode);

  @JsonKey(ignore: true)
  @override
  _$ConversationRepositoryChatOrderingTermDataCopyWith<
          _ConversationRepositoryChatOrderingTermData>
      get copyWith => __$ConversationRepositoryChatOrderingTermDataCopyWithImpl<
          _ConversationRepositoryChatOrderingTermData>(this, _$identity);
}

abstract class _ConversationRepositoryChatOrderingTermData
    implements ConversationRepositoryChatOrderingTermData {
  const factory _ConversationRepositoryChatOrderingTermData(
          {required ConversationChatOrderType orderType,
          required moor.OrderingMode orderingMode}) =
      _$_ConversationRepositoryChatOrderingTermData;

  @override
  ConversationChatOrderType get orderType => throw _privateConstructorUsedError;
  @override
  moor.OrderingMode get orderingMode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ConversationRepositoryChatOrderingTermDataCopyWith<
          _ConversationRepositoryChatOrderingTermData>
      get copyWith => throw _privateConstructorUsedError;
}
