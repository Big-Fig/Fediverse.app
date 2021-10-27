// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_featured_tags_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiFeaturedTag _$PleromaApiFeaturedTagFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiFeaturedTag.fromJson(json);
}

/// @nodoc
class _$PleromaApiFeaturedTagTearOff {
  const _$PleromaApiFeaturedTagTearOff();

  _PleromaApiFeaturedTag call(
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
    return _PleromaApiFeaturedTag(
      id: id,
      lastStatusAt: lastStatusAt,
      statusesCount: statusesCount,
      name: name,
    );
  }

  PleromaApiFeaturedTag fromJson(Map<String, Object?> json) {
    return PleromaApiFeaturedTag.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiFeaturedTag = _$PleromaApiFeaturedTagTearOff();

/// @nodoc
mixin _$PleromaApiFeaturedTag {
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
  $PleromaApiFeaturedTagCopyWith<PleromaApiFeaturedTag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiFeaturedTagCopyWith<$Res> {
  factory $PleromaApiFeaturedTagCopyWith(PleromaApiFeaturedTag value,
          $Res Function(PleromaApiFeaturedTag) then) =
      _$PleromaApiFeaturedTagCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(name: 'last_status_at') DateTime? lastStatusAt,
      @HiveField(2) @JsonKey(name: 'statuses_count') int statusesCount,
      @HiveField(3) String name});
}

/// @nodoc
class _$PleromaApiFeaturedTagCopyWithImpl<$Res>
    implements $PleromaApiFeaturedTagCopyWith<$Res> {
  _$PleromaApiFeaturedTagCopyWithImpl(this._value, this._then);

  final PleromaApiFeaturedTag _value;
  // ignore: unused_field
  final $Res Function(PleromaApiFeaturedTag) _then;

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
abstract class _$PleromaApiFeaturedTagCopyWith<$Res>
    implements $PleromaApiFeaturedTagCopyWith<$Res> {
  factory _$PleromaApiFeaturedTagCopyWith(_PleromaApiFeaturedTag value,
          $Res Function(_PleromaApiFeaturedTag) then) =
      __$PleromaApiFeaturedTagCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(name: 'last_status_at') DateTime? lastStatusAt,
      @HiveField(2) @JsonKey(name: 'statuses_count') int statusesCount,
      @HiveField(3) String name});
}

/// @nodoc
class __$PleromaApiFeaturedTagCopyWithImpl<$Res>
    extends _$PleromaApiFeaturedTagCopyWithImpl<$Res>
    implements _$PleromaApiFeaturedTagCopyWith<$Res> {
  __$PleromaApiFeaturedTagCopyWithImpl(_PleromaApiFeaturedTag _value,
      $Res Function(_PleromaApiFeaturedTag) _then)
      : super(_value, (v) => _then(v as _PleromaApiFeaturedTag));

  @override
  _PleromaApiFeaturedTag get _value => super._value as _PleromaApiFeaturedTag;

  @override
  $Res call({
    Object? id = freezed,
    Object? lastStatusAt = freezed,
    Object? statusesCount = freezed,
    Object? name = freezed,
  }) {
    return _then(_PleromaApiFeaturedTag(
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
class _$_PleromaApiFeaturedTag implements _PleromaApiFeaturedTag {
  const _$_PleromaApiFeaturedTag(
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

  factory _$_PleromaApiFeaturedTag.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiFeaturedTagFromJson(json);

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
    return 'PleromaApiFeaturedTag(id: $id, lastStatusAt: $lastStatusAt, statusesCount: $statusesCount, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiFeaturedTag &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lastStatusAt, lastStatusAt) ||
                other.lastStatusAt == lastStatusAt) &&
            (identical(other.statusesCount, statusesCount) ||
                other.statusesCount == statusesCount) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, lastStatusAt, statusesCount, name);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiFeaturedTagCopyWith<_PleromaApiFeaturedTag> get copyWith =>
      __$PleromaApiFeaturedTagCopyWithImpl<_PleromaApiFeaturedTag>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiFeaturedTagToJson(this);
  }
}

abstract class _PleromaApiFeaturedTag implements PleromaApiFeaturedTag {
  const factory _PleromaApiFeaturedTag(
      {@HiveField(0)
          required String id,
      @HiveField(1)
      @JsonKey(name: 'last_status_at')
          required DateTime? lastStatusAt,
      @HiveField(2)
      @JsonKey(name: 'statuses_count')
          required int statusesCount,
      @HiveField(3)
          required String name}) = _$_PleromaApiFeaturedTag;

  factory _PleromaApiFeaturedTag.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiFeaturedTag.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  @JsonKey(name: 'last_status_at')
  DateTime? get lastStatusAt;
  @override
  @HiveField(2)
  @JsonKey(name: 'statuses_count')
  int get statusesCount;
  @override
  @HiveField(3)
  String get name;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiFeaturedTagCopyWith<_PleromaApiFeaturedTag> get copyWith =>
      throw _privateConstructorUsedError;
}
