// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'timelines_home_tab_storage_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TimelinesHomeTabStorageListItemTearOff {
  const _$TimelinesHomeTabStorageListItemTearOff();

  _TimelinesHomeTabStorageListItem call(
      {required Timeline timeline, required Key key}) {
    return _TimelinesHomeTabStorageListItem(
      timeline: timeline,
      key: key,
    );
  }
}

/// @nodoc
const $TimelinesHomeTabStorageListItem =
    _$TimelinesHomeTabStorageListItemTearOff();

/// @nodoc
mixin _$TimelinesHomeTabStorageListItem {
  Timeline get timeline => throw _privateConstructorUsedError;
  Key get key => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimelinesHomeTabStorageListItemCopyWith<TimelinesHomeTabStorageListItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelinesHomeTabStorageListItemCopyWith<$Res> {
  factory $TimelinesHomeTabStorageListItemCopyWith(
          TimelinesHomeTabStorageListItem value,
          $Res Function(TimelinesHomeTabStorageListItem) then) =
      _$TimelinesHomeTabStorageListItemCopyWithImpl<$Res>;
  $Res call({Timeline timeline, Key key});

  $TimelineCopyWith<$Res> get timeline;
}

/// @nodoc
class _$TimelinesHomeTabStorageListItemCopyWithImpl<$Res>
    implements $TimelinesHomeTabStorageListItemCopyWith<$Res> {
  _$TimelinesHomeTabStorageListItemCopyWithImpl(this._value, this._then);

  final TimelinesHomeTabStorageListItem _value;
  // ignore: unused_field
  final $Res Function(TimelinesHomeTabStorageListItem) _then;

  @override
  $Res call({
    Object? timeline = freezed,
    Object? key = freezed,
  }) {
    return _then(_value.copyWith(
      timeline: timeline == freezed
          ? _value.timeline
          : timeline // ignore: cast_nullable_to_non_nullable
              as Timeline,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Key,
    ));
  }

  @override
  $TimelineCopyWith<$Res> get timeline {
    return $TimelineCopyWith<$Res>(_value.timeline, (value) {
      return _then(_value.copyWith(timeline: value));
    });
  }
}

/// @nodoc
abstract class _$TimelinesHomeTabStorageListItemCopyWith<$Res>
    implements $TimelinesHomeTabStorageListItemCopyWith<$Res> {
  factory _$TimelinesHomeTabStorageListItemCopyWith(
          _TimelinesHomeTabStorageListItem value,
          $Res Function(_TimelinesHomeTabStorageListItem) then) =
      __$TimelinesHomeTabStorageListItemCopyWithImpl<$Res>;
  @override
  $Res call({Timeline timeline, Key key});

  @override
  $TimelineCopyWith<$Res> get timeline;
}

/// @nodoc
class __$TimelinesHomeTabStorageListItemCopyWithImpl<$Res>
    extends _$TimelinesHomeTabStorageListItemCopyWithImpl<$Res>
    implements _$TimelinesHomeTabStorageListItemCopyWith<$Res> {
  __$TimelinesHomeTabStorageListItemCopyWithImpl(
      _TimelinesHomeTabStorageListItem _value,
      $Res Function(_TimelinesHomeTabStorageListItem) _then)
      : super(_value, (v) => _then(v as _TimelinesHomeTabStorageListItem));

  @override
  _TimelinesHomeTabStorageListItem get _value =>
      super._value as _TimelinesHomeTabStorageListItem;

  @override
  $Res call({
    Object? timeline = freezed,
    Object? key = freezed,
  }) {
    return _then(_TimelinesHomeTabStorageListItem(
      timeline: timeline == freezed
          ? _value.timeline
          : timeline // ignore: cast_nullable_to_non_nullable
              as Timeline,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Key,
    ));
  }
}

/// @nodoc

class _$_TimelinesHomeTabStorageListItem
    with DiagnosticableTreeMixin
    implements _TimelinesHomeTabStorageListItem {
  const _$_TimelinesHomeTabStorageListItem(
      {required this.timeline, required this.key});

  @override
  final Timeline timeline;
  @override
  final Key key;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimelinesHomeTabStorageListItem(timeline: $timeline, key: $key)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimelinesHomeTabStorageListItem'))
      ..add(DiagnosticsProperty('timeline', timeline))
      ..add(DiagnosticsProperty('key', key));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimelinesHomeTabStorageListItem &&
            (identical(other.timeline, timeline) ||
                other.timeline == timeline) &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timeline, key);

  @JsonKey(ignore: true)
  @override
  _$TimelinesHomeTabStorageListItemCopyWith<_TimelinesHomeTabStorageListItem>
      get copyWith => __$TimelinesHomeTabStorageListItemCopyWithImpl<
          _TimelinesHomeTabStorageListItem>(this, _$identity);
}

abstract class _TimelinesHomeTabStorageListItem
    implements TimelinesHomeTabStorageListItem {
  const factory _TimelinesHomeTabStorageListItem(
      {required Timeline timeline,
      required Key key}) = _$_TimelinesHomeTabStorageListItem;

  @override
  Timeline get timeline;
  @override
  Key get key;
  @override
  @JsonKey(ignore: true)
  _$TimelinesHomeTabStorageListItemCopyWith<_TimelinesHomeTabStorageListItem>
      get copyWith => throw _privateConstructorUsedError;
}

