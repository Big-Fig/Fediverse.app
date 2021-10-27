// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_announcement_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiAnnouncement _$PleromaApiAnnouncementFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiAnnouncement.fromJson(json);
}

/// @nodoc
class _$PleromaApiAnnouncementTearOff {
  const _$PleromaApiAnnouncementTearOff();

  _PleromaApiAnnouncement call(
      {@HiveField(0)
          required String id,
      @HiveField(1)
          required String content,
      @HiveField(2)
      @JsonKey(name: 'all_day')
          required bool allDay,
      @HiveField(3)
      @JsonKey(name: 'published_at')
          required DateTime publishedAt,
      @HiveField(4)
      @JsonKey(name: 'updated_at')
          required DateTime updatedAt,
      @HiveField(5)
          required bool? read,
      @HiveField(6)
          required List<PleromaApiAnnouncementEmojiReaction>? reactions,
      @HiveField(7)
          required List<PleromaApiMention>? mentions,
      @HiveField(8)
          required List<PleromaApiStatus>? statuses,
      @HiveField(9)
          required List<PleromaApiTag>? tags,
      @HiveField(10)
      @JsonKey(name: 'scheduled_at')
          required DateTime? scheduledAt,
      @HiveField(11)
      @JsonKey(name: 'starts_at')
          required DateTime? startsAt,
      @HiveField(12)
      @JsonKey(name: 'ends_at')
          required DateTime? endsAt}) {
    return _PleromaApiAnnouncement(
      id: id,
      content: content,
      allDay: allDay,
      publishedAt: publishedAt,
      updatedAt: updatedAt,
      read: read,
      reactions: reactions,
      mentions: mentions,
      statuses: statuses,
      tags: tags,
      scheduledAt: scheduledAt,
      startsAt: startsAt,
      endsAt: endsAt,
    );
  }

  PleromaApiAnnouncement fromJson(Map<String, Object?> json) {
    return PleromaApiAnnouncement.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiAnnouncement = _$PleromaApiAnnouncementTearOff();

/// @nodoc
mixin _$PleromaApiAnnouncement {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get content => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'all_day')
  bool get allDay => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'published_at')
  DateTime get publishedAt => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @HiveField(5)
  bool? get read => throw _privateConstructorUsedError;
  @HiveField(6)
  List<PleromaApiAnnouncementEmojiReaction>? get reactions =>
      throw _privateConstructorUsedError;
  @HiveField(7)
  List<PleromaApiMention>? get mentions => throw _privateConstructorUsedError;
  @HiveField(8)
  List<PleromaApiStatus>? get statuses => throw _privateConstructorUsedError;
  @HiveField(9)
  List<PleromaApiTag>? get tags => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(name: 'scheduled_at')
  DateTime? get scheduledAt => throw _privateConstructorUsedError;
  @HiveField(11)
  @JsonKey(name: 'starts_at')
  DateTime? get startsAt => throw _privateConstructorUsedError;
  @HiveField(12)
  @JsonKey(name: 'ends_at')
  DateTime? get endsAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiAnnouncementCopyWith<PleromaApiAnnouncement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiAnnouncementCopyWith<$Res> {
  factory $PleromaApiAnnouncementCopyWith(PleromaApiAnnouncement value,
          $Res Function(PleromaApiAnnouncement) then) =
      _$PleromaApiAnnouncementCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String content,
      @HiveField(2) @JsonKey(name: 'all_day') bool allDay,
      @HiveField(3) @JsonKey(name: 'published_at') DateTime publishedAt,
      @HiveField(4) @JsonKey(name: 'updated_at') DateTime updatedAt,
      @HiveField(5) bool? read,
      @HiveField(6) List<PleromaApiAnnouncementEmojiReaction>? reactions,
      @HiveField(7) List<PleromaApiMention>? mentions,
      @HiveField(8) List<PleromaApiStatus>? statuses,
      @HiveField(9) List<PleromaApiTag>? tags,
      @HiveField(10) @JsonKey(name: 'scheduled_at') DateTime? scheduledAt,
      @HiveField(11) @JsonKey(name: 'starts_at') DateTime? startsAt,
      @HiveField(12) @JsonKey(name: 'ends_at') DateTime? endsAt});
}

