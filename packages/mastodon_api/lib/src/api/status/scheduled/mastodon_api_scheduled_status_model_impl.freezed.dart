// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_scheduled_status_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiScheduledStatus _$MastodonApiScheduledStatusFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiScheduledStatus.fromJson(json);
}

/// @nodoc
class _$MastodonApiScheduledStatusTearOff {
  const _$MastodonApiScheduledStatusTearOff();

  _MastodonApiScheduledStatus call(
      {@HiveField(0)
      @override
          required String id,
      @HiveField(1)
      @JsonKey(name: 'media_attachments')
          required List<MastodonApiMediaAttachment>? mediaAttachments,
      @HiveField(2)
          required MastodonApiScheduledStatusParams params,
      @HiveField(3)
      @JsonKey(name: 'scheduled_at')
          required DateTime scheduledAt}) {
    return _MastodonApiScheduledStatus(
      id: id,
      mediaAttachments: mediaAttachments,
      params: params,
      scheduledAt: scheduledAt,
    );
  }

  MastodonApiScheduledStatus fromJson(Map<String, Object?> json) {
    return MastodonApiScheduledStatus.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiScheduledStatus = _$MastodonApiScheduledStatusTearOff();

/// @nodoc
mixin _$MastodonApiScheduledStatus {
  @HiveField(0)
  @override
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'media_attachments')
  List<MastodonApiMediaAttachment>? get mediaAttachments =>
      throw _privateConstructorUsedError;
  @HiveField(2)
  MastodonApiScheduledStatusParams get params =>
      throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'scheduled_at')
  DateTime get scheduledAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiScheduledStatusCopyWith<MastodonApiScheduledStatus>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiScheduledStatusCopyWith<$Res> {
  factory $MastodonApiScheduledStatusCopyWith(MastodonApiScheduledStatus value,
          $Res Function(MastodonApiScheduledStatus) then) =
      _$MastodonApiScheduledStatusCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @override
          String id,
      @HiveField(1)
      @JsonKey(name: 'media_attachments')
          List<MastodonApiMediaAttachment>? mediaAttachments,
      @HiveField(2)
          MastodonApiScheduledStatusParams params,
      @HiveField(3)
      @JsonKey(name: 'scheduled_at')
          DateTime scheduledAt});

  $MastodonApiScheduledStatusParamsCopyWith<$Res> get params;
}

/// @nodoc
class _$MastodonApiScheduledStatusCopyWithImpl<$Res>
    implements $MastodonApiScheduledStatusCopyWith<$Res> {
  _$MastodonApiScheduledStatusCopyWithImpl(this._value, this._then);

  final MastodonApiScheduledStatus _value;
  // ignore: unused_field
  final $Res Function(MastodonApiScheduledStatus) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? mediaAttachments = freezed,
    Object? params = freezed,
    Object? scheduledAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mediaAttachments: mediaAttachments == freezed
          ? _value.mediaAttachments
          : mediaAttachments // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiMediaAttachment>?,
      params: params == freezed
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as MastodonApiScheduledStatusParams,
      scheduledAt: scheduledAt == freezed
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $MastodonApiScheduledStatusParamsCopyWith<$Res> get params {
    return $MastodonApiScheduledStatusParamsCopyWith<$Res>(_value.params,
        (value) {
      return _then(_value.copyWith(params: value));
    });
  }
}

/// @nodoc
abstract class _$MastodonApiScheduledStatusCopyWith<$Res>
    implements $MastodonApiScheduledStatusCopyWith<$Res> {
  factory _$MastodonApiScheduledStatusCopyWith(
          _MastodonApiScheduledStatus value,
          $Res Function(_MastodonApiScheduledStatus) then) =
      __$MastodonApiScheduledStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @override
          String id,
      @HiveField(1)
      @JsonKey(name: 'media_attachments')
          List<MastodonApiMediaAttachment>? mediaAttachments,
      @HiveField(2)
          MastodonApiScheduledStatusParams params,
      @HiveField(3)
      @JsonKey(name: 'scheduled_at')
          DateTime scheduledAt});

  @override
  $MastodonApiScheduledStatusParamsCopyWith<$Res> get params;
}

