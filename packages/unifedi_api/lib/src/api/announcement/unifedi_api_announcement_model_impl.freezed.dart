// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_announcement_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAnnouncement _$UnifediApiAnnouncementFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiAnnouncement.fromJson(json);
}

/// @nodoc
class _$UnifediApiAnnouncementTearOff {
  const _$UnifediApiAnnouncementTearOff();

  _UnifediApiAnnouncement call(
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
          required List<UnifediApiEmojiReaction>? reactions,
      @HiveField(7)
          required List<UnifediApiMention>? mentions,
      @HiveField(8)
          required List<UnifediApiStatus>? statuses,
      @HiveField(9)
          required List<UnifediApiTag>? tags,
      @HiveField(10)
      @JsonKey(name: 'scheduled_at')
          required DateTime? scheduledAt,
      @HiveField(11)
      @JsonKey(name: 'starts_at')
          required DateTime? startsAt,
      @HiveField(12)
      @JsonKey(name: 'ends_at')
          required DateTime? endsAt}) {
    return _UnifediApiAnnouncement(
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

  UnifediApiAnnouncement fromJson(Map<String, Object?> json) {
    return UnifediApiAnnouncement.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAnnouncement = _$UnifediApiAnnouncementTearOff();

/// @nodoc
mixin _$UnifediApiAnnouncement {
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
  List<UnifediApiEmojiReaction>? get reactions =>
      throw _privateConstructorUsedError;
  @HiveField(7)
  List<UnifediApiMention>? get mentions => throw _privateConstructorUsedError;
  @HiveField(8)
  List<UnifediApiStatus>? get statuses => throw _privateConstructorUsedError;
  @HiveField(9)
  List<UnifediApiTag>? get tags => throw _privateConstructorUsedError;
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
  $UnifediApiAnnouncementCopyWith<UnifediApiAnnouncement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAnnouncementCopyWith<$Res> {
  factory $UnifediApiAnnouncementCopyWith(UnifediApiAnnouncement value,
          $Res Function(UnifediApiAnnouncement) then) =
      _$UnifediApiAnnouncementCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String content,
      @HiveField(2) @JsonKey(name: 'all_day') bool allDay,
      @HiveField(3) @JsonKey(name: 'published_at') DateTime publishedAt,
      @HiveField(4) @JsonKey(name: 'updated_at') DateTime updatedAt,
      @HiveField(5) bool? read,
      @HiveField(6) List<UnifediApiEmojiReaction>? reactions,
      @HiveField(7) List<UnifediApiMention>? mentions,
      @HiveField(8) List<UnifediApiStatus>? statuses,
      @HiveField(9) List<UnifediApiTag>? tags,
      @HiveField(10) @JsonKey(name: 'scheduled_at') DateTime? scheduledAt,
      @HiveField(11) @JsonKey(name: 'starts_at') DateTime? startsAt,
      @HiveField(12) @JsonKey(name: 'ends_at') DateTime? endsAt});
}

/// @nodoc
class _$UnifediApiAnnouncementCopyWithImpl<$Res>
    implements $UnifediApiAnnouncementCopyWith<$Res> {
  _$UnifediApiAnnouncementCopyWithImpl(this._value, this._then);

  final UnifediApiAnnouncement _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAnnouncement) _then;

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
              as List<UnifediApiEmojiReaction>?,
      mentions: mentions == freezed
          ? _value.mentions
          : mentions // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiMention>?,
      statuses: statuses == freezed
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiStatus>?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiTag>?,
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
abstract class _$UnifediApiAnnouncementCopyWith<$Res>
    implements $UnifediApiAnnouncementCopyWith<$Res> {
  factory _$UnifediApiAnnouncementCopyWith(_UnifediApiAnnouncement value,
          $Res Function(_UnifediApiAnnouncement) then) =
      __$UnifediApiAnnouncementCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String content,
      @HiveField(2) @JsonKey(name: 'all_day') bool allDay,
      @HiveField(3) @JsonKey(name: 'published_at') DateTime publishedAt,
      @HiveField(4) @JsonKey(name: 'updated_at') DateTime updatedAt,
      @HiveField(5) bool? read,
      @HiveField(6) List<UnifediApiEmojiReaction>? reactions,
      @HiveField(7) List<UnifediApiMention>? mentions,
      @HiveField(8) List<UnifediApiStatus>? statuses,
      @HiveField(9) List<UnifediApiTag>? tags,
      @HiveField(10) @JsonKey(name: 'scheduled_at') DateTime? scheduledAt,
      @HiveField(11) @JsonKey(name: 'starts_at') DateTime? startsAt,
      @HiveField(12) @JsonKey(name: 'ends_at') DateTime? endsAt});
}

