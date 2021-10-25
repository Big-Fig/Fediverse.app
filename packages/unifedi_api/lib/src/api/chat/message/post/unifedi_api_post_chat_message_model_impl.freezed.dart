// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_post_chat_message_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPostChatMessage _$UnifediApiPostChatMessageFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiPostChatMessage.fromJson(json);
}

/// @nodoc
class _$UnifediApiPostChatMessageTearOff {
  const _$UnifediApiPostChatMessageTearOff();

  _UnifediApiPostChatMessage call(
      {@HiveField(0) required String? content,
      @HiveField(1) @JsonKey(name: 'media_id') required String? mediaId}) {
    return _UnifediApiPostChatMessage(
      content: content,
      mediaId: mediaId,
    );
  }

  UnifediApiPostChatMessage fromJson(Map<String, Object> json) {
    return UnifediApiPostChatMessage.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPostChatMessage = _$UnifediApiPostChatMessageTearOff();

/// @nodoc
mixin _$UnifediApiPostChatMessage {
  @HiveField(0)
  String? get content => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'media_id')
  String? get mediaId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPostChatMessageCopyWith<UnifediApiPostChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPostChatMessageCopyWith<$Res> {
  factory $UnifediApiPostChatMessageCopyWith(UnifediApiPostChatMessage value,
          $Res Function(UnifediApiPostChatMessage) then) =
      _$UnifediApiPostChatMessageCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String? content,
      @HiveField(1) @JsonKey(name: 'media_id') String? mediaId});
}

/// @nodoc
class _$UnifediApiPostChatMessageCopyWithImpl<$Res>
    implements $UnifediApiPostChatMessageCopyWith<$Res> {
  _$UnifediApiPostChatMessageCopyWithImpl(this._value, this._then);

  final UnifediApiPostChatMessage _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPostChatMessage) _then;

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
abstract class _$UnifediApiPostChatMessageCopyWith<$Res>
    implements $UnifediApiPostChatMessageCopyWith<$Res> {
  factory _$UnifediApiPostChatMessageCopyWith(_UnifediApiPostChatMessage value,
          $Res Function(_UnifediApiPostChatMessage) then) =
      __$UnifediApiPostChatMessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String? content,
      @HiveField(1) @JsonKey(name: 'media_id') String? mediaId});
}

/// @nodoc
class __$UnifediApiPostChatMessageCopyWithImpl<$Res>
    extends _$UnifediApiPostChatMessageCopyWithImpl<$Res>
    implements _$UnifediApiPostChatMessageCopyWith<$Res> {
  __$UnifediApiPostChatMessageCopyWithImpl(_UnifediApiPostChatMessage _value,
      $Res Function(_UnifediApiPostChatMessage) _then)
      : super(_value, (v) => _then(v as _UnifediApiPostChatMessage));

  @override
  _UnifediApiPostChatMessage get _value =>
      super._value as _UnifediApiPostChatMessage;

  @override
  $Res call({
    Object? content = freezed,
    Object? mediaId = freezed,
  }) {
    return _then(_UnifediApiPostChatMessage(
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
class _$_UnifediApiPostChatMessage implements _UnifediApiPostChatMessage {
  const _$_UnifediApiPostChatMessage(
      {@HiveField(0) required this.content,
      @HiveField(1) @JsonKey(name: 'media_id') required this.mediaId});

  factory _$_UnifediApiPostChatMessage.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiPostChatMessageFromJson(json);

  @override
  @HiveField(0)
  final String? content;
  @override
  @HiveField(1)
  @JsonKey(name: 'media_id')
  final String? mediaId;

  @override
  String toString() {
    return 'UnifediApiPostChatMessage(content: $content, mediaId: $mediaId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiPostChatMessage &&
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
  _$UnifediApiPostChatMessageCopyWith<_UnifediApiPostChatMessage>
      get copyWith =>
          __$UnifediApiPostChatMessageCopyWithImpl<_UnifediApiPostChatMessage>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPostChatMessageToJson(this);
  }
}

abstract class _UnifediApiPostChatMessage implements UnifediApiPostChatMessage {
  const factory _UnifediApiPostChatMessage(
          {@HiveField(0) required String? content,
          @HiveField(1) @JsonKey(name: 'media_id') required String? mediaId}) =
      _$_UnifediApiPostChatMessage;

  factory _UnifediApiPostChatMessage.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiPostChatMessage.fromJson;

  @override
  @HiveField(0)
  String? get content => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'media_id')
  String? get mediaId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPostChatMessageCopyWith<_UnifediApiPostChatMessage>
      get copyWith => throw _privateConstructorUsedError;
}
