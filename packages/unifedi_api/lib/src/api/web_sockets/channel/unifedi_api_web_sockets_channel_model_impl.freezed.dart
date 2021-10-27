// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_web_sockets_channel_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiWebSocketsChannel _$UnifediApiWebSocketsChannelFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiWebSocketsChannel.fromJson(json);
}

/// @nodoc
class _$UnifediApiWebSocketsChannelTearOff {
  const _$UnifediApiWebSocketsChannelTearOff();

  _UnifediApiWebSocketsChannel call(
      {@HiveField(0)
          required String type,
      @HiveField(1)
      @JsonKey(name: 'local_only')
          required bool? localOnly,
      @HiveField(2)
      @JsonKey(name: 'remote_only')
          required bool? remoteOnly,
      @HiveField(3)
      @JsonKey(name: 'media_only')
          required bool? mediaOnly,
      @HiveField(4)
      @JsonKey(name: 'only_from_instance')
          required String? onlyFromInstance,
      @HiveField(5)
      @JsonKey(name: 'from_account_id_only')
          required String? fromAccountIdOnly,
      @HiveField(6)
      @JsonKey(name: 'chat_only')
          required bool? chatOnly,
      @HiveField(7)
      @JsonKey(name: 'notification_only')
          required bool? notificationOnly,
      @HiveField(8)
      @JsonKey(name: 'list_id_only')
          required String? listIdOnly,
      @HiveField(9)
          required String? tag}) {
    return _UnifediApiWebSocketsChannel(
      type: type,
      localOnly: localOnly,
      remoteOnly: remoteOnly,
      mediaOnly: mediaOnly,
      onlyFromInstance: onlyFromInstance,
      fromAccountIdOnly: fromAccountIdOnly,
      chatOnly: chatOnly,
      notificationOnly: notificationOnly,
      listIdOnly: listIdOnly,
      tag: tag,
    );
  }

  UnifediApiWebSocketsChannel fromJson(Map<String, Object?> json) {
    return UnifediApiWebSocketsChannel.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiWebSocketsChannel = _$UnifediApiWebSocketsChannelTearOff();

/// @nodoc
mixin _$UnifediApiWebSocketsChannel {
  @HiveField(0)
  String get type => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'local_only')
  bool? get localOnly => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'remote_only')
  bool? get remoteOnly => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'media_only')
  bool? get mediaOnly => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'only_from_instance')
  String? get onlyFromInstance => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'from_account_id_only')
  String? get fromAccountIdOnly => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'chat_only')
  bool? get chatOnly => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(name: 'notification_only')
  bool? get notificationOnly => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'list_id_only')
  String? get listIdOnly => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get tag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiWebSocketsChannelCopyWith<UnifediApiWebSocketsChannel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiWebSocketsChannelCopyWith<$Res> {
  factory $UnifediApiWebSocketsChannelCopyWith(
          UnifediApiWebSocketsChannel value,
          $Res Function(UnifediApiWebSocketsChannel) then) =
      _$UnifediApiWebSocketsChannelCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          String type,
      @HiveField(1)
      @JsonKey(name: 'local_only')
          bool? localOnly,
      @HiveField(2)
      @JsonKey(name: 'remote_only')
          bool? remoteOnly,
      @HiveField(3)
      @JsonKey(name: 'media_only')
          bool? mediaOnly,
      @HiveField(4)
      @JsonKey(name: 'only_from_instance')
          String? onlyFromInstance,
      @HiveField(5)
      @JsonKey(name: 'from_account_id_only')
          String? fromAccountIdOnly,
      @HiveField(6)
      @JsonKey(name: 'chat_only')
          bool? chatOnly,
      @HiveField(7)
      @JsonKey(name: 'notification_only')
          bool? notificationOnly,
      @HiveField(8)
      @JsonKey(name: 'list_id_only')
          String? listIdOnly,
      @HiveField(9)
          String? tag});
}