/// @nodoc
class __$UnifediApiAnnouncementCopyWithImpl<$Res>
    extends _$UnifediApiAnnouncementCopyWithImpl<$Res>
    implements _$UnifediApiAnnouncementCopyWith<$Res> {
  __$UnifediApiAnnouncementCopyWithImpl(_UnifediApiAnnouncement _value,
      $Res Function(_UnifediApiAnnouncement) _then)
      : super(_value, (v) => _then(v as _UnifediApiAnnouncement));

  @override
  _UnifediApiAnnouncement get _value => super._value as _UnifediApiAnnouncement;

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
    return _then(_UnifediApiAnnouncement(
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
              as List<UnifediApiEmojiReaction>?,
      mentions: mentions == freezed
          ? _value.mentions
          : mentions // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiMention>?,
      statuses: statuses == freezed
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiStatus>?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiTag>?,
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
class _$_UnifediApiAnnouncement implements _UnifediApiAnnouncement {
  const _$_UnifediApiAnnouncement(
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

  factory _$_UnifediApiAnnouncement.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiAnnouncementFromJson(json);

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
  final List<UnifediApiEmojiReaction>? reactions;
  @override
  @HiveField(7)
  final List<UnifediApiMention>? mentions;
  @override
  @HiveField(8)
  final List<UnifediApiStatus>? statuses;
  @override
  @HiveField(9)
  final List<UnifediApiTag>? tags;
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
    return 'UnifediApiAnnouncement(id: $id, content: $content, allDay: $allDay, publishedAt: $publishedAt, updatedAt: $updatedAt, read: $read, reactions: $reactions, mentions: $mentions, statuses: $statuses, tags: $tags, scheduledAt: $scheduledAt, startsAt: $startsAt, endsAt: $endsAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiAnnouncement &&
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
  _$UnifediApiAnnouncementCopyWith<_UnifediApiAnnouncement> get copyWith =>
      __$UnifediApiAnnouncementCopyWithImpl<_UnifediApiAnnouncement>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAnnouncementToJson(this);
  }
}

abstract class _UnifediApiAnnouncement implements UnifediApiAnnouncement {
  const factory _UnifediApiAnnouncement(
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
          required List<UnifediApiEmojiReaction>? reactions,
      @HiveField(7)
          required List<UnifediApiMention>? mentions,
      @HiveField(8)
          required List<UnifediApiStatus>? statuses,
      @HiveField(9)
          required List<UnifediApiTag>? tags,
      @HiveField(10)
      @JsonKey(name: 'scheduled_at')
          required DateTime? scheduledAt,
      @HiveField(11)
      @JsonKey(name: 'starts_at')
          required DateTime? startsAt,
      @HiveField(12)
      @JsonKey(name: 'ends_at')
          required DateTime? endsAt}) = _$_UnifediApiAnnouncement;

  factory _UnifediApiAnnouncement.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiAnnouncement.fromJson;

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
  List<UnifediApiEmojiReaction>? get reactions;
  @override
  @HiveField(7)
  List<UnifediApiMention>? get mentions;
  @override
  @HiveField(8)
  List<UnifediApiStatus>? get statuses;
  @override
  @HiveField(9)
  List<UnifediApiTag>? get tags;
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
  _$UnifediApiAnnouncementCopyWith<_UnifediApiAnnouncement> get copyWith =>
      throw _privateConstructorUsedError;
}