/// @nodoc
class __$MastodonApiScheduledStatusCopyWithImpl<$Res>
    extends _$MastodonApiScheduledStatusCopyWithImpl<$Res>
    implements _$MastodonApiScheduledStatusCopyWith<$Res> {
  __$MastodonApiScheduledStatusCopyWithImpl(_MastodonApiScheduledStatus _value,
      $Res Function(_MastodonApiScheduledStatus) _then)
      : super(_value, (v) => _then(v as _MastodonApiScheduledStatus));

  @override
  _MastodonApiScheduledStatus get _value =>
      super._value as _MastodonApiScheduledStatus;

  @override
  $Res call({
    Object? id = freezed,
    Object? mediaAttachments = freezed,
    Object? params = freezed,
    Object? scheduledAt = freezed,
  }) {
    return _then(_MastodonApiScheduledStatus(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mediaAttachments: mediaAttachments == freezed
          ? _value.mediaAttachments
          : mediaAttachments // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiMediaAttachment>?,
      params: params == freezed
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as MastodonApiScheduledStatusParams,
      scheduledAt: scheduledAt == freezed
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiScheduledStatus implements _MastodonApiScheduledStatus {
  const _$_MastodonApiScheduledStatus(
      {@HiveField(0)
      @override
          required this.id,
      @HiveField(1)
      @JsonKey(name: 'media_attachments')
          required this.mediaAttachments,
      @HiveField(2)
          required this.params,
      @HiveField(3)
      @JsonKey(name: 'scheduled_at')
          required this.scheduledAt});

  factory _$_MastodonApiScheduledStatus.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiScheduledStatusFromJson(json);

  @override
  @HiveField(0)
  @override
  final String id;
  @override
  @HiveField(1)
  @JsonKey(name: 'media_attachments')
  final List<MastodonApiMediaAttachment>? mediaAttachments;
  @override
  @HiveField(2)
  final MastodonApiScheduledStatusParams params;
  @override
  @HiveField(3)
  @JsonKey(name: 'scheduled_at')
  final DateTime scheduledAt;

  @override
  String toString() {
    return 'MastodonApiScheduledStatus(id: $id, mediaAttachments: $mediaAttachments, params: $params, scheduledAt: $scheduledAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiScheduledStatus &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other.mediaAttachments, mediaAttachments) &&
            (identical(other.params, params) || other.params == params) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(mediaAttachments),
      params,
      scheduledAt);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiScheduledStatusCopyWith<_MastodonApiScheduledStatus>
      get copyWith => __$MastodonApiScheduledStatusCopyWithImpl<
          _MastodonApiScheduledStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiScheduledStatusToJson(this);
  }
}

abstract class _MastodonApiScheduledStatus
    implements MastodonApiScheduledStatus {
  const factory _MastodonApiScheduledStatus(
      {@HiveField(0)
      @override
          required String id,
      @HiveField(1)
      @JsonKey(name: 'media_attachments')
          required List<MastodonApiMediaAttachment>? mediaAttachments,
      @HiveField(2)
          required MastodonApiScheduledStatusParams params,
      @HiveField(3)
      @JsonKey(name: 'scheduled_at')
          required DateTime scheduledAt}) = _$_MastodonApiScheduledStatus;

  factory _MastodonApiScheduledStatus.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiScheduledStatus.fromJson;

  @override
  @HiveField(0)
  @override
  String get id;
  @override
  @HiveField(1)
  @JsonKey(name: 'media_attachments')
  List<MastodonApiMediaAttachment>? get mediaAttachments;
  @override
  @HiveField(2)
  MastodonApiScheduledStatusParams get params;
  @override
  @HiveField(3)
  @JsonKey(name: 'scheduled_at')
  DateTime get scheduledAt;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiScheduledStatusCopyWith<_MastodonApiScheduledStatus>
      get copyWith => throw _privateConstructorUsedError;
}
