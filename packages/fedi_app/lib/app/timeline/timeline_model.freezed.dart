// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'timeline_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Timeline _$TimelineFromJson(Map<String, dynamic> json) {
  return _Timeline.fromJson(json);
}

/// @nodoc
class _$TimelineTearOff {
  const _$TimelineTearOff();

  _Timeline call(
      {@HiveField(0)
          required String id,
      @HiveField(1)
          required String? label,
      @HiveField(2)
      @JsonKey(name: 'is_possible_to_delete')
          required bool isPossibleToDelete,
      @HiveField(3)
      @JsonKey(name: 'type_string')
          required String typeString,
      @HiveField(4)
          required TimelineSettings settings}) {
    return _Timeline(
      id: id,
      label: label,
      isPossibleToDelete: isPossibleToDelete,
      typeString: typeString,
      settings: settings,
    );
  }

  Timeline fromJson(Map<String, Object> json) {
    return Timeline.fromJson(json);
  }
}

/// @nodoc
const $Timeline = _$TimelineTearOff();

/// @nodoc
mixin _$Timeline {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get label => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'is_possible_to_delete')
  bool get isPossibleToDelete => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'type_string')
  String get typeString => throw _privateConstructorUsedError;
  @HiveField(4)
  TimelineSettings get settings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimelineCopyWith<Timeline> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineCopyWith<$Res> {
  factory $TimelineCopyWith(Timeline value, $Res Function(Timeline) then) =
      _$TimelineCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          String id,
      @HiveField(1)
          String? label,
      @HiveField(2)
      @JsonKey(name: 'is_possible_to_delete')
          bool isPossibleToDelete,
      @HiveField(3)
      @JsonKey(name: 'type_string')
          String typeString,
      @HiveField(4)
          TimelineSettings settings});

  $TimelineSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$TimelineCopyWithImpl<$Res> implements $TimelineCopyWith<$Res> {
  _$TimelineCopyWithImpl(this._value, this._then);

  final Timeline _value;
  // ignore: unused_field
  final $Res Function(Timeline) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? isPossibleToDelete = freezed,
    Object? typeString = freezed,
    Object? settings = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      isPossibleToDelete: isPossibleToDelete == freezed
          ? _value.isPossibleToDelete
          : isPossibleToDelete // ignore: cast_nullable_to_non_nullable
              as bool,
      typeString: typeString == freezed
          ? _value.typeString
          : typeString // ignore: cast_nullable_to_non_nullable
              as String,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as TimelineSettings,
    ));
  }

  @override
  $TimelineSettingsCopyWith<$Res> get settings {
    return $TimelineSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value));
    });
  }
}

/// @nodoc
abstract class _$TimelineCopyWith<$Res> implements $TimelineCopyWith<$Res> {
  factory _$TimelineCopyWith(_Timeline value, $Res Function(_Timeline) then) =
      __$TimelineCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          String id,
      @HiveField(1)
          String? label,
      @HiveField(2)
      @JsonKey(name: 'is_possible_to_delete')
          bool isPossibleToDelete,
      @HiveField(3)
      @JsonKey(name: 'type_string')
          String typeString,
      @HiveField(4)
          TimelineSettings settings});

  @override
  $TimelineSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$TimelineCopyWithImpl<$Res> extends _$TimelineCopyWithImpl<$Res>
    implements _$TimelineCopyWith<$Res> {
  __$TimelineCopyWithImpl(_Timeline _value, $Res Function(_Timeline) _then)
      : super(_value, (v) => _then(v as _Timeline));

  @override
  _Timeline get _value => super._value as _Timeline;

  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? isPossibleToDelete = freezed,
    Object? typeString = freezed,
    Object? settings = freezed,
  }) {
    return _then(_Timeline(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      isPossibleToDelete: isPossibleToDelete == freezed
          ? _value.isPossibleToDelete
          : isPossibleToDelete // ignore: cast_nullable_to_non_nullable
              as bool,
      typeString: typeString == freezed
          ? _value.typeString
          : typeString // ignore: cast_nullable_to_non_nullable
              as String,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as TimelineSettings,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Timeline extends _Timeline {
  const _$_Timeline(
      {@HiveField(0)
          required this.id,
      @HiveField(1)
          required this.label,
      @HiveField(2)
      @JsonKey(name: 'is_possible_to_delete')
          required this.isPossibleToDelete,
      @HiveField(3)
      @JsonKey(name: 'type_string')
          required this.typeString,
      @HiveField(4)
          required this.settings})
      : super._();

  factory _$_Timeline.fromJson(Map<String, dynamic> json) =>
      _$$_TimelineFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String? label;
  @override
  @HiveField(2)
  @JsonKey(name: 'is_possible_to_delete')
  final bool isPossibleToDelete;
  @override
  @HiveField(3)
  @JsonKey(name: 'type_string')
  final String typeString;
  @override
  @HiveField(4)
  final TimelineSettings settings;

  @override
  String toString() {
    return 'Timeline(id: $id, label: $label, isPossibleToDelete: $isPossibleToDelete, typeString: $typeString, settings: $settings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Timeline &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.isPossibleToDelete, isPossibleToDelete) ||
                const DeepCollectionEquality()
                    .equals(other.isPossibleToDelete, isPossibleToDelete)) &&
            (identical(other.typeString, typeString) ||
                const DeepCollectionEquality()
                    .equals(other.typeString, typeString)) &&
            (identical(other.settings, settings) ||
                const DeepCollectionEquality()
                    .equals(other.settings, settings)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(isPossibleToDelete) ^
      const DeepCollectionEquality().hash(typeString) ^
      const DeepCollectionEquality().hash(settings);

  @JsonKey(ignore: true)
  @override
  _$TimelineCopyWith<_Timeline> get copyWith =>
      __$TimelineCopyWithImpl<_Timeline>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimelineToJson(this);
  }
}

abstract class _Timeline extends Timeline {
  const factory _Timeline(
      {@HiveField(0)
          required String id,
      @HiveField(1)
          required String? label,
      @HiveField(2)
      @JsonKey(name: 'is_possible_to_delete')
          required bool isPossibleToDelete,
      @HiveField(3)
      @JsonKey(name: 'type_string')
          required String typeString,
      @HiveField(4)
          required TimelineSettings settings}) = _$_Timeline;
  const _Timeline._() : super._();

  factory _Timeline.fromJson(Map<String, dynamic> json) = _$_Timeline.fromJson;

  @override
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String? get label => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'is_possible_to_delete')
  bool get isPossibleToDelete => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  @JsonKey(name: 'type_string')
  String get typeString => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  TimelineSettings get settings => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TimelineCopyWith<_Timeline> get copyWith =>
      throw _privateConstructorUsedError;
}