/// @nodoc
class _$PleromaApiAnnouncementCopyWithImpl<$Res>
    implements $PleromaApiAnnouncementCopyWith<$Res> {
  _$PleromaApiAnnouncementCopyWithImpl(this._value, this._then);

  final PleromaApiAnnouncement _value;
  // ignore: unused_field
  final $Res Function(PleromaApiAnnouncement) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
    Object? allDay = freezed,
    Object? publishedAt = freezed,
    Object? updatedAt = freezed,
    Object? read = freezed,
    Object? reactions = freezed,
    Object? mentions = freezed,
    Object? statuses = freezed,
    Object? tags = freezed,
    Object? scheduledAt = freezed,
    Object? startsAt = freezed,
    Object? endsAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      allDay: allDay == freezed
          ? _value.allDay
          : allDay // ignore: cast_nullable_to_non_nullable
              as bool,
      publishedAt: publishedAt == freezed
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      read: read == freezed
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool?,
      reactions: reactions == freezed
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiAnnouncementEmojiReaction>?,
      mentions: mentions == freezed
          ? _value.mentions
          : mentions // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiMention>?,
      statuses: statuses == freezed
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiStatus>?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiTag>?,
      scheduledAt: scheduledAt == freezed
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startsAt: startsAt == freezed
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endsAt: endsAt == freezed
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiAnnouncementCopyWith<$Res>
    implements $PleromaApiAnnouncementCopyWith<$Res> {
  factory _$PleromaApiAnnouncementCopyWith(_PleromaApiAnnouncement value,
          $Res Function(_PleromaApiAnnouncement) then) =
      __$PleromaApiAnnouncementCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String content,
      @HiveField(2) @JsonKey(name: 'all_day') bool allDay,
      @HiveField(3) @JsonKey(name: 'published_at') DateTime publishedAt,
      @HiveField(4) @JsonKey(name: 'updated_at') DateTime updatedAt,
      @HiveField(5) bool? read,
      @HiveField(6) List<PleromaApiAnnouncementEmojiReaction>? reactions,
      @HiveField(7) List<PleromaApiMention>? mentions,
      @HiveField(8) List<PleromaApiStatus>? statuses,
      @HiveField(9) List<PleromaApiTag>? tags,
      @HiveField(10) @JsonKey(name: 'scheduled_at') DateTime? scheduledAt,
      @HiveField(11) @JsonKey(name: 'starts_at') DateTime? startsAt,
      @HiveField(12) @JsonKey(name: 'ends_at') DateTime? endsAt});
}

/// @nodoc
class __$PleromaApiAnnouncementCopyWithImpl<$Res>
    extends _$PleromaApiAnnouncementCopyWithImpl<$Res>
    implements _$PleromaApiAnnouncementCopyWith<$Res> {
  __$PleromaApiAnnouncementCopyWithImpl(_PleromaApiAnnouncement _value,
      $Res Function(_PleromaApiAnnouncement) _then)
      : super(_value, (v) => _then(v as _PleromaApiAnnouncement));

  @override
  _PleromaApiAnnouncement get _value => super._value as _PleromaApiAnnouncement;

  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
    Object? allDay = freezed,
    Object? publishedAt = freezed,
    Object? updatedAt = freezed,
    Object? read = freezed,
    Object? reactions = freezed,
    Object? mentions = freezed,
    Object? statuses = freezed,
    Object? tags = freezed,
    Object? scheduledAt = freezed,
    Object? startsAt = freezed,
    Object? endsAt = freezed,
  }) {
    return _then(_PleromaApiAnnouncement(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      allDay: allDay == freezed
          ? _value.allDay
          : allDay // ignore: cast_nullable_to_non_nullable
              as bool,
      publishedAt: publishedAt == freezed
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      read: read == freezed
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool?,
      reactions: reactions == freezed
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiAnnouncementEmojiReaction>?,
      mentions: mentions == freezed
          ? _value.mentions
          : mentions // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiMention>?,
      statuses: statuses == freezed
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiStatus>?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiTag>?,
      scheduledAt: scheduledAt == freezed
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startsAt: startsAt == freezed
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endsAt: endsAt == freezed
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiAnnouncement implements _PleromaApiAnnouncement {
  const _$_PleromaApiAnnouncement(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.content,
      @HiveField(2) @JsonKey(name: 'all_day') required this.allDay,
      @HiveField(3) @JsonKey(name: 'published_at') required this.publishedAt,
      @HiveField(4) @JsonKey(name: 'updated_at') required this.updatedAt,
      @HiveField(5) required this.read,
      @HiveField(6) required this.reactions,
      @HiveField(7) required this.mentions,
      @HiveField(8) required this.statuses,
      @HiveField(9) required this.tags,
      @HiveField(10) @JsonKey(name: 'scheduled_at') required this.scheduledAt,
      @HiveField(11) @JsonKey(name: 'starts_at') required this.startsAt,
      @HiveField(12) @JsonKey(name: 'ends_at') required this.endsAt});

  factory _$_PleromaApiAnnouncement.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiAnnouncementFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String content;
  @override
  @HiveField(2)
  @JsonKey(name: 'all_day')
  final bool allDay;
  @override
  @HiveField(3)
  @JsonKey(name: 'published_at')
  final DateTime publishedAt;
  @override
  @HiveField(4)
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @HiveField(5)
  final bool? read;
  @override
  @HiveField(6)
  final List<PleromaApiAnnouncementEmojiReaction>? reactions;
  @override
  @HiveField(7)
  final List<PleromaApiMention>? mentions;
  @override
  @HiveField(8)
  final List<PleromaApiStatus>? statuses;
  @override
  @HiveField(9)
  final List<PleromaApiTag>? tags;
  @override
  @HiveField(10)
  @JsonKey(name: 'scheduled_at')
  final DateTime? scheduledAt;
  @override
  @HiveField(11)
  @JsonKey(name: 'starts_at')
  final DateTime? startsAt;
  @override
  @HiveField(12)
  @JsonKey(name: 'ends_at')
  final DateTime? endsAt;

  @override
  String toString() {
    return 'PleromaApiAnnouncement(id: $id, content: $content, allDay: $allDay, publishedAt: $publishedAt, updatedAt: $updatedAt, read: $read, reactions: $reactions, mentions: $mentions, statuses: $statuses, tags: $tags, scheduledAt: $scheduledAt, startsAt: $startsAt, endsAt: $endsAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiAnnouncement &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.allDay, allDay) || other.allDay == allDay) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.read, read) || other.read == read) &&
            const DeepCollectionEquality().equals(other.reactions, reactions) &&
            const DeepCollectionEquality().equals(other.mentions, mentions) &&
            const DeepCollectionEquality().equals(other.statuses, statuses) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.startsAt, startsAt) ||
                other.startsAt == startsAt) &&
            (identical(other.endsAt, endsAt) || other.endsAt == endsAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      content,
      allDay,
      publishedAt,
      updatedAt,
      read,
      const DeepCollectionEquality().hash(reactions),
      const DeepCollectionEquality().hash(mentions),
      const DeepCollectionEquality().hash(statuses),
      const DeepCollectionEquality().hash(tags),
      scheduledAt,
      startsAt,
      endsAt);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiAnnouncementCopyWith<_PleromaApiAnnouncement> get copyWith =>
      __$PleromaApiAnnouncementCopyWithImpl<_PleromaApiAnnouncement>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiAnnouncementToJson(this);
  }
}

