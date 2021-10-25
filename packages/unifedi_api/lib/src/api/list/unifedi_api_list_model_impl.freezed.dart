// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_list_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiList _$UnifediApiListFromJson(Map<String, dynamic> json) {
  return _UnifediApiList.fromJson(json);
}

/// @nodoc
class _$UnifediApiListTearOff {
  const _$UnifediApiListTearOff();

  _UnifediApiList call(
      {@HiveField(0)
          required String id,
      @HiveField(1)
          required String title,
      @JsonKey(name: 'replies_policy')
      @HiveField(2)
          required String? repliesPolicy}) {
    return _UnifediApiList(
      id: id,
      title: title,
      repliesPolicy: repliesPolicy,
    );
  }

  UnifediApiList fromJson(Map<String, Object> json) {
    return UnifediApiList.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiList = _$UnifediApiListTearOff();

/// @nodoc
mixin _$UnifediApiList {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'replies_policy')
  @HiveField(2)
  String? get repliesPolicy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiListCopyWith<UnifediApiList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiListCopyWith<$Res> {
  factory $UnifediApiListCopyWith(
          UnifediApiList value, $Res Function(UnifediApiList) then) =
      _$UnifediApiListCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @JsonKey(name: 'replies_policy') @HiveField(2) String? repliesPolicy});
}

/// @nodoc
class _$UnifediApiListCopyWithImpl<$Res>
    implements $UnifediApiListCopyWith<$Res> {
  _$UnifediApiListCopyWithImpl(this._value, this._then);

  final UnifediApiList _value;
  // ignore: unused_field
  final $Res Function(UnifediApiList) _then;

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
abstract class _$UnifediApiListCopyWith<$Res>
    implements $UnifediApiListCopyWith<$Res> {
  factory _$UnifediApiListCopyWith(
          _UnifediApiList value, $Res Function(_UnifediApiList) then) =
      __$UnifediApiListCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @JsonKey(name: 'replies_policy') @HiveField(2) String? repliesPolicy});
}

/// @nodoc
class __$UnifediApiListCopyWithImpl<$Res>
    extends _$UnifediApiListCopyWithImpl<$Res>
    implements _$UnifediApiListCopyWith<$Res> {
  __$UnifediApiListCopyWithImpl(
      _UnifediApiList _value, $Res Function(_UnifediApiList) _then)
      : super(_value, (v) => _then(v as _UnifediApiList));

  @override
  _UnifediApiList get _value => super._value as _UnifediApiList;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? repliesPolicy = freezed,
  }) {
    return _then(_UnifediApiList(
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
class _$_UnifediApiList implements _UnifediApiList {
  const _$_UnifediApiList(
      {@HiveField(0)
          required this.id,
      @HiveField(1)
          required this.title,
      @JsonKey(name: 'replies_policy')
      @HiveField(2)
          required this.repliesPolicy});

  factory _$_UnifediApiList.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiListFromJson(json);

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
    return 'UnifediApiList(id: $id, title: $title, repliesPolicy: $repliesPolicy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiList &&
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
  _$UnifediApiListCopyWith<_UnifediApiList> get copyWith =>
      __$UnifediApiListCopyWithImpl<_UnifediApiList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiListToJson(this);
  }
}

abstract class _UnifediApiList implements UnifediApiList {
  const factory _UnifediApiList(
      {@HiveField(0)
          required String id,
      @HiveField(1)
          required String title,
      @JsonKey(name: 'replies_policy')
      @HiveField(2)
          required String? repliesPolicy}) = _$_UnifediApiList;

  factory _UnifediApiList.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiList.fromJson;

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
  _$UnifediApiListCopyWith<_UnifediApiList> get copyWith =>
      throw _privateConstructorUsedError;
}
