// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_web_sockets_channel_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiWebSocketsChannel _$MastodonApiWebSocketsChannelFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiWebSocketsChannel.fromJson(json);
}

/// @nodoc
class _$MastodonApiWebSocketsChannelTearOff {
  const _$MastodonApiWebSocketsChannelTearOff();

  _MastodonApiWebSocketsChannel call(
      {@HiveField(0)
          required String type,
      @HiveField(1)
      @JsonKey(name: 'local_only')
          required bool? localOnly,
      @HiveField(2)
      @JsonKey(name: 'media_only')
          required bool? mediaOnly,
      @HiveField(3)
      @JsonKey(name: 'from_account_id_only')
          required String? fromAccountIdOnly,
      @HiveField(4)
      @JsonKey(name: 'notification_only')
          required bool? notificationOnly,
      @HiveField(5)
      @JsonKey(name: 'list_id_only')
          required String? listIdOnly,
      @HiveField(6)
          required String? tag}) {
    return _MastodonApiWebSocketsChannel(
      type: type,
      localOnly: localOnly,
      mediaOnly: mediaOnly,
      fromAccountIdOnly: fromAccountIdOnly,
      notificationOnly: notificationOnly,
      listIdOnly: listIdOnly,
      tag: tag,
    );
  }

  MastodonApiWebSocketsChannel fromJson(Map<String, Object> json) {
    return MastodonApiWebSocketsChannel.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiWebSocketsChannel = _$MastodonApiWebSocketsChannelTearOff();

/// @nodoc
mixin _$MastodonApiWebSocketsChannel {
  @HiveField(0)
  String get type => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'local_only')
  bool? get localOnly => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'media_only')
  bool? get mediaOnly => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'from_account_id_only')
  String? get fromAccountIdOnly => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'notification_only')
  bool? get notificationOnly => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'list_id_only')
  String? get listIdOnly => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get tag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiWebSocketsChannelCopyWith<MastodonApiWebSocketsChannel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiWebSocketsChannelCopyWith<$Res> {
  factory $MastodonApiWebSocketsChannelCopyWith(
          MastodonApiWebSocketsChannel value,
          $Res Function(MastodonApiWebSocketsChannel) then) =
      _$MastodonApiWebSocketsChannelCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          String type,
      @HiveField(1)
      @JsonKey(name: 'local_only')
          bool? localOnly,
      @HiveField(2)
      @JsonKey(name: 'media_only')
          bool? mediaOnly,
      @HiveField(3)
      @JsonKey(name: 'from_account_id_only')
          String? fromAccountIdOnly,
      @HiveField(4)
      @JsonKey(name: 'notification_only')
          bool? notificationOnly,
      @HiveField(5)
      @JsonKey(name: 'list_id_only')
          String? listIdOnly,
      @HiveField(6)
          String? tag});
}

/// @nodoc
class _$MastodonApiWebSocketsChannelCopyWithImpl<$Res>
    implements $MastodonApiWebSocketsChannelCopyWith<$Res> {
  _$MastodonApiWebSocketsChannelCopyWithImpl(this._value, this._then);

  final MastodonApiWebSocketsChannel _value;
  // ignore: unused_field
  final $Res Function(MastodonApiWebSocketsChannel) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? localOnly = freezed,
    Object? mediaOnly = freezed,
    Object? fromAccountIdOnly = freezed,
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
      mediaOnly: mediaOnly == freezed
          ? _value.mediaOnly
          : mediaOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      fromAccountIdOnly: fromAccountIdOnly == freezed
          ? _value.fromAccountIdOnly
          : fromAccountIdOnly // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$MastodonApiWebSocketsChannelCopyWith<$Res>
    implements $MastodonApiWebSocketsChannelCopyWith<$Res> {
  factory _$MastodonApiWebSocketsChannelCopyWith(
          _MastodonApiWebSocketsChannel value,
          $Res Function(_MastodonApiWebSocketsChannel) then) =
      __$MastodonApiWebSocketsChannelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          String type,
      @HiveField(1)
      @JsonKey(name: 'local_only')
          bool? localOnly,
      @HiveField(2)
      @JsonKey(name: 'media_only')
          bool? mediaOnly,
      @HiveField(3)
      @JsonKey(name: 'from_account_id_only')
          String? fromAccountIdOnly,
      @HiveField(4)
      @JsonKey(name: 'notification_only')
          bool? notificationOnly,
      @HiveField(5)
      @JsonKey(name: 'list_id_only')
          String? listIdOnly,
      @HiveField(6)
          String? tag});
}