abstract class _PleromaApiAnnouncement implements PleromaApiAnnouncement {
  const factory _PleromaApiAnnouncement(
      {@HiveField(0)
          required String id,
      @HiveField(1)
          required String content,
      @HiveField(2)
      @JsonKey(name: 'all_day')
          required bool allDay,
      @HiveField(3)
      @JsonKey(name: 'published_at')
          required DateTime publishedAt,
      @HiveField(4)
      @JsonKey(name: 'updated_at')
          required DateTime updatedAt,
      @HiveField(5)
          required bool? read,
      @HiveField(6)
          required List<PleromaApiAnnouncementEmojiReaction>? reactions,
      @HiveField(7)
          required List<PleromaApiMention>? mentions,
      @HiveField(8)
          required List<PleromaApiStatus>? statuses,
      @HiveField(9)
          required List<PleromaApiTag>? tags,
      @HiveField(10)
      @JsonKey(name: 'scheduled_at')
          required DateTime? scheduledAt,
      @HiveField(11)
      @JsonKey(name: 'starts_at')
          required DateTime? startsAt,
      @HiveField(12)
      @JsonKey(name: 'ends_at')
          required DateTime? endsAt}) = _$_PleromaApiAnnouncement;

  factory _PleromaApiAnnouncement.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiAnnouncement.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get content;
  @override
  @HiveField(2)
  @JsonKey(name: 'all_day')
  bool get allDay;
  @override
  @HiveField(3)
  @JsonKey(name: 'published_at')
  DateTime get publishedAt;
  @override
  @HiveField(4)
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @HiveField(5)
  bool? get read;
  @override
  @HiveField(6)
  List<PleromaApiAnnouncementEmojiReaction>? get reactions;
  @override
  @HiveField(7)
  List<PleromaApiMention>? get mentions;
  @override
  @HiveField(8)
  List<PleromaApiStatus>? get statuses;
  @override
  @HiveField(9)
  List<PleromaApiTag>? get tags;
  @override
  @HiveField(10)
  @JsonKey(name: 'scheduled_at')
  DateTime? get scheduledAt;
  @override
  @HiveField(11)
  @JsonKey(name: 'starts_at')
  DateTime? get startsAt;
  @override
  @HiveField(12)
  @JsonKey(name: 'ends_at')
  DateTime? get endsAt;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiAnnouncementCopyWith<_PleromaApiAnnouncement> get copyWith =>
      throw _privateConstructorUsedError;
}
