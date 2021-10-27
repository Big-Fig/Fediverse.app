// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'filter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FilterStateTearOff {
  const _$FilterStateTearOff();

  _FilterState call({required bool? dismissed, required bool? unread}) {
    return _FilterState(
      dismissed: dismissed,
      unread: unread,
    );
  }
}

/// @nodoc
const $FilterState = _$FilterStateTearOff();

/// @nodoc
mixin _$FilterState {
  bool? get dismissed => throw _privateConstructorUsedError;
  bool? get unread => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterStateCopyWith<FilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterStateCopyWith<$Res> {
  factory $FilterStateCopyWith(
          FilterState value, $Res Function(FilterState) then) =
      _$FilterStateCopyWithImpl<$Res>;
  $Res call({bool? dismissed, bool? unread});
}

/// @nodoc
class _$FilterStateCopyWithImpl<$Res> implements $FilterStateCopyWith<$Res> {
  _$FilterStateCopyWithImpl(this._value, this._then);

  final FilterState _value;
  // ignore: unused_field
  final $Res Function(FilterState) _then;

  @override
  $Res call({
    Object? dismissed = freezed,
    Object? unread = freezed,
  }) {
    return _then(_value.copyWith(
      dismissed: dismissed == freezed
          ? _value.dismissed
          : dismissed // ignore: cast_nullable_to_non_nullable
              as bool?,
      unread: unread == freezed
          ? _value.unread
          : unread // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$FilterStateCopyWith<$Res>
    implements $FilterStateCopyWith<$Res> {
  factory _$FilterStateCopyWith(
          _FilterState value, $Res Function(_FilterState) then) =
      __$FilterStateCopyWithImpl<$Res>;
  @override
  $Res call({bool? dismissed, bool? unread});
}

/// @nodoc
class __$FilterStateCopyWithImpl<$Res> extends _$FilterStateCopyWithImpl<$Res>
    implements _$FilterStateCopyWith<$Res> {
  __$FilterStateCopyWithImpl(
      _FilterState _value, $Res Function(_FilterState) _then)
      : super(_value, (v) => _then(v as _FilterState));

  @override
  _FilterState get _value => super._value as _FilterState;

  @override
  $Res call({
    Object? dismissed = freezed,
    Object? unread = freezed,
  }) {
    return _then(_FilterState(
      dismissed: dismissed == freezed
          ? _value.dismissed
          : dismissed // ignore: cast_nullable_to_non_nullable
              as bool?,
      unread: unread == freezed
          ? _value.unread
          : unread // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_FilterState implements _FilterState {
  const _$_FilterState({required this.dismissed, required this.unread});

  @override
  final bool? dismissed;
  @override
  final bool? unread;

  @override
  String toString() {
    return 'FilterState(dismissed: $dismissed, unread: $unread)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FilterState &&
            (identical(other.dismissed, dismissed) ||
                other.dismissed == dismissed) &&
            (identical(other.unread, unread) || other.unread == unread));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dismissed, unread);

  @JsonKey(ignore: true)
  @override
  _$FilterStateCopyWith<_FilterState> get copyWith =>
      __$FilterStateCopyWithImpl<_FilterState>(this, _$identity);
}

abstract class _FilterState implements FilterState {
  const factory _FilterState(
      {required bool? dismissed, required bool? unread}) = _$_FilterState;

  @override
  bool? get dismissed;
  @override
  bool? get unread;
  @override
  @JsonKey(ignore: true)
  _$FilterStateCopyWith<_FilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$DbFilterPopulatedWrapperTearOff {
  const _$DbFilterPopulatedWrapperTearOff();

  _DbFilterPopulatedWrapper call(
      {required DbFilterPopulated dbFilterPopulated}) {
    return _DbFilterPopulatedWrapper(
      dbFilterPopulated: dbFilterPopulated,
    );
  }
}

/// @nodoc
const $DbFilterPopulatedWrapper = _$DbFilterPopulatedWrapperTearOff();

/// @nodoc
mixin _$DbFilterPopulatedWrapper {
  DbFilterPopulated get dbFilterPopulated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DbFilterPopulatedWrapperCopyWith<DbFilterPopulatedWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DbFilterPopulatedWrapperCopyWith<$Res> {
  factory $DbFilterPopulatedWrapperCopyWith(DbFilterPopulatedWrapper value,
          $Res Function(DbFilterPopulatedWrapper) then) =
      _$DbFilterPopulatedWrapperCopyWithImpl<$Res>;
  $Res call({DbFilterPopulated dbFilterPopulated});

  $DbFilterPopulatedCopyWith<$Res> get dbFilterPopulated;
}

/// @nodoc
class _$DbFilterPopulatedWrapperCopyWithImpl<$Res>
    implements $DbFilterPopulatedWrapperCopyWith<$Res> {
  _$DbFilterPopulatedWrapperCopyWithImpl(this._value, this._then);

  final DbFilterPopulatedWrapper _value;
  // ignore: unused_field
  final $Res Function(DbFilterPopulatedWrapper) _then;

  @override
  $Res call({
    Object? dbFilterPopulated = freezed,
  }) {
    return _then(_value.copyWith(
      dbFilterPopulated: dbFilterPopulated == freezed
          ? _value.dbFilterPopulated
          : dbFilterPopulated // ignore: cast_nullable_to_non_nullable
              as DbFilterPopulated,
    ));
  }

  @override
  $DbFilterPopulatedCopyWith<$Res> get dbFilterPopulated {
    return $DbFilterPopulatedCopyWith<$Res>(_value.dbFilterPopulated, (value) {
      return _then(_value.copyWith(dbFilterPopulated: value));
    });
  }
}

/// @nodoc
abstract class _$DbFilterPopulatedWrapperCopyWith<$Res>
    implements $DbFilterPopulatedWrapperCopyWith<$Res> {
  factory _$DbFilterPopulatedWrapperCopyWith(_DbFilterPopulatedWrapper value,
          $Res Function(_DbFilterPopulatedWrapper) then) =
      __$DbFilterPopulatedWrapperCopyWithImpl<$Res>;
  @override
  $Res call({DbFilterPopulated dbFilterPopulated});

  @override
  $DbFilterPopulatedCopyWith<$Res> get dbFilterPopulated;
}

/// @nodoc
class __$DbFilterPopulatedWrapperCopyWithImpl<$Res>
    extends _$DbFilterPopulatedWrapperCopyWithImpl<$Res>
    implements _$DbFilterPopulatedWrapperCopyWith<$Res> {
  __$DbFilterPopulatedWrapperCopyWithImpl(_DbFilterPopulatedWrapper _value,
      $Res Function(_DbFilterPopulatedWrapper) _then)
      : super(_value, (v) => _then(v as _DbFilterPopulatedWrapper));

  @override
  _DbFilterPopulatedWrapper get _value =>
      super._value as _DbFilterPopulatedWrapper;

  @override
  $Res call({
    Object? dbFilterPopulated = freezed,
  }) {
    return _then(_DbFilterPopulatedWrapper(
      dbFilterPopulated: dbFilterPopulated == freezed
          ? _value.dbFilterPopulated
          : dbFilterPopulated // ignore: cast_nullable_to_non_nullable
              as DbFilterPopulated,
    ));
  }
}

/// @nodoc

class _$_DbFilterPopulatedWrapper extends _DbFilterPopulatedWrapper {
  const _$_DbFilterPopulatedWrapper({required this.dbFilterPopulated})
      : super._();

  @override
  final DbFilterPopulated dbFilterPopulated;

  @override
  String toString() {
    return 'DbFilterPopulatedWrapper(dbFilterPopulated: $dbFilterPopulated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DbFilterPopulatedWrapper &&
            (identical(other.dbFilterPopulated, dbFilterPopulated) ||
                other.dbFilterPopulated == dbFilterPopulated));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dbFilterPopulated);

  @JsonKey(ignore: true)
  @override
  _$DbFilterPopulatedWrapperCopyWith<_DbFilterPopulatedWrapper> get copyWith =>
      __$DbFilterPopulatedWrapperCopyWithImpl<_DbFilterPopulatedWrapper>(
          this, _$identity);
}

abstract class _DbFilterPopulatedWrapper extends DbFilterPopulatedWrapper {
  const factory _DbFilterPopulatedWrapper(
          {required DbFilterPopulated dbFilterPopulated}) =
      _$_DbFilterPopulatedWrapper;
  const _DbFilterPopulatedWrapper._() : super._();

  @override
  DbFilterPopulated get dbFilterPopulated;
  @override
  @JsonKey(ignore: true)
  _$DbFilterPopulatedWrapperCopyWith<_DbFilterPopulatedWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$DbFilterPopulatedTearOff {
  const _$DbFilterPopulatedTearOff();

  _DbFilterPopulated call({required DbFilter dbFilter}) {
    return _DbFilterPopulated(
      dbFilter: dbFilter,
    );
  }
}

/// @nodoc
const $DbFilterPopulated = _$DbFilterPopulatedTearOff();

/// @nodoc
mixin _$DbFilterPopulated {
  DbFilter get dbFilter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DbFilterPopulatedCopyWith<DbFilterPopulated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DbFilterPopulatedCopyWith<$Res> {
  factory $DbFilterPopulatedCopyWith(
          DbFilterPopulated value, $Res Function(DbFilterPopulated) then) =
      _$DbFilterPopulatedCopyWithImpl<$Res>;
  $Res call({DbFilter dbFilter});
}

/// @nodoc
class _$DbFilterPopulatedCopyWithImpl<$Res>
    implements $DbFilterPopulatedCopyWith<$Res> {
  _$DbFilterPopulatedCopyWithImpl(this._value, this._then);

  final DbFilterPopulated _value;
  // ignore: unused_field
  final $Res Function(DbFilterPopulated) _then;

  @override
  $Res call({
    Object? dbFilter = freezed,
  }) {
    return _then(_value.copyWith(
      dbFilter: dbFilter == freezed
          ? _value.dbFilter
          : dbFilter // ignore: cast_nullable_to_non_nullable
              as DbFilter,
    ));
  }
}

/// @nodoc
abstract class _$DbFilterPopulatedCopyWith<$Res>
    implements $DbFilterPopulatedCopyWith<$Res> {
  factory _$DbFilterPopulatedCopyWith(
          _DbFilterPopulated value, $Res Function(_DbFilterPopulated) then) =
      __$DbFilterPopulatedCopyWithImpl<$Res>;
  @override
  $Res call({DbFilter dbFilter});
}

/// @nodoc
class __$DbFilterPopulatedCopyWithImpl<$Res>
    extends _$DbFilterPopulatedCopyWithImpl<$Res>
    implements _$DbFilterPopulatedCopyWith<$Res> {
  __$DbFilterPopulatedCopyWithImpl(
      _DbFilterPopulated _value, $Res Function(_DbFilterPopulated) _then)
      : super(_value, (v) => _then(v as _DbFilterPopulated));

  @override
  _DbFilterPopulated get _value => super._value as _DbFilterPopulated;

  @override
  $Res call({
    Object? dbFilter = freezed,
  }) {
    return _then(_DbFilterPopulated(
      dbFilter: dbFilter == freezed
          ? _value.dbFilter
          : dbFilter // ignore: cast_nullable_to_non_nullable
              as DbFilter,
    ));
  }
}

/// @nodoc

class _$_DbFilterPopulated extends _DbFilterPopulated {
  const _$_DbFilterPopulated({required this.dbFilter}) : super._();

  @override
  final DbFilter dbFilter;

  @override
  String toString() {
    return 'DbFilterPopulated(dbFilter: $dbFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DbFilterPopulated &&
            const DeepCollectionEquality().equals(other.dbFilter, dbFilter));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(dbFilter));

  @JsonKey(ignore: true)
  @override
  _$DbFilterPopulatedCopyWith<_DbFilterPopulated> get copyWith =>
      __$DbFilterPopulatedCopyWithImpl<_DbFilterPopulated>(this, _$identity);
}

abstract class _DbFilterPopulated extends DbFilterPopulated {
  const factory _DbFilterPopulated({required DbFilter dbFilter}) =
      _$_DbFilterPopulated;
  const _DbFilterPopulated._() : super._();

  @override
  DbFilter get dbFilter;
  @override
  @JsonKey(ignore: true)
  _$DbFilterPopulatedCopyWith<_DbFilterPopulated> get copyWith =>
      throw _privateConstructorUsedError;
}
