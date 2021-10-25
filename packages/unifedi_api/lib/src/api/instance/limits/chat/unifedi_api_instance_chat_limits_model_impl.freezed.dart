// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_chat_limits_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstanceChatLimits _$UnifediApiInstanceChatLimitsFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiInstanceChatLimits.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstanceChatLimitsTearOff {
  const _$UnifediApiInstanceChatLimitsTearOff();

  _UnifediApiInstanceChatLimits call(
      {@HiveField(0)
      @JsonKey(name: 'message_limit')
          required int? messageLimit}) {
    return _UnifediApiInstanceChatLimits(
      messageLimit: messageLimit,
    );
  }

  UnifediApiInstanceChatLimits fromJson(Map<String, Object> json) {
    return UnifediApiInstanceChatLimits.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstanceChatLimits = _$UnifediApiInstanceChatLimitsTearOff();

/// @nodoc
mixin _$UnifediApiInstanceChatLimits {
  @HiveField(0)
  @JsonKey(name: 'message_limit')
  int? get messageLimit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiInstanceChatLimitsCopyWith<UnifediApiInstanceChatLimits>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstanceChatLimitsCopyWith<$Res> {
  factory $UnifediApiInstanceChatLimitsCopyWith(
          UnifediApiInstanceChatLimits value,
          $Res Function(UnifediApiInstanceChatLimits) then) =
      _$UnifediApiInstanceChatLimitsCopyWithImpl<$Res>;
  $Res call({@HiveField(0) @JsonKey(name: 'message_limit') int? messageLimit});
}

/// @nodoc
class _$UnifediApiInstanceChatLimitsCopyWithImpl<$Res>
    implements $UnifediApiInstanceChatLimitsCopyWith<$Res> {
  _$UnifediApiInstanceChatLimitsCopyWithImpl(this._value, this._then);

  final UnifediApiInstanceChatLimits _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstanceChatLimits) _then;

  @override
  $Res call({
    Object? messageLimit = freezed,
  }) {
    return _then(_value.copyWith(
      messageLimit: messageLimit == freezed
          ? _value.messageLimit
          : messageLimit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiInstanceChatLimitsCopyWith<$Res>
    implements $UnifediApiInstanceChatLimitsCopyWith<$Res> {
  factory _$UnifediApiInstanceChatLimitsCopyWith(
          _UnifediApiInstanceChatLimits value,
          $Res Function(_UnifediApiInstanceChatLimits) then) =
      __$UnifediApiInstanceChatLimitsCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) @JsonKey(name: 'message_limit') int? messageLimit});
}

/// @nodoc
class __$UnifediApiInstanceChatLimitsCopyWithImpl<$Res>
    extends _$UnifediApiInstanceChatLimitsCopyWithImpl<$Res>
    implements _$UnifediApiInstanceChatLimitsCopyWith<$Res> {
  __$UnifediApiInstanceChatLimitsCopyWithImpl(
      _UnifediApiInstanceChatLimits _value,
      $Res Function(_UnifediApiInstanceChatLimits) _then)
      : super(_value, (v) => _then(v as _UnifediApiInstanceChatLimits));

  @override
  _UnifediApiInstanceChatLimits get _value =>
      super._value as _UnifediApiInstanceChatLimits;

  @override
  $Res call({
    Object? messageLimit = freezed,
  }) {
    return _then(_UnifediApiInstanceChatLimits(
      messageLimit: messageLimit == freezed
          ? _value.messageLimit
          : messageLimit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiInstanceChatLimits implements _UnifediApiInstanceChatLimits {
  const _$_UnifediApiInstanceChatLimits(
      {@HiveField(0)
      @JsonKey(name: 'message_limit')
          required this.messageLimit});

  factory _$_UnifediApiInstanceChatLimits.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiInstanceChatLimitsFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'message_limit')
  final int? messageLimit;

  @override
  String toString() {
    return 'UnifediApiInstanceChatLimits(messageLimit: $messageLimit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiInstanceChatLimits &&
            (identical(other.messageLimit, messageLimit) ||
                const DeepCollectionEquality()
                    .equals(other.messageLimit, messageLimit)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(messageLimit);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiInstanceChatLimitsCopyWith<_UnifediApiInstanceChatLimits>
      get copyWith => __$UnifediApiInstanceChatLimitsCopyWithImpl<
          _UnifediApiInstanceChatLimits>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstanceChatLimitsToJson(this);
  }
}

abstract class _UnifediApiInstanceChatLimits
    implements UnifediApiInstanceChatLimits {
  const factory _UnifediApiInstanceChatLimits(
      {@HiveField(0)
      @JsonKey(name: 'message_limit')
          required int? messageLimit}) = _$_UnifediApiInstanceChatLimits;

  factory _UnifediApiInstanceChatLimits.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiInstanceChatLimits.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'message_limit')
  int? get messageLimit => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiInstanceChatLimitsCopyWith<_UnifediApiInstanceChatLimits>
      get copyWith => throw _privateConstructorUsedError;
}
