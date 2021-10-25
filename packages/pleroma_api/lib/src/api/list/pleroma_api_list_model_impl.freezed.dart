// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_list_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiList _$PleromaApiListFromJson(Map<String, dynamic> json) {
  return _PleromaApiList.fromJson(json);
}

/// @nodoc
class _$PleromaApiListTearOff {
  const _$PleromaApiListTearOff();

  _PleromaApiList call(
      {@HiveField(0)
          required String id,
      @HiveField(1)
          required String title,
      @JsonKey(name: 'replies_policy')
      @HiveField(2)
          required String? repliesPolicy}) {
    return _PleromaApiList(
      id: id,
      title: title,
      repliesPolicy: repliesPolicy,
    );
  }

  PleromaApiList fromJson(Map<String, Object> json) {
    return PleromaApiList.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiList = _$PleromaApiListTearOff();

/// @nodoc
mixin _$PleromaApiList {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'replies_policy')
  @HiveField(2)
  String? get repliesPolicy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiListCopyWith<PleromaApiList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiListCopyWith<$Res> {
  factory $PleromaApiListCopyWith(
          PleromaApiList value, $Res Function(PleromaApiList) then) =
      _$PleromaApiListCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @JsonKey(name: 'replies_policy') @HiveField(2) String? repliesPolicy});
}

/// @nodoc
class _$PleromaApiListCopyWithImpl<$Res>
    implements $PleromaApiListCopyWith<$Res> {
  _$PleromaApiListCopyWithImpl(this._value, this._then);

  final PleromaApiList _value;
  // ignore: unused_field
  final $Res Function(PleromaApiList) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? repliesPolicy = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      repliesPolicy: repliesPolicy == freezed
          ? _value.repliesPolicy
          : repliesPolicy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiListCopyWith<$Res>
    implements $PleromaApiListCopyWith<$Res> {
  factory _$PleromaApiListCopyWith(
          _PleromaApiList value, $Res Function(_PleromaApiList) then) =
      __$PleromaApiListCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @JsonKey(name: 'replies_policy') @HiveField(2) String? repliesPolicy});
}

/// @nodoc
class __$PleromaApiListCopyWithImpl<$Res>
    extends _$PleromaApiListCopyWithImpl<$Res>
    implements _$PleromaApiListCopyWith<$Res> {
  __$PleromaApiListCopyWithImpl(
      _PleromaApiList _value, $Res Function(_PleromaApiList) _then)
      : super(_value, (v) => _then(v as _PleromaApiList));

  @override
  _PleromaApiList get _value => super._value as _PleromaApiList;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? repliesPolicy = freezed,
  }) {
    return _then(_PleromaApiList(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      repliesPolicy: repliesPolicy == freezed
          ? _value.repliesPolicy
          : repliesPolicy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiList implements _PleromaApiList {
  const _$_PleromaApiList(
      {@HiveField(0)
          required this.id,
      @HiveField(1)
          required this.title,
      @JsonKey(name: 'replies_policy')
      @HiveField(2)
          required this.repliesPolicy});

  factory _$_PleromaApiList.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiListFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String title;
  @override
  @JsonKey(name: 'replies_policy')
  @HiveField(2)
  final String? repliesPolicy;

  @override
  String toString() {
    return 'PleromaApiList(id: $id, title: $title, repliesPolicy: $repliesPolicy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiList &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.repliesPolicy, repliesPolicy) ||
                const DeepCollectionEquality()
                    .equals(other.repliesPolicy, repliesPolicy)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(repliesPolicy);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiListCopyWith<_PleromaApiList> get copyWith =>
      __$PleromaApiListCopyWithImpl<_PleromaApiList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiListToJson(this);
  }
}

abstract class _PleromaApiList implements PleromaApiList {
  const factory _PleromaApiList(
      {@HiveField(0)
          required String id,
      @HiveField(1)
          required String title,
      @JsonKey(name: 'replies_policy')
      @HiveField(2)
          required String? repliesPolicy}) = _$_PleromaApiList;

  factory _PleromaApiList.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiList.fromJson;

  @override
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'replies_policy')
  @HiveField(2)
  String? get repliesPolicy => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiListCopyWith<_PleromaApiList> get copyWith =>
      throw _privateConstructorUsedError;
}