/// @nodoc
class _$UnifediApiWebSocketsChannelCopyWithImpl<$Res>
    implements $UnifediApiWebSocketsChannelCopyWith<$Res> {
  _$UnifediApiWebSocketsChannelCopyWithImpl(this._value, this._then);

  final UnifediApiWebSocketsChannel _value;
  // ignore: unused_field
  final $Res Function(UnifediApiWebSocketsChannel) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? localOnly = freezed,
    Object? remoteOnly = freezed,
    Object? mediaOnly = freezed,
    Object? onlyFromInstance = freezed,
    Object? fromAccountIdOnly = freezed,
    Object? chatOnly = freezed,
    Object? notificationOnly = freezed,
    Object? listIdOnly = freezed,
    Object? tag = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      localOnly: localOnly == freezed
          ? _value.localOnly
          : localOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      remoteOnly: remoteOnly == freezed
          ? _value.remoteOnly
          : remoteOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      mediaOnly: mediaOnly == freezed
          ? _value.mediaOnly
          : mediaOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      onlyFromInstance: onlyFromInstance == freezed
          ? _value.onlyFromInstance
          : onlyFromInstance // ignore: cast_nullable_to_non_nullable
              as String?,
      fromAccountIdOnly: fromAccountIdOnly == freezed
          ? _value.fromAccountIdOnly
          : fromAccountIdOnly // ignore: cast_nullable_to_non_nullable
              as String?,
      chatOnly: chatOnly == freezed
          ? _value.chatOnly
          : chatOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      notificationOnly: notificationOnly == freezed
          ? _value.notificationOnly
          : notificationOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      listIdOnly: listIdOnly == freezed
          ? _value.listIdOnly
          : listIdOnly // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiWebSocketsChannelCopyWith<$Res>
    implements $UnifediApiWebSocketsChannelCopyWith<$Res> {
  factory _$UnifediApiWebSocketsChannelCopyWith(
          _UnifediApiWebSocketsChannel value,
          $Res Function(_UnifediApiWebSocketsChannel) then) =
      __$UnifediApiWebSocketsChannelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          String type,
      @HiveField(1)
      @JsonKey(name: 'local_only')
          bool? localOnly,
      @HiveField(2)
      @JsonKey(name: 'remote_only')
          bool? remoteOnly,
      @HiveField(3)
      @JsonKey(name: 'media_only')
          bool? mediaOnly,
      @HiveField(4)
      @JsonKey(name: 'only_from_instance')
          String? onlyFromInstance,
      @HiveField(5)
      @JsonKey(name: 'from_account_id_only')
          String? fromAccountIdOnly,
      @HiveField(6)
      @JsonKey(name: 'chat_only')
          bool? chatOnly,
      @HiveField(7)
      @JsonKey(name: 'notification_only')
          bool? notificationOnly,
      @HiveField(8)
      @JsonKey(name: 'list_id_only')
          String? listIdOnly,
      @HiveField(9)
          String? tag});
}

