// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_list_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiList _$MastodonApiListFromJson(Map<String, dynamic> json) {
  return _MastodonApiList.fromJson(json);
}

/// @nodoc
class _$MastodonApiListTearOff {
  const _$MastodonApiListTearOff();

  _MastodonApiList call(
      {@HiveField(0)
          required String id,
      @HiveField(1)
          required String title,
      @JsonKey(name: 'replies_policy')
      @HiveField(2)
          required String? repliesPolicy}) {
    return _MastodonApiList(
      id: id,
      title: title,
      repliesPolicy: repliesPolicy,
    );
  }

  MastodonApiList fromJson(Map<String, Object?> json) {
    return MastodonApiList.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiList = _$MastodonApiListTearOff();

/// @nodoc
mixin _$MastodonApiList {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'replies_policy')
  @HiveField(2)
  String? get repliesPolicy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiListCopyWith<MastodonApiList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiListCopyWith<$Res> {
  factory $MastodonApiListCopyWith(
          MastodonApiList value, $Res Function(MastodonApiList) then) =
      _$MastodonApiListCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @JsonKey(name: 'replies_policy') @HiveField(2) String? repliesPolicy});
}

/// @nodoc
class _$MastodonApiListCopyWithImpl<$Res>
    implements $MastodonApiListCopyWith<$Res> {
  _$MastodonApiListCopyWithImpl(this._value, this._then);

  final MastodonApiList _value;
  // ignore: unused_field
  final $Res Function(MastodonApiList) _then;

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
abstract class _$MastodonApiListCopyWith<$Res>
    implements $MastodonApiListCopyWith<$Res> {
  factory _$MastodonApiListCopyWith(
          _MastodonApiList value, $Res Function(_MastodonApiList) then) =
      __$MastodonApiListCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @JsonKey(name: 'replies_policy') @HiveField(2) String? repliesPolicy});
}

/// @nodoc
class __$MastodonApiListCopyWithImpl<$Res>
    extends _$MastodonApiListCopyWithImpl<$Res>
    implements _$MastodonApiListCopyWith<$Res> {
  __$MastodonApiListCopyWithImpl(
      _MastodonApiList _value, $Res Function(_MastodonApiList) _then)
      : super(_value, (v) => _then(v as _MastodonApiList));

  @override
  _MastodonApiList get _value => super._value as _MastodonApiList;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? repliesPolicy = freezed,
  }) {
    return _then(_MastodonApiList(
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
class _$_MastodonApiList implements _MastodonApiList {
  const _$_MastodonApiList(
      {@HiveField(0)
          required this.id,
      @HiveField(1)
          required this.title,
      @JsonKey(name: 'replies_policy')
      @HiveField(2)
          required this.repliesPolicy});

  factory _$_MastodonApiList.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiListFromJson(json);

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
    return 'MastodonApiList(id: $id, title: $title, repliesPolicy: $repliesPolicy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiList &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.repliesPolicy, repliesPolicy) ||
                other.repliesPolicy == repliesPolicy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, repliesPolicy);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiListCopyWith<_MastodonApiList> get copyWith =>
      __$MastodonApiListCopyWithImpl<_MastodonApiList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiListToJson(this);
  }
}

abstract class _MastodonApiList implements MastodonApiList {
  const factory _MastodonApiList(
      {@HiveField(0)
          required String id,
      @HiveField(1)
          required String title,
      @JsonKey(name: 'replies_policy')
      @HiveField(2)
          required String? repliesPolicy}) = _$_MastodonApiList;

  factory _MastodonApiList.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiList.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get title;
  @override
  @JsonKey(name: 'replies_policy')
  @HiveField(2)
  String? get repliesPolicy;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiListCopyWith<_MastodonApiList> get copyWith =>
      throw _privateConstructorUsedError;
}