TimelinesHomeTabStorage _$TimelinesHomeTabStorageFromJson(
    Map<String, dynamic> json) {
  return _TimelinesHomeTabStorage.fromJson(json);
}

/// @nodoc
class _$TimelinesHomeTabStorageTearOff {
  const _$TimelinesHomeTabStorageTearOff();

  _TimelinesHomeTabStorage call(
      {@HiveField(0)
      @JsonKey(name: 'timeline_ids')
          required List<String> timelineIds}) {
    return _TimelinesHomeTabStorage(
      timelineIds: timelineIds,
    );
  }

  TimelinesHomeTabStorage fromJson(Map<String, Object?> json) {
    return TimelinesHomeTabStorage.fromJson(json);
  }
}

/// @nodoc
const $TimelinesHomeTabStorage = _$TimelinesHomeTabStorageTearOff();

/// @nodoc
mixin _$TimelinesHomeTabStorage {
  @HiveField(0)
  @JsonKey(name: 'timeline_ids')
  List<String> get timelineIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimelinesHomeTabStorageCopyWith<TimelinesHomeTabStorage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelinesHomeTabStorageCopyWith<$Res> {
  factory $TimelinesHomeTabStorageCopyWith(TimelinesHomeTabStorage value,
          $Res Function(TimelinesHomeTabStorage) then) =
      _$TimelinesHomeTabStorageCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) @JsonKey(name: 'timeline_ids') List<String> timelineIds});
}

/// @nodoc
class _$TimelinesHomeTabStorageCopyWithImpl<$Res>
    implements $TimelinesHomeTabStorageCopyWith<$Res> {
  _$TimelinesHomeTabStorageCopyWithImpl(this._value, this._then);

  final TimelinesHomeTabStorage _value;
  // ignore: unused_field
  final $Res Function(TimelinesHomeTabStorage) _then;

  @override
  $Res call({
    Object? timelineIds = freezed,
  }) {
    return _then(_value.copyWith(
      timelineIds: timelineIds == freezed
          ? _value.timelineIds
          : timelineIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$TimelinesHomeTabStorageCopyWith<$Res>
    implements $TimelinesHomeTabStorageCopyWith<$Res> {
  factory _$TimelinesHomeTabStorageCopyWith(_TimelinesHomeTabStorage value,
          $Res Function(_TimelinesHomeTabStorage) then) =
      __$TimelinesHomeTabStorageCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) @JsonKey(name: 'timeline_ids') List<String> timelineIds});
}

/// @nodoc
class __$TimelinesHomeTabStorageCopyWithImpl<$Res>
    extends _$TimelinesHomeTabStorageCopyWithImpl<$Res>
    implements _$TimelinesHomeTabStorageCopyWith<$Res> {
  __$TimelinesHomeTabStorageCopyWithImpl(_TimelinesHomeTabStorage _value,
      $Res Function(_TimelinesHomeTabStorage) _then)
      : super(_value, (v) => _then(v as _TimelinesHomeTabStorage));

  @override
  _TimelinesHomeTabStorage get _value =>
      super._value as _TimelinesHomeTabStorage;

  @override
  $Res call({
    Object? timelineIds = freezed,
  }) {
    return _then(_TimelinesHomeTabStorage(
      timelineIds: timelineIds == freezed
          ? _value.timelineIds
          : timelineIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimelinesHomeTabStorage
    with DiagnosticableTreeMixin
    implements _TimelinesHomeTabStorage {
  const _$_TimelinesHomeTabStorage(
      {@HiveField(0) @JsonKey(name: 'timeline_ids') required this.timelineIds});

  factory _$_TimelinesHomeTabStorage.fromJson(Map<String, dynamic> json) =>
      _$$_TimelinesHomeTabStorageFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'timeline_ids')
  final List<String> timelineIds;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimelinesHomeTabStorage(timelineIds: $timelineIds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimelinesHomeTabStorage'))
      ..add(DiagnosticsProperty('timelineIds', timelineIds));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimelinesHomeTabStorage &&
            const DeepCollectionEquality()
                .equals(other.timelineIds, timelineIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(timelineIds));

  @JsonKey(ignore: true)
  @override
  _$TimelinesHomeTabStorageCopyWith<_TimelinesHomeTabStorage> get copyWith =>
      __$TimelinesHomeTabStorageCopyWithImpl<_TimelinesHomeTabStorage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimelinesHomeTabStorageToJson(this);
  }
}

abstract class _TimelinesHomeTabStorage implements TimelinesHomeTabStorage {
  const factory _TimelinesHomeTabStorage(
      {@HiveField(0)
      @JsonKey(name: 'timeline_ids')
          required List<String> timelineIds}) = _$_TimelinesHomeTabStorage;

  factory _TimelinesHomeTabStorage.fromJson(Map<String, dynamic> json) =
      _$_TimelinesHomeTabStorage.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'timeline_ids')
  List<String> get timelineIds;
  @override
  @JsonKey(ignore: true)
  _$TimelinesHomeTabStorageCopyWith<_TimelinesHomeTabStorage> get copyWith =>
      throw _privateConstructorUsedError;
}
