// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_featured_tags_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiFeaturedTag _$MastodonApiFeaturedTagFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiFeaturedTag.fromJson(json);
}

/// @nodoc
class _$MastodonApiFeaturedTagTearOff {
  const _$MastodonApiFeaturedTagTearOff();

  _MastodonApiFeaturedTag call(
      {@HiveField(0)
          required String id,
      @HiveField(1)
      @JsonKey(name: 'last_status_at')
          required DateTime? lastStatusAt,
      @HiveField(2)
      @JsonKey(name: 'statuses_count')
          required int statusesCount,
      @HiveField(3)
          required String name}) {
    return _MastodonApiFeaturedTag(
      id: id,
      lastStatusAt: lastStatusAt,
      statusesCount: statusesCount,
      name: name,
    );
  }

  MastodonApiFeaturedTag fromJson(Map<String, Object> json) {
    return MastodonApiFeaturedTag.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiFeaturedTag = _$MastodonApiFeaturedTagTearOff();

/// @nodoc
mixin _$MastodonApiFeaturedTag {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'last_status_at')
  DateTime? get lastStatusAt => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'statuses_count')
  int get statusesCount => throw _privateConstructorUsedError;
  @HiveField(3)
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiFeaturedTagCopyWith<MastodonApiFeaturedTag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiFeaturedTagCopyWith<$Res> {
  factory $MastodonApiFeaturedTagCopyWith(MastodonApiFeaturedTag value,
          $Res Function(MastodonApiFeaturedTag) then) =
      _$MastodonApiFeaturedTagCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(name: 'last_status_at') DateTime? lastStatusAt,
      @HiveField(2) @JsonKey(name: 'statuses_count') int statusesCount,
      @HiveField(3) String name});
}

/// @nodoc
class _$MastodonApiFeaturedTagCopyWithImpl<$Res>
    implements $MastodonApiFeaturedTagCopyWith<$Res> {
  _$MastodonApiFeaturedTagCopyWithImpl(this._value, this._then);

  final MastodonApiFeaturedTag _value;
  // ignore: unused_field
  final $Res Function(MastodonApiFeaturedTag) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? lastStatusAt = freezed,
    Object? statusesCount = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastStatusAt: lastStatusAt == freezed
          ? _value.lastStatusAt
          : lastStatusAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      statusesCount: statusesCount == freezed
          ? _value.statusesCount
          : statusesCount // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MastodonApiFeaturedTagCopyWith<$Res>
    implements $MastodonApiFeaturedTagCopyWith<$Res> {
  factory _$MastodonApiFeaturedTagCopyWith(_MastodonApiFeaturedTag value,
          $Res Function(_MastodonApiFeaturedTag) then) =
      __$MastodonApiFeaturedTagCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(name: 'last_status_at') DateTime? lastStatusAt,
      @HiveField(2) @JsonKey(name: 'statuses_count') int statusesCount,
      @HiveField(3) String name});
}

/// @nodoc
class __$MastodonApiFeaturedTagCopyWithImpl<$Res>
    extends _$MastodonApiFeaturedTagCopyWithImpl<$Res>
    implements _$MastodonApiFeaturedTagCopyWith<$Res> {
  __$MastodonApiFeaturedTagCopyWithImpl(_MastodonApiFeaturedTag _value,
      $Res Function(_MastodonApiFeaturedTag) _then)
      : super(_value, (v) => _then(v as _MastodonApiFeaturedTag));

  @override
  _MastodonApiFeaturedTag get _value => super._value as _MastodonApiFeaturedTag;

  @override
  $Res call({
    Object? id = freezed,
    Object? lastStatusAt = freezed,
    Object? statusesCount = freezed,
    Object? name = freezed,
  }) {
    return _then(_MastodonApiFeaturedTag(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastStatusAt: lastStatusAt == freezed
          ? _value.lastStatusAt
          : lastStatusAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      statusesCount: statusesCount == freezed
          ? _value.statusesCount
          : statusesCount // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiFeaturedTag implements _MastodonApiFeaturedTag {
  const _$_MastodonApiFeaturedTag(
      {@HiveField(0)
          required this.id,
      @HiveField(1)
      @JsonKey(name: 'last_status_at')
          required this.lastStatusAt,
      @HiveField(2)
      @JsonKey(name: 'statuses_count')
          required this.statusesCount,
      @HiveField(3)
          required this.name});

  factory _$_MastodonApiFeaturedTag.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiFeaturedTagFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  @JsonKey(name: 'last_status_at')
  final DateTime? lastStatusAt;
  @override
  @HiveField(2)
  @JsonKey(name: 'statuses_count')
  final int statusesCount;
  @override
  @HiveField(3)
  final String name;

  @override
  String toString() {
    return 'MastodonApiFeaturedTag(id: $id, lastStatusAt: $lastStatusAt, statusesCount: $statusesCount, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiFeaturedTag &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.lastStatusAt, lastStatusAt) ||
                const DeepCollectionEquality()
                    .equals(other.lastStatusAt, lastStatusAt)) &&
            (identical(other.statusesCount, statusesCount) ||
                const DeepCollectionEquality()
                    .equals(other.statusesCount, statusesCount)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(lastStatusAt) ^
      const DeepCollectionEquality().hash(statusesCount) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiFeaturedTagCopyWith<_MastodonApiFeaturedTag> get copyWith =>
      __$MastodonApiFeaturedTagCopyWithImpl<_MastodonApiFeaturedTag>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiFeaturedTagToJson(this);
  }
}

abstract class _MastodonApiFeaturedTag implements MastodonApiFeaturedTag {
  const factory _MastodonApiFeaturedTag(
      {@HiveField(0)
          required String id,
      @HiveField(1)
      @JsonKey(name: 'last_status_at')
          required DateTime? lastStatusAt,
      @HiveField(2)
      @JsonKey(name: 'statuses_count')
          required int statusesCount,
      @HiveField(3)
          required String name}) = _$_MastodonApiFeaturedTag;

  factory _MastodonApiFeaturedTag.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiFeaturedTag.fromJson;

  @override
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'last_status_at')
  DateTime? get lastStatusAt => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'statuses_count')
  int get statusesCount => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiFeaturedTagCopyWith<_MastodonApiFeaturedTag> get copyWith =>
      throw _privateConstructorUsedError;
}