/// @nodoc
class __$UnifediApiWebSocketsChannelCopyWithImpl<$Res>
    extends _$UnifediApiWebSocketsChannelCopyWithImpl<$Res>
    implements _$UnifediApiWebSocketsChannelCopyWith<$Res> {
  __$UnifediApiWebSocketsChannelCopyWithImpl(
      _UnifediApiWebSocketsChannel _value,
      $Res Function(_UnifediApiWebSocketsChannel) _then)
      : super(_value, (v) => _then(v as _UnifediApiWebSocketsChannel));

  @override
  _UnifediApiWebSocketsChannel get _value =>
      super._value as _UnifediApiWebSocketsChannel;

  @override
  $Res call({
    Object? type = freezed,
    Object? localOnly = freezed,
    Object? remoteOnly = freezed,
    Object? mediaOnly = freezed,
    Object? onlyFromInstance = freezed,
    Object? fromAccountIdOnly = freezed,
    Object? chatOnly = freezed,
    Object? notificationOnly = freezed,
    Object? listIdOnly = freezed,
    Object? tag = freezed,
  }) {
    return _then(_UnifediApiWebSocketsChannel(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      localOnly: localOnly == freezed
          ? _value.localOnly
          : localOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      remoteOnly: remoteOnly == freezed
          ? _value.remoteOnly
          : remoteOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      mediaOnly: mediaOnly == freezed
          ? _value.mediaOnly
          : mediaOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      onlyFromInstance: onlyFromInstance == freezed
          ? _value.onlyFromInstance
          : onlyFromInstance // ignore: cast_nullable_to_non_nullable
              as String?,
      fromAccountIdOnly: fromAccountIdOnly == freezed
          ? _value.fromAccountIdOnly
          : fromAccountIdOnly // ignore: cast_nullable_to_non_nullable
              as String?,
      chatOnly: chatOnly == freezed
          ? _value.chatOnly
          : chatOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      notificationOnly: notificationOnly == freezed
          ? _value.notificationOnly
          : notificationOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      listIdOnly: listIdOnly == freezed
          ? _value.listIdOnly
          : listIdOnly // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiWebSocketsChannel implements _UnifediApiWebSocketsChannel {
  const _$_UnifediApiWebSocketsChannel(
      {@HiveField(0)
          required this.type,
      @HiveField(1)
      @JsonKey(name: 'local_only')
          required this.localOnly,
      @HiveField(2)
      @JsonKey(name: 'remote_only')
          required this.remoteOnly,
      @HiveField(3)
      @JsonKey(name: 'media_only')
          required this.mediaOnly,
      @HiveField(4)
      @JsonKey(name: 'only_from_instance')
          required this.onlyFromInstance,
      @HiveField(5)
      @JsonKey(name: 'from_account_id_only')
          required this.fromAccountIdOnly,
      @HiveField(6)
      @JsonKey(name: 'chat_only')
          required this.chatOnly,
      @HiveField(7)
      @JsonKey(name: 'notification_only')
          required this.notificationOnly,
      @HiveField(8)
      @JsonKey(name: 'list_id_only')
          required this.listIdOnly,
      @HiveField(9)
          required this.tag})
      : assert(!(chatOnly == true && notificationOnly == true)),
        assert(!(localOnly == true && remoteOnly == true));

  factory _$_UnifediApiWebSocketsChannel.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiWebSocketsChannelFromJson(json);

  @override
  @HiveField(0)
  final String type;
  @override
  @HiveField(1)
  @JsonKey(name: 'local_only')
  final bool? localOnly;
  @override
  @HiveField(2)
  @JsonKey(name: 'remote_only')
  final bool? remoteOnly;
  @override
  @HiveField(3)
  @JsonKey(name: 'media_only')
  final bool? mediaOnly;
  @override
  @HiveField(4)
  @JsonKey(name: 'only_from_instance')
  final String? onlyFromInstance;
  @override
  @HiveField(5)
  @JsonKey(name: 'from_account_id_only')
  final String? fromAccountIdOnly;
  @override
  @HiveField(6)
  @JsonKey(name: 'chat_only')
  final bool? chatOnly;
  @override
  @HiveField(7)
  @JsonKey(name: 'notification_only')
  final bool? notificationOnly;
  @override
  @HiveField(8)
  @JsonKey(name: 'list_id_only')
  final String? listIdOnly;
  @override
  @HiveField(9)
  final String? tag;

  @override
  String toString() {
    return 'UnifediApiWebSocketsChannel(type: $type, localOnly: $localOnly, remoteOnly: $remoteOnly, mediaOnly: $mediaOnly, onlyFromInstance: $onlyFromInstance, fromAccountIdOnly: $fromAccountIdOnly, chatOnly: $chatOnly, notificationOnly: $notificationOnly, listIdOnly: $listIdOnly, tag: $tag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiWebSocketsChannel &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.localOnly, localOnly) ||
                other.localOnly == localOnly) &&
            (identical(other.remoteOnly, remoteOnly) ||
                other.remoteOnly == remoteOnly) &&
            (identical(other.mediaOnly, mediaOnly) ||
                other.mediaOnly == mediaOnly) &&
            (identical(other.onlyFromInstance, onlyFromInstance) ||
                other.onlyFromInstance == onlyFromInstance) &&
            (identical(other.fromAccountIdOnly, fromAccountIdOnly) ||
                other.fromAccountIdOnly == fromAccountIdOnly) &&
            (identical(other.chatOnly, chatOnly) ||
                other.chatOnly == chatOnly) &&
            (identical(other.notificationOnly, notificationOnly) ||
                other.notificationOnly == notificationOnly) &&
            (identical(other.listIdOnly, listIdOnly) ||
                other.listIdOnly == listIdOnly) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      localOnly,
      remoteOnly,
      mediaOnly,
      onlyFromInstance,
      fromAccountIdOnly,
      chatOnly,
      notificationOnly,
      listIdOnly,
      tag);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiWebSocketsChannelCopyWith<_UnifediApiWebSocketsChannel>
      get copyWith => __$UnifediApiWebSocketsChannelCopyWithImpl<
          _UnifediApiWebSocketsChannel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiWebSocketsChannelToJson(this);
  }
}

abstract class _UnifediApiWebSocketsChannel
    implements UnifediApiWebSocketsChannel {
  const factory _UnifediApiWebSocketsChannel(
      {@HiveField(0)
          required String type,
      @HiveField(1)
      @JsonKey(name: 'local_only')
          required bool? localOnly,
      @HiveField(2)
      @JsonKey(name: 'remote_only')
          required bool? remoteOnly,
      @HiveField(3)
      @JsonKey(name: 'media_only')
          required bool? mediaOnly,
      @HiveField(4)
      @JsonKey(name: 'only_from_instance')
          required String? onlyFromInstance,
      @HiveField(5)
      @JsonKey(name: 'from_account_id_only')
          required String? fromAccountIdOnly,
      @HiveField(6)
      @JsonKey(name: 'chat_only')
          required bool? chatOnly,
      @HiveField(7)
      @JsonKey(name: 'notification_only')
          required bool? notificationOnly,
      @HiveField(8)
      @JsonKey(name: 'list_id_only')
          required String? listIdOnly,
      @HiveField(9)
          required String? tag}) = _$_UnifediApiWebSocketsChannel;

  factory _UnifediApiWebSocketsChannel.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiWebSocketsChannel.fromJson;

  @override
  @HiveField(0)
  String get type;
  @override
  @HiveField(1)
  @JsonKey(name: 'local_only')
  bool? get localOnly;
  @override
  @HiveField(2)
  @JsonKey(name: 'remote_only')
  bool? get remoteOnly;
  @override
  @HiveField(3)
  @JsonKey(name: 'media_only')
  bool? get mediaOnly;
  @override
  @HiveField(4)
  @JsonKey(name: 'only_from_instance')
  String? get onlyFromInstance;
  @override
  @HiveField(5)
  @JsonKey(name: 'from_account_id_only')
  String? get fromAccountIdOnly;
  @override
  @HiveField(6)
  @JsonKey(name: 'chat_only')
  bool? get chatOnly;
  @override
  @HiveField(7)
  @JsonKey(name: 'notification_only')
  bool? get notificationOnly;
  @override
  @HiveField(8)
  @JsonKey(name: 'list_id_only')
  String? get listIdOnly;
  @override
  @HiveField(9)
  String? get tag;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiWebSocketsChannelCopyWith<_UnifediApiWebSocketsChannel>
      get copyWith => throw _privateConstructorUsedError;
}
