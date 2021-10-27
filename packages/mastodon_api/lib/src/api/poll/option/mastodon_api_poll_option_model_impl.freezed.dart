// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_poll_option_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiPollOption _$MastodonApiPollOptionFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiPollOption.fromJson(json);
}

/// @nodoc
class _$MastodonApiPollOptionTearOff {
  const _$MastodonApiPollOptionTearOff();

  _MastodonApiPollOption call(
      {@HiveField(0) required String title,
      @HiveField(1) @JsonKey(name: 'votes_count') required int? votesCount}) {
    return _MastodonApiPollOption(
      title: title,
      votesCount: votesCount,
    );
  }

  MastodonApiPollOption fromJson(Map<String, Object?> json) {
    return MastodonApiPollOption.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiPollOption = _$MastodonApiPollOptionTearOff();

/// @nodoc
mixin _$MastodonApiPollOption {
  @HiveField(0)
  String get title => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'votes_count')
  int? get votesCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiPollOptionCopyWith<MastodonApiPollOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiPollOptionCopyWith<$Res> {
  factory $MastodonApiPollOptionCopyWith(MastodonApiPollOption value,
          $Res Function(MastodonApiPollOption) then) =
      _$MastodonApiPollOptionCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String title,
      @HiveField(1) @JsonKey(name: 'votes_count') int? votesCount});
}

/// @nodoc
class _$MastodonApiPollOptionCopyWithImpl<$Res>
    implements $MastodonApiPollOptionCopyWith<$Res> {
  _$MastodonApiPollOptionCopyWithImpl(this._value, this._then);

  final MastodonApiPollOption _value;
  // ignore: unused_field
  final $Res Function(MastodonApiPollOption) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? votesCount = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      votesCount: votesCount == freezed
          ? _value.votesCount
          : votesCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$MastodonApiPollOptionCopyWith<$Res>
    implements $MastodonApiPollOptionCopyWith<$Res> {
  factory _$MastodonApiPollOptionCopyWith(_MastodonApiPollOption value,
          $Res Function(_MastodonApiPollOption) then) =
      __$MastodonApiPollOptionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String title,
      @HiveField(1) @JsonKey(name: 'votes_count') int? votesCount});
}

/// @nodoc
class __$MastodonApiPollOptionCopyWithImpl<$Res>
    extends _$MastodonApiPollOptionCopyWithImpl<$Res>
    implements _$MastodonApiPollOptionCopyWith<$Res> {
  __$MastodonApiPollOptionCopyWithImpl(_MastodonApiPollOption _value,
      $Res Function(_MastodonApiPollOption) _then)
      : super(_value, (v) => _then(v as _MastodonApiPollOption));

  @override
  _MastodonApiPollOption get _value => super._value as _MastodonApiPollOption;

  @override
  $Res call({
    Object? title = freezed,
    Object? votesCount = freezed,
  }) {
    return _then(_MastodonApiPollOption(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      votesCount: votesCount == freezed
          ? _value.votesCount
          : votesCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiPollOption implements _MastodonApiPollOption {
  const _$_MastodonApiPollOption(
      {@HiveField(0) required this.title,
      @HiveField(1) @JsonKey(name: 'votes_count') required this.votesCount});

  factory _$_MastodonApiPollOption.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiPollOptionFromJson(json);

  @override
  @HiveField(0)
  final String title;
  @override
  @HiveField(1)
  @JsonKey(name: 'votes_count')
  final int? votesCount;

  @override
  String toString() {
    return 'MastodonApiPollOption(title: $title, votesCount: $votesCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiPollOption &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.votesCount, votesCount) ||
                other.votesCount == votesCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, votesCount);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiPollOptionCopyWith<_MastodonApiPollOption> get copyWith =>
      __$MastodonApiPollOptionCopyWithImpl<_MastodonApiPollOption>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiPollOptionToJson(this);
  }
}

abstract class _MastodonApiPollOption implements MastodonApiPollOption {
  const factory _MastodonApiPollOption(
      {@HiveField(0)
          required String title,
      @HiveField(1)
      @JsonKey(name: 'votes_count')
          required int? votesCount}) = _$_MastodonApiPollOption;

  factory _MastodonApiPollOption.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiPollOption.fromJson;

  @override
  @HiveField(0)
  String get title;
  @override
  @HiveField(1)
  @JsonKey(name: 'votes_count')
  int? get votesCount;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiPollOptionCopyWith<_MastodonApiPollOption> get copyWith =>
      throw _privateConstructorUsedError;
}
