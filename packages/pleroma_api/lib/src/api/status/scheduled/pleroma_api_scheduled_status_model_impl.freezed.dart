// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_scheduled_status_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiScheduledStatus _$PleromaApiScheduledStatusFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiScheduledStatus.fromJson(json);
}

/// @nodoc
class _$PleromaApiScheduledStatusTearOff {
  const _$PleromaApiScheduledStatusTearOff();

  _PleromaApiScheduledStatus call(
      {@HiveField(0)
      @override
          required String id,
      @HiveField(1)
      @JsonKey(name: 'media_attachments')
          required List<PleromaApiMediaAttachment>? mediaAttachments,
      @HiveField(2)
          required PleromaApiScheduledStatusParams params,
      @HiveField(3)
      @JsonKey(name: 'scheduled_at')
          required DateTime scheduledAt}) {
    return _PleromaApiScheduledStatus(
      id: id,
      mediaAttachments: mediaAttachments,
      params: params,
      scheduledAt: scheduledAt,
    );
  }

  PleromaApiScheduledStatus fromJson(Map<String, Object> json) {
    return PleromaApiScheduledStatus.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiScheduledStatus = _$PleromaApiScheduledStatusTearOff();

/// @nodoc
mixin _$PleromaApiScheduledStatus {
  @HiveField(0)
  @override
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'media_attachments')
  List<PleromaApiMediaAttachment>? get mediaAttachments =>
      throw _privateConstructorUsedError;
  @HiveField(2)
  PleromaApiScheduledStatusParams get params =>
      throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'scheduled_at')
  DateTime get scheduledAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiScheduledStatusCopyWith<PleromaApiScheduledStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiScheduledStatusCopyWith<$Res> {
  factory $PleromaApiScheduledStatusCopyWith(PleromaApiScheduledStatus value,
          $Res Function(PleromaApiScheduledStatus) then) =
      _$PleromaApiScheduledStatusCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @override
          String id,
      @HiveField(1)
      @JsonKey(name: 'media_attachments')
          List<PleromaApiMediaAttachment>? mediaAttachments,
      @HiveField(2)
          PleromaApiScheduledStatusParams params,
      @HiveField(3)
      @JsonKey(name: 'scheduled_at')
          DateTime scheduledAt});

  $PleromaApiScheduledStatusParamsCopyWith<$Res> get params;
}

/// @nodoc
class _$PleromaApiScheduledStatusCopyWithImpl<$Res>
    implements $PleromaApiScheduledStatusCopyWith<$Res> {
  _$PleromaApiScheduledStatusCopyWithImpl(this._value, this._then);

  final PleromaApiScheduledStatus _value;
  // ignore: unused_field
  final $Res Function(PleromaApiScheduledStatus) _then;

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
              as List<PleromaApiMediaAttachment>?,
      params: params == freezed
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as PleromaApiScheduledStatusParams,
      scheduledAt: scheduledAt == freezed
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $PleromaApiScheduledStatusParamsCopyWith<$Res> get params {
    return $PleromaApiScheduledStatusParamsCopyWith<$Res>(_value.params,
        (value) {
      return _then(_value.copyWith(params: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiScheduledStatusCopyWith<$Res>
    implements $PleromaApiScheduledStatusCopyWith<$Res> {
  factory _$PleromaApiScheduledStatusCopyWith(_PleromaApiScheduledStatus value,
          $Res Function(_PleromaApiScheduledStatus) then) =
      __$PleromaApiScheduledStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @override
          String id,
      @HiveField(1)
      @JsonKey(name: 'media_attachments')
          List<PleromaApiMediaAttachment>? mediaAttachments,
      @HiveField(2)
          PleromaApiScheduledStatusParams params,
      @HiveField(3)
      @JsonKey(name: 'scheduled_at')
          DateTime scheduledAt});

  @override
  $PleromaApiScheduledStatusParamsCopyWith<$Res> get params;
}

/// @nodoc
class __$PleromaApiScheduledStatusCopyWithImpl<$Res>
    extends _$PleromaApiScheduledStatusCopyWithImpl<$Res>
    implements _$PleromaApiScheduledStatusCopyWith<$Res> {
  __$PleromaApiScheduledStatusCopyWithImpl(_PleromaApiScheduledStatus _value,
      $Res Function(_PleromaApiScheduledStatus) _then)
      : super(_value, (v) => _then(v as _PleromaApiScheduledStatus));

  @override
  _PleromaApiScheduledStatus get _value =>
      super._value as _PleromaApiScheduledStatus;

  @override
  $Res call({
    Object? id = freezed,
    Object? mediaAttachments = freezed,
    Object? params = freezed,
    Object? scheduledAt = freezed,
  }) {
    return _then(_PleromaApiScheduledStatus(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mediaAttachments: mediaAttachments == freezed
          ? _value.mediaAttachments
          : mediaAttachments // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiMediaAttachment>?,
      params: params == freezed
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as PleromaApiScheduledStatusParams,
      scheduledAt: scheduledAt == freezed
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiScheduledStatus implements _PleromaApiScheduledStatus {
  const _$_PleromaApiScheduledStatus(
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

  factory _$_PleromaApiScheduledStatus.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiScheduledStatusFromJson(json);

  @override
  @HiveField(0)
  @override
  final String id;
  @override
  @HiveField(1)
  @JsonKey(name: 'media_attachments')
  final List<PleromaApiMediaAttachment>? mediaAttachments;
  @override
  @HiveField(2)
  final PleromaApiScheduledStatusParams params;
  @override
  @HiveField(3)
  @JsonKey(name: 'scheduled_at')
  final DateTime scheduledAt;

  @override
  String toString() {
    return 'PleromaApiScheduledStatus(id: $id, mediaAttachments: $mediaAttachments, params: $params, scheduledAt: $scheduledAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiScheduledStatus &&
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
  _$PleromaApiScheduledStatusCopyWith<_PleromaApiScheduledStatus>
      get copyWith =>
          __$PleromaApiScheduledStatusCopyWithImpl<_PleromaApiScheduledStatus>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiScheduledStatusToJson(this);
  }
}

abstract class _PleromaApiScheduledStatus implements PleromaApiScheduledStatus {
  const factory _PleromaApiScheduledStatus(
      {@HiveField(0)
      @override
          required String id,
      @HiveField(1)
      @JsonKey(name: 'media_attachments')
          required List<PleromaApiMediaAttachment>? mediaAttachments,
      @HiveField(2)
          required PleromaApiScheduledStatusParams params,
      @HiveField(3)
      @JsonKey(name: 'scheduled_at')
          required DateTime scheduledAt}) = _$_PleromaApiScheduledStatus;

  factory _PleromaApiScheduledStatus.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiScheduledStatus.fromJson;

  @override
  @HiveField(0)
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'media_attachments')
  List<PleromaApiMediaAttachment>? get mediaAttachments =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  PleromaApiScheduledStatusParams get params =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  @JsonKey(name: 'scheduled_at')
  DateTime get scheduledAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiScheduledStatusCopyWith<_PleromaApiScheduledStatus>
      get copyWith => throw _privateConstructorUsedError;
}
