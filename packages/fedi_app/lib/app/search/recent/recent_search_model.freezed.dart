// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recent_search_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecentSearchList _$RecentSearchListFromJson(Map<String, dynamic> json) {
  return _RecentSearchList.fromJson(json);
}

/// @nodoc
class _$RecentSearchListTearOff {
  const _$RecentSearchListTearOff();

  _RecentSearchList call(
      {@JsonKey(name: 'recentItems')
      @HiveField(0)
          required List<String> recentItems}) {
    return _RecentSearchList(
      recentItems: recentItems,
    );
  }

  RecentSearchList fromJson(Map<String, Object?> json) {
    return RecentSearchList.fromJson(json);
  }
}

/// @nodoc
const $RecentSearchList = _$RecentSearchListTearOff();

/// @nodoc
mixin _$RecentSearchList {
  @JsonKey(name: 'recentItems')
  @HiveField(0)
  List<String> get recentItems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentSearchListCopyWith<RecentSearchList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentSearchListCopyWith<$Res> {
  factory $RecentSearchListCopyWith(
          RecentSearchList value, $Res Function(RecentSearchList) then) =
      _$RecentSearchListCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'recentItems') @HiveField(0) List<String> recentItems});
}

/// @nodoc
class _$RecentSearchListCopyWithImpl<$Res>
    implements $RecentSearchListCopyWith<$Res> {
  _$RecentSearchListCopyWithImpl(this._value, this._then);

  final RecentSearchList _value;
  // ignore: unused_field
  final $Res Function(RecentSearchList) _then;

  @override
  $Res call({
    Object? recentItems = freezed,
  }) {
    return _then(_value.copyWith(
      recentItems: recentItems == freezed
          ? _value.recentItems
          : recentItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$RecentSearchListCopyWith<$Res>
    implements $RecentSearchListCopyWith<$Res> {
  factory _$RecentSearchListCopyWith(
          _RecentSearchList value, $Res Function(_RecentSearchList) then) =
      __$RecentSearchListCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'recentItems') @HiveField(0) List<String> recentItems});
}

/// @nodoc
class __$RecentSearchListCopyWithImpl<$Res>
    extends _$RecentSearchListCopyWithImpl<$Res>
    implements _$RecentSearchListCopyWith<$Res> {
  __$RecentSearchListCopyWithImpl(
      _RecentSearchList _value, $Res Function(_RecentSearchList) _then)
      : super(_value, (v) => _then(v as _RecentSearchList));

  @override
  _RecentSearchList get _value => super._value as _RecentSearchList;

  @override
  $Res call({
    Object? recentItems = freezed,
  }) {
    return _then(_RecentSearchList(
      recentItems: recentItems == freezed
          ? _value.recentItems
          : recentItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecentSearchList
    with DiagnosticableTreeMixin
    implements _RecentSearchList {
  const _$_RecentSearchList(
      {@JsonKey(name: 'recentItems') @HiveField(0) required this.recentItems});

  factory _$_RecentSearchList.fromJson(Map<String, dynamic> json) =>
      _$$_RecentSearchListFromJson(json);

  @override
  @JsonKey(name: 'recentItems')
  @HiveField(0)
  final List<String> recentItems;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecentSearchList(recentItems: $recentItems)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecentSearchList'))
      ..add(DiagnosticsProperty('recentItems', recentItems));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecentSearchList &&
            const DeepCollectionEquality()
                .equals(other.recentItems, recentItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(recentItems));

  @JsonKey(ignore: true)
  @override
  _$RecentSearchListCopyWith<_RecentSearchList> get copyWith =>
      __$RecentSearchListCopyWithImpl<_RecentSearchList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecentSearchListToJson(this);
  }
}

abstract class _RecentSearchList implements RecentSearchList {
  const factory _RecentSearchList(
      {@JsonKey(name: 'recentItems')
      @HiveField(0)
          required List<String> recentItems}) = _$_RecentSearchList;

  factory _RecentSearchList.fromJson(Map<String, dynamic> json) =
      _$_RecentSearchList.fromJson;

  @override
  @JsonKey(name: 'recentItems')
  @HiveField(0)
  List<String> get recentItems;
  @override
  @JsonKey(ignore: true)
  _$RecentSearchListCopyWith<_RecentSearchList> get copyWith =>
      throw _privateConstructorUsedError;
}
