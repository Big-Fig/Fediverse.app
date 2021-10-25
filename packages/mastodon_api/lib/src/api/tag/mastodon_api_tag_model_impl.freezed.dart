// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_tag_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiTag _$MastodonApiTagFromJson(Map<String, dynamic> json) {
  return _MastodonApiTag.fromJson(json);
}

/// @nodoc
class _$MastodonApiTagTearOff {
  const _$MastodonApiTagTearOff();

  _MastodonApiTag call(
      {@HiveField(0) required String name,
      @HiveField(1) required String url,
      @HiveField(2) required List<MastodonApiTagHistoryItem>? history}) {
    return _MastodonApiTag(
      name: name,
      url: url,
      history: history,
    );
  }

  MastodonApiTag fromJson(Map<String, Object> json) {
    return MastodonApiTag.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiTag = _$MastodonApiTagTearOff();

/// @nodoc
mixin _$MastodonApiTag {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String get url => throw _privateConstructorUsedError;
  @HiveField(2)
  List<MastodonApiTagHistoryItem>? get history =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiTagCopyWith<MastodonApiTag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiTagCopyWith<$Res> {
  factory $MastodonApiTagCopyWith(
          MastodonApiTag value, $Res Function(MastodonApiTag) then) =
      _$MastodonApiTagCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String url,
      @HiveField(2) List<MastodonApiTagHistoryItem>? history});
}

/// @nodoc
class _$MastodonApiTagCopyWithImpl<$Res>
    implements $MastodonApiTagCopyWith<$Res> {
  _$MastodonApiTagCopyWithImpl(this._value, this._then);

  final MastodonApiTag _value;
  // ignore: unused_field
  final $Res Function(MastodonApiTag) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
    Object? history = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      history: history == freezed
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiTagHistoryItem>?,
    ));
  }
}

/// @nodoc
abstract class _$MastodonApiTagCopyWith<$Res>
    implements $MastodonApiTagCopyWith<$Res> {
  factory _$MastodonApiTagCopyWith(
          _MastodonApiTag value, $Res Function(_MastodonApiTag) then) =
      __$MastodonApiTagCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String url,
      @HiveField(2) List<MastodonApiTagHistoryItem>? history});
}

/// @nodoc
class __$MastodonApiTagCopyWithImpl<$Res>
    extends _$MastodonApiTagCopyWithImpl<$Res>
    implements _$MastodonApiTagCopyWith<$Res> {
  __$MastodonApiTagCopyWithImpl(
      _MastodonApiTag _value, $Res Function(_MastodonApiTag) _then)
      : super(_value, (v) => _then(v as _MastodonApiTag));

  @override
  _MastodonApiTag get _value => super._value as _MastodonApiTag;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
    Object? history = freezed,
  }) {
    return _then(_MastodonApiTag(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      history: history == freezed
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiTagHistoryItem>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiTag implements _MastodonApiTag {
  const _$_MastodonApiTag(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.url,
      @HiveField(2) required this.history});

  factory _$_MastodonApiTag.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiTagFromJson(json);

  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final String url;
  @override
  @HiveField(2)
  final List<MastodonApiTagHistoryItem>? history;

  @override
  String toString() {
    return 'MastodonApiTag(name: $name, url: $url, history: $history)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiTag &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.history, history) ||
                const DeepCollectionEquality().equals(other.history, history)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(history);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiTagCopyWith<_MastodonApiTag> get copyWith =>
      __$MastodonApiTagCopyWithImpl<_MastodonApiTag>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiTagToJson(this);
  }
}

abstract class _MastodonApiTag implements MastodonApiTag {
  const factory _MastodonApiTag(
          {@HiveField(0) required String name,
          @HiveField(1) required String url,
          @HiveField(2) required List<MastodonApiTagHistoryItem>? history}) =
      _$_MastodonApiTag;

  factory _MastodonApiTag.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiTag.fromJson;

  @override
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get url => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  List<MastodonApiTagHistoryItem>? get history =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiTagCopyWith<_MastodonApiTag> get copyWith =>
      throw _privateConstructorUsedError;
}
