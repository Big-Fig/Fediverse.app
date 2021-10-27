// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_tag_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiTag _$UnifediApiTagFromJson(Map<String, dynamic> json) {
  return _UnifediApiTag.fromJson(json);
}

/// @nodoc
class _$UnifediApiTagTearOff {
  const _$UnifediApiTagTearOff();

  _UnifediApiTag call(
      {@HiveField(0)
          required String name,
      @HiveField(1)
          required String? url,
      @HiveField(2)
          required UnifediApiTagHistory? history,
      @HiveField(3)
          required String? id,
      @JsonKey(name: 'last_status_at')
      @HiveField(4)
          required DateTime? lastStatusAt,
      @JsonKey(name: 'statuses_count')
      @HiveField(5)
          required int? statusesCount}) {
    return _UnifediApiTag(
      name: name,
      url: url,
      history: history,
      id: id,
      lastStatusAt: lastStatusAt,
      statusesCount: statusesCount,
    );
  }

  UnifediApiTag fromJson(Map<String, Object?> json) {
    return UnifediApiTag.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiTag = _$UnifediApiTagTearOff();

/// @nodoc
mixin _$UnifediApiTag {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get url => throw _privateConstructorUsedError;
  @HiveField(2)
  UnifediApiTagHistory? get history => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_status_at')
  @HiveField(4)
  DateTime? get lastStatusAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'statuses_count')
  @HiveField(5)
  int? get statusesCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiTagCopyWith<UnifediApiTag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiTagCopyWith<$Res> {
  factory $UnifediApiTagCopyWith(
          UnifediApiTag value, $Res Function(UnifediApiTag) then) =
      _$UnifediApiTagCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String? url,
      @HiveField(2) UnifediApiTagHistory? history,
      @HiveField(3) String? id,
      @JsonKey(name: 'last_status_at') @HiveField(4) DateTime? lastStatusAt,
      @JsonKey(name: 'statuses_count') @HiveField(5) int? statusesCount});

  $UnifediApiTagHistoryCopyWith<$Res>? get history;
}

/// @nodoc
class _$UnifediApiTagCopyWithImpl<$Res>
    implements $UnifediApiTagCopyWith<$Res> {
  _$UnifediApiTagCopyWithImpl(this._value, this._then);

  final UnifediApiTag _value;
  // ignore: unused_field
  final $Res Function(UnifediApiTag) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
    Object? history = freezed,
    Object? id = freezed,
    Object? lastStatusAt = freezed,
    Object? statusesCount = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      history: history == freezed
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as UnifediApiTagHistory?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      lastStatusAt: lastStatusAt == freezed
          ? _value.lastStatusAt
          : lastStatusAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      statusesCount: statusesCount == freezed
          ? _value.statusesCount
          : statusesCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $UnifediApiTagHistoryCopyWith<$Res>? get history {
    if (_value.history == null) {
      return null;
    }

    return $UnifediApiTagHistoryCopyWith<$Res>(_value.history!, (value) {
      return _then(_value.copyWith(history: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiTagCopyWith<$Res>
    implements $UnifediApiTagCopyWith<$Res> {
  factory _$UnifediApiTagCopyWith(
          _UnifediApiTag value, $Res Function(_UnifediApiTag) then) =
      __$UnifediApiTagCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String? url,
      @HiveField(2) UnifediApiTagHistory? history,
      @HiveField(3) String? id,
      @JsonKey(name: 'last_status_at') @HiveField(4) DateTime? lastStatusAt,
      @JsonKey(name: 'statuses_count') @HiveField(5) int? statusesCount});

  @override
  $UnifediApiTagHistoryCopyWith<$Res>? get history;
}

/// @nodoc
class __$UnifediApiTagCopyWithImpl<$Res>
    extends _$UnifediApiTagCopyWithImpl<$Res>
    implements _$UnifediApiTagCopyWith<$Res> {
  __$UnifediApiTagCopyWithImpl(
      _UnifediApiTag _value, $Res Function(_UnifediApiTag) _then)
      : super(_value, (v) => _then(v as _UnifediApiTag));

  @override
  _UnifediApiTag get _value => super._value as _UnifediApiTag;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
    Object? history = freezed,
    Object? id = freezed,
    Object? lastStatusAt = freezed,
    Object? statusesCount = freezed,
  }) {
    return _then(_UnifediApiTag(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      history: history == freezed
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as UnifediApiTagHistory?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      lastStatusAt: lastStatusAt == freezed
          ? _value.lastStatusAt
          : lastStatusAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      statusesCount: statusesCount == freezed
          ? _value.statusesCount
          : statusesCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiTag implements _UnifediApiTag {
  const _$_UnifediApiTag(
      {@HiveField(0)
          required this.name,
      @HiveField(1)
          required this.url,
      @HiveField(2)
          required this.history,
      @HiveField(3)
          required this.id,
      @JsonKey(name: 'last_status_at')
      @HiveField(4)
          required this.lastStatusAt,
      @JsonKey(name: 'statuses_count')
      @HiveField(5)
          required this.statusesCount});

  factory _$_UnifediApiTag.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiTagFromJson(json);

  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final String? url;
  @override
  @HiveField(2)
  final UnifediApiTagHistory? history;
  @override
  @HiveField(3)
  final String? id;
  @override
  @JsonKey(name: 'last_status_at')
  @HiveField(4)
  final DateTime? lastStatusAt;
  @override
  @JsonKey(name: 'statuses_count')
  @HiveField(5)
  final int? statusesCount;

  @override
  String toString() {
    return 'UnifediApiTag(name: $name, url: $url, history: $history, id: $id, lastStatusAt: $lastStatusAt, statusesCount: $statusesCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiTag &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.history, history) || other.history == history) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lastStatusAt, lastStatusAt) ||
                other.lastStatusAt == lastStatusAt) &&
            (identical(other.statusesCount, statusesCount) ||
                other.statusesCount == statusesCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, url, history, id, lastStatusAt, statusesCount);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiTagCopyWith<_UnifediApiTag> get copyWith =>
      __$UnifediApiTagCopyWithImpl<_UnifediApiTag>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiTagToJson(this);
  }
}

abstract class _UnifediApiTag implements UnifediApiTag {
  const factory _UnifediApiTag(
      {@HiveField(0)
          required String name,
      @HiveField(1)
          required String? url,
      @HiveField(2)
          required UnifediApiTagHistory? history,
      @HiveField(3)
          required String? id,
      @JsonKey(name: 'last_status_at')
      @HiveField(4)
          required DateTime? lastStatusAt,
      @JsonKey(name: 'statuses_count')
      @HiveField(5)
          required int? statusesCount}) = _$_UnifediApiTag;

  factory _UnifediApiTag.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiTag.fromJson;

  @override
  @HiveField(0)
  String get name;
  @override
  @HiveField(1)
  String? get url;
  @override
  @HiveField(2)
  UnifediApiTagHistory? get history;
  @override
  @HiveField(3)
  String? get id;
  @override
  @JsonKey(name: 'last_status_at')
  @HiveField(4)
  DateTime? get lastStatusAt;
  @override
  @JsonKey(name: 'statuses_count')
  @HiveField(5)
  int? get statusesCount;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiTagCopyWith<_UnifediApiTag> get copyWith =>
      throw _privateConstructorUsedError;
}
