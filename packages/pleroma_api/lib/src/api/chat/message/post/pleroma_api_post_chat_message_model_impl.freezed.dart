// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_post_chat_message_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiPostChatMessage _$PleromaApiPostChatMessageFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiPostChatMessage.fromJson(json);
}

/// @nodoc
class _$PleromaApiPostChatMessageTearOff {
  const _$PleromaApiPostChatMessageTearOff();

  _PleromaApiPostChatMessage call(
      {@HiveField(0) required String? content,
      @HiveField(1) @JsonKey(name: 'media_id') required String? mediaId}) {
    return _PleromaApiPostChatMessage(
      content: content,
      mediaId: mediaId,
    );
  }

  PleromaApiPostChatMessage fromJson(Map<String, Object> json) {
    return PleromaApiPostChatMessage.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiPostChatMessage = _$PleromaApiPostChatMessageTearOff();

/// @nodoc
mixin _$PleromaApiPostChatMessage {
  @HiveField(0)
  String? get content => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'media_id')
  String? get mediaId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiPostChatMessageCopyWith<PleromaApiPostChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiPostChatMessageCopyWith<$Res> {
  factory $PleromaApiPostChatMessageCopyWith(PleromaApiPostChatMessage value,
          $Res Function(PleromaApiPostChatMessage) then) =
      _$PleromaApiPostChatMessageCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String? content,
      @HiveField(1) @JsonKey(name: 'media_id') String? mediaId});
}

/// @nodoc
class _$PleromaApiPostChatMessageCopyWithImpl<$Res>
    implements $PleromaApiPostChatMessageCopyWith<$Res> {
  _$PleromaApiPostChatMessageCopyWithImpl(this._value, this._then);

  final PleromaApiPostChatMessage _value;
  // ignore: unused_field
  final $Res Function(PleromaApiPostChatMessage) _then;

  @override
  $Res call({
    Object? content = freezed,
    Object? mediaId = freezed,
  }) {
    return _then(_value.copyWith(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaId: mediaId == freezed
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiPostChatMessageCopyWith<$Res>
    implements $PleromaApiPostChatMessageCopyWith<$Res> {
  factory _$PleromaApiPostChatMessageCopyWith(_PleromaApiPostChatMessage value,
          $Res Function(_PleromaApiPostChatMessage) then) =
      __$PleromaApiPostChatMessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String? content,
      @HiveField(1) @JsonKey(name: 'media_id') String? mediaId});
}

/// @nodoc
class __$PleromaApiPostChatMessageCopyWithImpl<$Res>
    extends _$PleromaApiPostChatMessageCopyWithImpl<$Res>
    implements _$PleromaApiPostChatMessageCopyWith<$Res> {
  __$PleromaApiPostChatMessageCopyWithImpl(_PleromaApiPostChatMessage _value,
      $Res Function(_PleromaApiPostChatMessage) _then)
      : super(_value, (v) => _then(v as _PleromaApiPostChatMessage));

  @override
  _PleromaApiPostChatMessage get _value =>
      super._value as _PleromaApiPostChatMessage;

  @override
  $Res call({
    Object? content = freezed,
    Object? mediaId = freezed,
  }) {
    return _then(_PleromaApiPostChatMessage(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaId: mediaId == freezed
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiPostChatMessage implements _PleromaApiPostChatMessage {
  const _$_PleromaApiPostChatMessage(
      {@HiveField(0) required this.content,
      @HiveField(1) @JsonKey(name: 'media_id') required this.mediaId});

  factory _$_PleromaApiPostChatMessage.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiPostChatMessageFromJson(json);

  @override
  @HiveField(0)
  final String? content;
  @override
  @HiveField(1)
  @JsonKey(name: 'media_id')
  final String? mediaId;

  @override
  String toString() {
    return 'PleromaApiPostChatMessage(content: $content, mediaId: $mediaId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiPostChatMessage &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.mediaId, mediaId) ||
                const DeepCollectionEquality().equals(other.mediaId, mediaId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(mediaId);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiPostChatMessageCopyWith<_PleromaApiPostChatMessage>
      get copyWith =>
          __$PleromaApiPostChatMessageCopyWithImpl<_PleromaApiPostChatMessage>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiPostChatMessageToJson(this);
  }
}

abstract class _PleromaApiPostChatMessage implements PleromaApiPostChatMessage {
  const factory _PleromaApiPostChatMessage(
          {@HiveField(0) required String? content,
          @HiveField(1) @JsonKey(name: 'media_id') required String? mediaId}) =
      _$_PleromaApiPostChatMessage;

  factory _PleromaApiPostChatMessage.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiPostChatMessage.fromJson;

  @override
  @HiveField(0)
  String? get content => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'media_id')
  String? get mediaId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiPostChatMessageCopyWith<_PleromaApiPostChatMessage>
      get copyWith => throw _privateConstructorUsedError;
}
