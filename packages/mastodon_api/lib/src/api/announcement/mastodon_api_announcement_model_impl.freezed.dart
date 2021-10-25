// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_announcement_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiAnnouncement _$MastodonApiAnnouncementFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiAnnouncement.fromJson(json);
}

/// @nodoc
class _$MastodonApiAnnouncementTearOff {
  const _$MastodonApiAnnouncementTearOff();

  _MastodonApiAnnouncement call(
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
          required List<MastodonApiAnnouncementEmojiReaction>? reactions,
      @HiveField(7)
          required List<MastodonApiMention>? mentions,
      @HiveField(8)
          required List<MastodonApiStatus>? statuses,
      @HiveField(9)
          required List<MastodonApiTag>? tags,
      @HiveField(10)
      @JsonKey(name: 'scheduled_at')
          required DateTime? scheduledAt,
      @HiveField(11)
      @JsonKey(name: 'starts_at')
          required DateTime? startsAt,
      @HiveField(12)
      @JsonKey(name: 'ends_at')
          required DateTime? endsAt}) {
    return _MastodonApiAnnouncement(
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

  MastodonApiAnnouncement fromJson(Map<String, Object> json) {
    return MastodonApiAnnouncement.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiAnnouncement = _$MastodonApiAnnouncementTearOff();

/// @nodoc
mixin _$MastodonApiAnnouncement {
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
  List<MastodonApiAnnouncementEmojiReaction>? get reactions =>
      throw _privateConstructorUsedError;
  @HiveField(7)
  List<MastodonApiMention>? get mentions => throw _privateConstructorUsedError;
  @HiveField(8)
  List<MastodonApiStatus>? get statuses => throw _privateConstructorUsedError;
  @HiveField(9)
  List<MastodonApiTag>? get tags => throw _privateConstructorUsedError;
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
  $MastodonApiAnnouncementCopyWith<MastodonApiAnnouncement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiAnnouncementCopyWith<$Res> {
  factory $MastodonApiAnnouncementCopyWith(MastodonApiAnnouncement value,
          $Res Function(MastodonApiAnnouncement) then) =
      _$MastodonApiAnnouncementCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String content,
      @HiveField(2) @JsonKey(name: 'all_day') bool allDay,
      @HiveField(3) @JsonKey(name: 'published_at') DateTime publishedAt,
      @HiveField(4) @JsonKey(name: 'updated_at') DateTime updatedAt,
      @HiveField(5) bool? read,
      @HiveField(6) List<MastodonApiAnnouncementEmojiReaction>? reactions,
      @HiveField(7) List<MastodonApiMention>? mentions,
      @HiveField(8) List<MastodonApiStatus>? statuses,
      @HiveField(9) List<MastodonApiTag>? tags,
      @HiveField(10) @JsonKey(name: 'scheduled_at') DateTime? scheduledAt,
      @HiveField(11) @JsonKey(name: 'starts_at') DateTime? startsAt,
      @HiveField(12) @JsonKey(name: 'ends_at') DateTime? endsAt});
}

/// @nodoc
class _$MastodonApiAnnouncementCopyWithImpl<$Res>
    implements $MastodonApiAnnouncementCopyWith<$Res> {
  _$MastodonApiAnnouncementCopyWithImpl(this._value, this._then);

  final MastodonApiAnnouncement _value;
  // ignore: unused_field
  final $Res Function(MastodonApiAnnouncement) _then;

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
              as List<MastodonApiAnnouncementEmojiReaction>?,
      mentions: mentions == freezed
          ? _value.mentions
          : mentions // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiMention>?,
      statuses: statuses == freezed
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiStatus>?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiTag>?,
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
abstract class _$MastodonApiAnnouncementCopyWith<$Res>
    implements $MastodonApiAnnouncementCopyWith<$Res> {
  factory _$MastodonApiAnnouncementCopyWith(_MastodonApiAnnouncement value,
          $Res Function(_MastodonApiAnnouncement) then) =
      __$MastodonApiAnnouncementCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String content,
      @HiveField(2) @JsonKey(name: 'all_day') bool allDay,
      @HiveField(3) @JsonKey(name: 'published_at') DateTime publishedAt,
      @HiveField(4) @JsonKey(name: 'updated_at') DateTime updatedAt,
      @HiveField(5) bool? read,
      @HiveField(6) List<MastodonApiAnnouncementEmojiReaction>? reactions,
      @HiveField(7) List<MastodonApiMention>? mentions,
      @HiveField(8) List<MastodonApiStatus>? statuses,
      @HiveField(9) List<MastodonApiTag>? tags,
      @HiveField(10) @JsonKey(name: 'scheduled_at') DateTime? scheduledAt,
      @HiveField(11) @JsonKey(name: 'starts_at') DateTime? startsAt,
      @HiveField(12) @JsonKey(name: 'ends_at') DateTime? endsAt});
}

/// @nodoc
class __$MastodonApiAnnouncementCopyWithImpl<$Res>
    extends _$MastodonApiAnnouncementCopyWithImpl<$Res>
    implements _$MastodonApiAnnouncementCopyWith<$Res> {
  __$MastodonApiAnnouncementCopyWithImpl(_MastodonApiAnnouncement _value,
      $Res Function(_MastodonApiAnnouncement) _then)
      : super(_value, (v) => _then(v as _MastodonApiAnnouncement));

  @override
  _MastodonApiAnnouncement get _value =>
      super._value as _MastodonApiAnnouncement;

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
    return _then(_MastodonApiAnnouncement(
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
              as List<MastodonApiAnnouncementEmojiReaction>?,
      mentions: mentions == freezed
          ? _value.mentions
          : mentions // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiMention>?,
      statuses: statuses == freezed
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiStatus>?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiTag>?,
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
class _$_MastodonApiAnnouncement implements _MastodonApiAnnouncement {
  const _$_MastodonApiAnnouncement(
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

  factory _$_MastodonApiAnnouncement.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiAnnouncementFromJson(json);

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
  final List<MastodonApiAnnouncementEmojiReaction>? reactions;
  @override
  @HiveField(7)
  final List<MastodonApiMention>? mentions;
  @override
  @HiveField(8)
  final List<MastodonApiStatus>? statuses;
  @override
  @HiveField(9)
  final List<MastodonApiTag>? tags;
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
    return 'MastodonApiAnnouncement(id: $id, content: $content, allDay: $allDay, publishedAt: $publishedAt, updatedAt: $updatedAt, read: $read, reactions: $reactions, mentions: $mentions, statuses: $statuses, tags: $tags, scheduledAt: $scheduledAt, startsAt: $startsAt, endsAt: $endsAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiAnnouncement &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.allDay, allDay) ||
                const DeepCollectionEquality().equals(other.allDay, allDay)) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality()
                    .equals(other.publishedAt, publishedAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.read, read) ||
                const DeepCollectionEquality().equals(other.read, read)) &&
            (identical(other.reactions, reactions) ||
                const DeepCollectionEquality()
                    .equals(other.reactions, reactions)) &&
            (identical(other.mentions, mentions) ||
                const DeepCollectionEquality()
                    .equals(other.mentions, mentions)) &&
            (identical(other.statuses, statuses) ||
                const DeepCollectionEquality()
                    .equals(other.statuses, statuses)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.scheduledAt, scheduledAt) ||
                const DeepCollectionEquality()
                    .equals(other.scheduledAt, scheduledAt)) &&
            (identical(other.startsAt, startsAt) ||
                const DeepCollectionEquality()
                    .equals(other.startsAt, startsAt)) &&
            (identical(other.endsAt, endsAt) ||
                const DeepCollectionEquality().equals(other.endsAt, endsAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(allDay) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(read) ^
      const DeepCollectionEquality().hash(reactions) ^
      const DeepCollectionEquality().hash(mentions) ^
      const DeepCollectionEquality().hash(statuses) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(scheduledAt) ^
      const DeepCollectionEquality().hash(startsAt) ^
      const DeepCollectionEquality().hash(endsAt);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiAnnouncementCopyWith<_MastodonApiAnnouncement> get copyWith =>
      __$MastodonApiAnnouncementCopyWithImpl<_MastodonApiAnnouncement>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiAnnouncementToJson(this);
  }
}

abstract class _MastodonApiAnnouncement implements MastodonApiAnnouncement {
  const factory _MastodonApiAnnouncement(
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
          required List<MastodonApiAnnouncementEmojiReaction>? reactions,
      @HiveField(7)
          required List<MastodonApiMention>? mentions,
      @HiveField(8)
          required List<MastodonApiStatus>? statuses,
      @HiveField(9)
          required List<MastodonApiTag>? tags,
      @HiveField(10)
      @JsonKey(name: 'scheduled_at')
          required DateTime? scheduledAt,
      @HiveField(11)
      @JsonKey(name: 'starts_at')
          required DateTime? startsAt,
      @HiveField(12)
      @JsonKey(name: 'ends_at')
          required DateTime? endsAt}) = _$_MastodonApiAnnouncement;

  factory _MastodonApiAnnouncement.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiAnnouncement.fromJson;

  @override
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get content => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'all_day')
  bool get allDay => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  @JsonKey(name: 'published_at')
  DateTime get publishedAt => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  bool? get read => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  List<MastodonApiAnnouncementEmojiReaction>? get reactions =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  List<MastodonApiMention>? get mentions => throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  List<MastodonApiStatus>? get statuses => throw _privateConstructorUsedError;
  @override
  @HiveField(9)
  List<MastodonApiTag>? get tags => throw _privateConstructorUsedError;
  @override
  @HiveField(10)
  @JsonKey(name: 'scheduled_at')
  DateTime? get scheduledAt => throw _privateConstructorUsedError;
  @override
  @HiveField(11)
  @JsonKey(name: 'starts_at')
  DateTime? get startsAt => throw _privateConstructorUsedError;
  @override
  @HiveField(12)
  @JsonKey(name: 'ends_at')
  DateTime? get endsAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiAnnouncementCopyWith<_MastodonApiAnnouncement> get copyWith =>
      throw _privateConstructorUsedError;
}
