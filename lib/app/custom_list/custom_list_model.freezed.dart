// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'custom_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CustomListTearOff {
  const _$CustomListTearOff();

  _CustomList call({required String remoteId, required String title}) {
    return _CustomList(
      remoteId: remoteId,
      title: title,
    );
  }
}

/// @nodoc
const $CustomList = _$CustomListTearOff();

/// @nodoc
mixin _$CustomList {
  String get remoteId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomListCopyWith<CustomList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomListCopyWith<$Res> {
  factory $CustomListCopyWith(
          CustomList value, $Res Function(CustomList) then) =
      _$CustomListCopyWithImpl<$Res>;
  $Res call({String remoteId, String title});
}

/// @nodoc
class _$CustomListCopyWithImpl<$Res> implements $CustomListCopyWith<$Res> {
  _$CustomListCopyWithImpl(this._value, this._then);

  final CustomList _value;
  // ignore: unused_field
  final $Res Function(CustomList) _then;

  @override
  $Res call({
    Object? remoteId = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      remoteId: remoteId == freezed
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CustomListCopyWith<$Res> implements $CustomListCopyWith<$Res> {
  factory _$CustomListCopyWith(
          _CustomList value, $Res Function(_CustomList) then) =
      __$CustomListCopyWithImpl<$Res>;
  @override
  $Res call({String remoteId, String title});
}

/// @nodoc
class __$CustomListCopyWithImpl<$Res> extends _$CustomListCopyWithImpl<$Res>
    implements _$CustomListCopyWith<$Res> {
  __$CustomListCopyWithImpl(
      _CustomList _value, $Res Function(_CustomList) _then)
      : super(_value, (v) => _then(v as _CustomList));

  @override
  _CustomList get _value => super._value as _CustomList;

  @override
  $Res call({
    Object? remoteId = freezed,
    Object? title = freezed,
  }) {
    return _then(_CustomList(
      remoteId: remoteId == freezed
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CustomList implements _CustomList {
  const _$_CustomList({required this.remoteId, required this.title});

  @override
  final String remoteId;
  @override
  final String title;

  @override
  String toString() {
    return 'CustomList(remoteId: $remoteId, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CustomList &&
            (identical(other.remoteId, remoteId) ||
                const DeepCollectionEquality()
                    .equals(other.remoteId, remoteId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(remoteId) ^
      const DeepCollectionEquality().hash(title);

  @JsonKey(ignore: true)
  @override
  _$CustomListCopyWith<_CustomList> get copyWith =>
      __$CustomListCopyWithImpl<_CustomList>(this, _$identity);
}

abstract class _CustomList implements CustomList {
  const factory _CustomList({required String remoteId, required String title}) =
      _$_CustomList;

  @override
  String get remoteId => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CustomListCopyWith<_CustomList> get copyWith =>
      throw _privateConstructorUsedError;
}