/// @nodoc
class __$MastodonApiWebSocketsChannelCopyWithImpl<$Res>
    extends _$MastodonApiWebSocketsChannelCopyWithImpl<$Res>
    implements _$MastodonApiWebSocketsChannelCopyWith<$Res> {
  __$MastodonApiWebSocketsChannelCopyWithImpl(
      _MastodonApiWebSocketsChannel _value,
      $Res Function(_MastodonApiWebSocketsChannel) _then)
      : super(_value, (v) => _then(v as _MastodonApiWebSocketsChannel));

  @override
  _MastodonApiWebSocketsChannel get _value =>
      super._value as _MastodonApiWebSocketsChannel;

  @override
  $Res call({
    Object? type = freezed,
    Object? localOnly = freezed,
    Object? mediaOnly = freezed,
    Object? fromAccountIdOnly = freezed,
    Object? notificationOnly = freezed,
    Object? listIdOnly = freezed,
    Object? tag = freezed,
  }) {
    return _then(_MastodonApiWebSocketsChannel(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      localOnly: localOnly == freezed
          ? _value.localOnly
          : localOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      mediaOnly: mediaOnly == freezed
          ? _value.mediaOnly
          : mediaOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      fromAccountIdOnly: fromAccountIdOnly == freezed
          ? _value.fromAccountIdOnly
          : fromAccountIdOnly // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$_MastodonApiWebSocketsChannel implements _MastodonApiWebSocketsChannel {
  const _$_MastodonApiWebSocketsChannel(
      {@HiveField(0)
          required this.type,
      @HiveField(1)
      @JsonKey(name: 'local_only')
          required this.localOnly,
      @HiveField(2)
      @JsonKey(name: 'media_only')
          required this.mediaOnly,
      @HiveField(3)
      @JsonKey(name: 'from_account_id_only')
          required this.fromAccountIdOnly,
      @HiveField(4)
      @JsonKey(name: 'notification_only')
          required this.notificationOnly,
      @HiveField(5)
      @JsonKey(name: 'list_id_only')
          required this.listIdOnly,
      @HiveField(6)
          required this.tag});

  factory _$_MastodonApiWebSocketsChannel.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiWebSocketsChannelFromJson(json);

  @override
  @HiveField(0)
  final String type;
  @override
  @HiveField(1)
  @JsonKey(name: 'local_only')
  final bool? localOnly;
  @override
  @HiveField(2)
  @JsonKey(name: 'media_only')
  final bool? mediaOnly;
  @override
  @HiveField(3)
  @JsonKey(name: 'from_account_id_only')
  final String? fromAccountIdOnly;
  @override
  @HiveField(4)
  @JsonKey(name: 'notification_only')
  final bool? notificationOnly;
  @override
  @HiveField(5)
  @JsonKey(name: 'list_id_only')
  final String? listIdOnly;
  @override
  @HiveField(6)
  final String? tag;

  @override
  String toString() {
    return 'MastodonApiWebSocketsChannel(type: $type, localOnly: $localOnly, mediaOnly: $mediaOnly, fromAccountIdOnly: $fromAccountIdOnly, notificationOnly: $notificationOnly, listIdOnly: $listIdOnly, tag: $tag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiWebSocketsChannel &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.localOnly, localOnly) ||
                const DeepCollectionEquality()
                    .equals(other.localOnly, localOnly)) &&
            (identical(other.mediaOnly, mediaOnly) ||
                const DeepCollectionEquality()
                    .equals(other.mediaOnly, mediaOnly)) &&
            (identical(other.fromAccountIdOnly, fromAccountIdOnly) ||
                const DeepCollectionEquality()
                    .equals(other.fromAccountIdOnly, fromAccountIdOnly)) &&
            (identical(other.notificationOnly, notificationOnly) ||
                const DeepCollectionEquality()
                    .equals(other.notificationOnly, notificationOnly)) &&
            (identical(other.listIdOnly, listIdOnly) ||
                const DeepCollectionEquality()
                    .equals(other.listIdOnly, listIdOnly)) &&
            (identical(other.tag, tag) ||
                const DeepCollectionEquality().equals(other.tag, tag)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(localOnly) ^
      const DeepCollectionEquality().hash(mediaOnly) ^
      const DeepCollectionEquality().hash(fromAccountIdOnly) ^
      const DeepCollectionEquality().hash(notificationOnly) ^
      const DeepCollectionEquality().hash(listIdOnly) ^
      const DeepCollectionEquality().hash(tag);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiWebSocketsChannelCopyWith<_MastodonApiWebSocketsChannel>
      get copyWith => __$MastodonApiWebSocketsChannelCopyWithImpl<
          _MastodonApiWebSocketsChannel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiWebSocketsChannelToJson(this);
  }
}

abstract class _MastodonApiWebSocketsChannel
    implements MastodonApiWebSocketsChannel {
  const factory _MastodonApiWebSocketsChannel(
      {@HiveField(0)
          required String type,
      @HiveField(1)
      @JsonKey(name: 'local_only')
          required bool? localOnly,
      @HiveField(2)
      @JsonKey(name: 'media_only')
          required bool? mediaOnly,
      @HiveField(3)
      @JsonKey(name: 'from_account_id_only')
          required String? fromAccountIdOnly,
      @HiveField(4)
      @JsonKey(name: 'notification_only')
          required bool? notificationOnly,
      @HiveField(5)
      @JsonKey(name: 'list_id_only')
          required String? listIdOnly,
      @HiveField(6)
          required String? tag}) = _$_MastodonApiWebSocketsChannel;

  factory _MastodonApiWebSocketsChannel.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiWebSocketsChannel.fromJson;

  @override
  @HiveField(0)
  String get type => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'local_only')
  bool? get localOnly => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'media_only')
  bool? get mediaOnly => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  @JsonKey(name: 'from_account_id_only')
  String? get fromAccountIdOnly => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  @JsonKey(name: 'notification_only')
  bool? get notificationOnly => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  @JsonKey(name: 'list_id_only')
  String? get listIdOnly => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  String? get tag => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiWebSocketsChannelCopyWith<_MastodonApiWebSocketsChannel>
      get copyWith => throw _privateConstructorUsedError;
}
