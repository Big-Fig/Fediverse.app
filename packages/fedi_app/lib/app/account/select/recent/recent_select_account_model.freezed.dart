// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recent_select_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecentSelectAccountList _$RecentSelectAccountListFromJson(
    Map<String, dynamic> json) {
  return _RecentSelectAccountList.fromJson(json);
}

/// @nodoc
class _$RecentSelectAccountListTearOff {
  const _$RecentSelectAccountListTearOff();

  _RecentSelectAccountList call(
      {@JsonKey(name: 'recentItems')
      @HiveField(0)
          required List<UnifediApiAccount>? recentItems}) {
    return _RecentSelectAccountList(
      recentItems: recentItems,
    );
  }

  RecentSelectAccountList fromJson(Map<String, Object> json) {
    return RecentSelectAccountList.fromJson(json);
  }
}

/// @nodoc
const $RecentSelectAccountList = _$RecentSelectAccountListTearOff();

/// @nodoc
mixin _$RecentSelectAccountList {
  @JsonKey(name: 'recentItems')
  @HiveField(0)
  List<UnifediApiAccount>? get recentItems =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentSelectAccountListCopyWith<RecentSelectAccountList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentSelectAccountListCopyWith<$Res> {
  factory $RecentSelectAccountListCopyWith(RecentSelectAccountList value,
          $Res Function(RecentSelectAccountList) then) =
      _$RecentSelectAccountListCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'recentItems')
      @HiveField(0)
          List<UnifediApiAccount>? recentItems});
}

/// @nodoc
class _$RecentSelectAccountListCopyWithImpl<$Res>
    implements $RecentSelectAccountListCopyWith<$Res> {
  _$RecentSelectAccountListCopyWithImpl(this._value, this._then);

  final RecentSelectAccountList _value;
  // ignore: unused_field
  final $Res Function(RecentSelectAccountList) _then;

  @override
  $Res call({
    Object? recentItems = freezed,
  }) {
    return _then(_value.copyWith(
      recentItems: recentItems == freezed
          ? _value.recentItems
          : recentItems // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiAccount>?,
    ));
  }
}

/// @nodoc
abstract class _$RecentSelectAccountListCopyWith<$Res>
    implements $RecentSelectAccountListCopyWith<$Res> {
  factory _$RecentSelectAccountListCopyWith(_RecentSelectAccountList value,
          $Res Function(_RecentSelectAccountList) then) =
      __$RecentSelectAccountListCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'recentItems')
      @HiveField(0)
          List<UnifediApiAccount>? recentItems});
}

/// @nodoc
class __$RecentSelectAccountListCopyWithImpl<$Res>
    extends _$RecentSelectAccountListCopyWithImpl<$Res>
    implements _$RecentSelectAccountListCopyWith<$Res> {
  __$RecentSelectAccountListCopyWithImpl(_RecentSelectAccountList _value,
      $Res Function(_RecentSelectAccountList) _then)
      : super(_value, (v) => _then(v as _RecentSelectAccountList));

  @override
  _RecentSelectAccountList get _value =>
      super._value as _RecentSelectAccountList;

  @override
  $Res call({
    Object? recentItems = freezed,
  }) {
    return _then(_RecentSelectAccountList(
      recentItems: recentItems == freezed
          ? _value.recentItems
          : recentItems // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiAccount>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecentSelectAccountList implements _RecentSelectAccountList {
  const _$_RecentSelectAccountList(
      {@JsonKey(name: 'recentItems') @HiveField(0) required this.recentItems});

  factory _$_RecentSelectAccountList.fromJson(Map<String, dynamic> json) =>
      _$$_RecentSelectAccountListFromJson(json);

  @override
  @JsonKey(name: 'recentItems')
  @HiveField(0)
  final List<UnifediApiAccount>? recentItems;

  @override
  String toString() {
    return 'RecentSelectAccountList(recentItems: $recentItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RecentSelectAccountList &&
            (identical(other.recentItems, recentItems) ||
                const DeepCollectionEquality()
                    .equals(other.recentItems, recentItems)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(recentItems);

  @JsonKey(ignore: true)
  @override
  _$RecentSelectAccountListCopyWith<_RecentSelectAccountList> get copyWith =>
      __$RecentSelectAccountListCopyWithImpl<_RecentSelectAccountList>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecentSelectAccountListToJson(this);
  }
}

abstract class _RecentSelectAccountList implements RecentSelectAccountList {
  const factory _RecentSelectAccountList(
          {@JsonKey(name: 'recentItems')
          @HiveField(0)
              required List<UnifediApiAccount>? recentItems}) =
      _$_RecentSelectAccountList;

  factory _RecentSelectAccountList.fromJson(Map<String, dynamic> json) =
      _$_RecentSelectAccountList.fromJson;

  @override
  @JsonKey(name: 'recentItems')
  @HiveField(0)
  List<UnifediApiAccount>? get recentItems =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RecentSelectAccountListCopyWith<_RecentSelectAccountList> get copyWith =>
      throw _privateConstructorUsedError;
}
