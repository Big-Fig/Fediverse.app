// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_scheduled_status_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiScheduledStatus _$UnifediApiScheduledStatusFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiScheduledStatus.fromJson(json);
}

/// @nodoc
class _$UnifediApiScheduledStatusTearOff {
  const _$UnifediApiScheduledStatusTearOff();

  _UnifediApiScheduledStatus call(
      {@HiveField(0)
      @override
          required String id,
      @HiveField(1)
      @JsonKey(name: 'media_attachments')
          required List<UnifediApiMediaAttachment>? mediaAttachments,
      @HiveField(2)
          required UnifediApiScheduledStatusParams params,
      @HiveField(3)
      @JsonKey(name: 'scheduled_at')
          required DateTime scheduledAt}) {
    return _UnifediApiScheduledStatus(
      id: id,
      mediaAttachments: mediaAttachments,
      params: params,
      scheduledAt: scheduledAt,
    );
  }

  UnifediApiScheduledStatus fromJson(Map<String, Object> json) {
    return UnifediApiScheduledStatus.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiScheduledStatus = _$UnifediApiScheduledStatusTearOff();

/// @nodoc
mixin _$UnifediApiScheduledStatus {
  @HiveField(0)
  @override
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'media_attachments')
  List<UnifediApiMediaAttachment>? get mediaAttachments =>
      throw _privateConstructorUsedError;
  @HiveField(2)
  UnifediApiScheduledStatusParams get params =>
      throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'scheduled_at')
  DateTime get scheduledAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiScheduledStatusCopyWith<UnifediApiScheduledStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiScheduledStatusCopyWith<$Res> {
  factory $UnifediApiScheduledStatusCopyWith(UnifediApiScheduledStatus value,
          $Res Function(UnifediApiScheduledStatus) then) =
      _$UnifediApiScheduledStatusCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @override
          String id,
      @HiveField(1)
      @JsonKey(name: 'media_attachments')
          List<UnifediApiMediaAttachment>? mediaAttachments,
      @HiveField(2)
          UnifediApiScheduledStatusParams params,
      @HiveField(3)
      @JsonKey(name: 'scheduled_at')
          DateTime scheduledAt});

  $UnifediApiScheduledStatusParamsCopyWith<$Res> get params;
}

/// @nodoc
class _$UnifediApiScheduledStatusCopyWithImpl<$Res>
    implements $UnifediApiScheduledStatusCopyWith<$Res> {
  _$UnifediApiScheduledStatusCopyWithImpl(this._value, this._then);

  final UnifediApiScheduledStatus _value;
  // ignore: unused_field
  final $Res Function(UnifediApiScheduledStatus) _then;

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
              as List<UnifediApiMediaAttachment>?,
      params: params == freezed
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as UnifediApiScheduledStatusParams,
      scheduledAt: scheduledAt == freezed
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $UnifediApiScheduledStatusParamsCopyWith<$Res> get params {
    return $UnifediApiScheduledStatusParamsCopyWith<$Res>(_value.params,
        (value) {
      return _then(_value.copyWith(params: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiScheduledStatusCopyWith<$Res>
    implements $UnifediApiScheduledStatusCopyWith<$Res> {
  factory _$UnifediApiScheduledStatusCopyWith(_UnifediApiScheduledStatus value,
          $Res Function(_UnifediApiScheduledStatus) then) =
      __$UnifediApiScheduledStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @override
          String id,
      @HiveField(1)
      @JsonKey(name: 'media_attachments')
          List<UnifediApiMediaAttachment>? mediaAttachments,
      @HiveField(2)
          UnifediApiScheduledStatusParams params,
      @HiveField(3)
      @JsonKey(name: 'scheduled_at')
          DateTime scheduledAt});

  @override
  $UnifediApiScheduledStatusParamsCopyWith<$Res> get params;
}

/// @nodoc
class __$UnifediApiScheduledStatusCopyWithImpl<$Res>
    extends _$UnifediApiScheduledStatusCopyWithImpl<$Res>
    implements _$UnifediApiScheduledStatusCopyWith<$Res> {
  __$UnifediApiScheduledStatusCopyWithImpl(_UnifediApiScheduledStatus _value,
      $Res Function(_UnifediApiScheduledStatus) _then)
      : super(_value, (v) => _then(v as _UnifediApiScheduledStatus));

  @override
  _UnifediApiScheduledStatus get _value =>
      super._value as _UnifediApiScheduledStatus;

  @override
  $Res call({
    Object? id = freezed,
    Object? mediaAttachments = freezed,
    Object? params = freezed,
    Object? scheduledAt = freezed,
  }) {
    return _then(_UnifediApiScheduledStatus(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mediaAttachments: mediaAttachments == freezed
          ? _value.mediaAttachments
          : mediaAttachments // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiMediaAttachment>?,
      params: params == freezed
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as UnifediApiScheduledStatusParams,
      scheduledAt: scheduledAt == freezed
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiScheduledStatus implements _UnifediApiScheduledStatus {
  const _$_UnifediApiScheduledStatus(
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

  factory _$_UnifediApiScheduledStatus.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiScheduledStatusFromJson(json);

  @override
  @HiveField(0)
  @override
  final String id;
  @override
  @HiveField(1)
  @JsonKey(name: 'media_attachments')
  final List<UnifediApiMediaAttachment>? mediaAttachments;
  @override
  @HiveField(2)
  final UnifediApiScheduledStatusParams params;
  @override
  @HiveField(3)
  @JsonKey(name: 'scheduled_at')
  final DateTime scheduledAt;

  @override
  String toString() {
    return 'UnifediApiScheduledStatus(id: $id, mediaAttachments: $mediaAttachments, params: $params, scheduledAt: $scheduledAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiScheduledStatus &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.mediaAttachments, mediaAttachments) ||
                const DeepCollectionEquality()
                    .equals(other.mediaAttachments, mediaAttachments)) &&
            (identical(other.params, params) ||
                const DeepCollectionEquality().equals(other.params, params)) &&
            (identical(other.scheduledAt, scheduledAt) ||
                const DeepCollectionEquality()
                    .equals(other.scheduledAt, scheduledAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(mediaAttachments) ^
      const DeepCollectionEquality().hash(params) ^
      const DeepCollectionEquality().hash(scheduledAt);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiScheduledStatusCopyWith<_UnifediApiScheduledStatus>
      get copyWith =>
          __$UnifediApiScheduledStatusCopyWithImpl<_UnifediApiScheduledStatus>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiScheduledStatusToJson(this);
  }
}

abstract class _UnifediApiScheduledStatus implements UnifediApiScheduledStatus {
  const factory _UnifediApiScheduledStatus(
      {@HiveField(0)
      @override
          required String id,
      @HiveField(1)
      @JsonKey(name: 'media_attachments')
          required List<UnifediApiMediaAttachment>? mediaAttachments,
      @HiveField(2)
          required UnifediApiScheduledStatusParams params,
      @HiveField(3)
      @JsonKey(name: 'scheduled_at')
          required DateTime scheduledAt}) = _$_UnifediApiScheduledStatus;

  factory _UnifediApiScheduledStatus.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiScheduledStatus.fromJson;

  @override
  @HiveField(0)
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'media_attachments')
  List<UnifediApiMediaAttachment>? get mediaAttachments =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  UnifediApiScheduledStatusParams get params =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  @JsonKey(name: 'scheduled_at')
  DateTime get scheduledAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiScheduledStatusCopyWith<_UnifediApiScheduledStatus>
      get copyWith => throw _privateConstructorUsedError;
}
