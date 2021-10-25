// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_poll_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPoll _$UnifediApiPollFromJson(Map<String, dynamic> json) {
  return _UnifediApiPoll.fromJson(json);
}

/// @nodoc
class _$UnifediApiPollTearOff {
  const _$UnifediApiPollTearOff();

  _UnifediApiPoll call(
      {@HiveField(0) required bool expired,
      @HiveField(1) @JsonKey(name: 'expires_at') required DateTime? expiresAt,
      @HiveField(2) required String? id,
      @HiveField(3) required bool multiple,
      @HiveField(4) required List<UnifediApiPollOption> options,
      @HiveField(5) @JsonKey(name: 'own_votes') required List<int>? ownVotes,
      @HiveField(6) required bool? voted,
      @HiveField(7) @JsonKey(name: 'voters_count') required int? votersCount,
      @HiveField(8) @JsonKey(name: 'votes_count') required int? votesCount}) {
    return _UnifediApiPoll(
      expired: expired,
      expiresAt: expiresAt,
      id: id,
      multiple: multiple,
      options: options,
      ownVotes: ownVotes,
      voted: voted,
      votersCount: votersCount,
      votesCount: votesCount,
    );
  }

  UnifediApiPoll fromJson(Map<String, Object> json) {
    return UnifediApiPoll.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPoll = _$UnifediApiPollTearOff();

/// @nodoc
mixin _$UnifediApiPoll {
  @HiveField(0)
  bool get expired => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get id => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get multiple => throw _privateConstructorUsedError;
  @HiveField(4)
  List<UnifediApiPollOption> get options => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'own_votes')
  List<int>? get ownVotes => throw _privateConstructorUsedError;
  @HiveField(6)
  bool? get voted => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(name: 'voters_count')
  int? get votersCount => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'votes_count')
  int? get votesCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPollCopyWith<UnifediApiPoll> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPollCopyWith<$Res> {
  factory $UnifediApiPollCopyWith(
          UnifediApiPoll value, $Res Function(UnifediApiPoll) then) =
      _$UnifediApiPollCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) bool expired,
      @HiveField(1) @JsonKey(name: 'expires_at') DateTime? expiresAt,
      @HiveField(2) String? id,
      @HiveField(3) bool multiple,
      @HiveField(4) List<UnifediApiPollOption> options,
      @HiveField(5) @JsonKey(name: 'own_votes') List<int>? ownVotes,
      @HiveField(6) bool? voted,
      @HiveField(7) @JsonKey(name: 'voters_count') int? votersCount,
      @HiveField(8) @JsonKey(name: 'votes_count') int? votesCount});
}

/// @nodoc
class _$UnifediApiPollCopyWithImpl<$Res>
    implements $UnifediApiPollCopyWith<$Res> {
  _$UnifediApiPollCopyWithImpl(this._value, this._then);

  final UnifediApiPoll _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPoll) _then;

  @override
  $Res call({
    Object? expired = freezed,
    Object? expiresAt = freezed,
    Object? id = freezed,
    Object? multiple = freezed,
    Object? options = freezed,
    Object? ownVotes = freezed,
    Object? voted = freezed,
    Object? votersCount = freezed,
    Object? votesCount = freezed,
  }) {
    return _then(_value.copyWith(
      expired: expired == freezed
          ? _value.expired
          : expired // ignore: cast_nullable_to_non_nullable
              as bool,
      expiresAt: expiresAt == freezed
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      multiple: multiple == freezed
          ? _value.multiple
          : multiple // ignore: cast_nullable_to_non_nullable
              as bool,
      options: options == freezed
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiPollOption>,
      ownVotes: ownVotes == freezed
          ? _value.ownVotes
          : ownVotes // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      voted: voted == freezed
          ? _value.voted
          : voted // ignore: cast_nullable_to_non_nullable
              as bool?,
      votersCount: votersCount == freezed
          ? _value.votersCount
          : votersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      votesCount: votesCount == freezed
          ? _value.votesCount
          : votesCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiPollCopyWith<$Res>
    implements $UnifediApiPollCopyWith<$Res> {
  factory _$UnifediApiPollCopyWith(
          _UnifediApiPoll value, $Res Function(_UnifediApiPoll) then) =
      __$UnifediApiPollCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) bool expired,
      @HiveField(1) @JsonKey(name: 'expires_at') DateTime? expiresAt,
      @HiveField(2) String? id,
      @HiveField(3) bool multiple,
      @HiveField(4) List<UnifediApiPollOption> options,
      @HiveField(5) @JsonKey(name: 'own_votes') List<int>? ownVotes,
      @HiveField(6) bool? voted,
      @HiveField(7) @JsonKey(name: 'voters_count') int? votersCount,
      @HiveField(8) @JsonKey(name: 'votes_count') int? votesCount});
}

/// @nodoc
class __$UnifediApiPollCopyWithImpl<$Res>
    extends _$UnifediApiPollCopyWithImpl<$Res>
    implements _$UnifediApiPollCopyWith<$Res> {
  __$UnifediApiPollCopyWithImpl(
      _UnifediApiPoll _value, $Res Function(_UnifediApiPoll) _then)
      : super(_value, (v) => _then(v as _UnifediApiPoll));

  @override
  _UnifediApiPoll get _value => super._value as _UnifediApiPoll;

  @override
  $Res call({
    Object? expired = freezed,
    Object? expiresAt = freezed,
    Object? id = freezed,
    Object? multiple = freezed,
    Object? options = freezed,
    Object? ownVotes = freezed,
    Object? voted = freezed,
    Object? votersCount = freezed,
    Object? votesCount = freezed,
  }) {
    return _then(_UnifediApiPoll(
      expired: expired == freezed
          ? _value.expired
          : expired // ignore: cast_nullable_to_non_nullable
              as bool,
      expiresAt: expiresAt == freezed
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      multiple: multiple == freezed
          ? _value.multiple
          : multiple // ignore: cast_nullable_to_non_nullable
              as bool,
      options: options == freezed
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiPollOption>,
      ownVotes: ownVotes == freezed
          ? _value.ownVotes
          : ownVotes // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      voted: voted == freezed
          ? _value.voted
          : voted // ignore: cast_nullable_to_non_nullable
              as bool?,
      votersCount: votersCount == freezed
          ? _value.votersCount
          : votersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      votesCount: votesCount == freezed
          ? _value.votesCount
          : votesCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPoll implements _UnifediApiPoll {
  const _$_UnifediApiPoll(
      {@HiveField(0) required this.expired,
      @HiveField(1) @JsonKey(name: 'expires_at') required this.expiresAt,
      @HiveField(2) required this.id,
      @HiveField(3) required this.multiple,
      @HiveField(4) required this.options,
      @HiveField(5) @JsonKey(name: 'own_votes') required this.ownVotes,
      @HiveField(6) required this.voted,
      @HiveField(7) @JsonKey(name: 'voters_count') required this.votersCount,
      @HiveField(8) @JsonKey(name: 'votes_count') required this.votesCount});

  factory _$_UnifediApiPoll.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiPollFromJson(json);

  @override
  @HiveField(0)
  final bool expired;
  @override
  @HiveField(1)
  @JsonKey(name: 'expires_at')
  final DateTime? expiresAt;
  @override
  @HiveField(2)
  final String? id;
  @override
  @HiveField(3)
  final bool multiple;
  @override
  @HiveField(4)
  final List<UnifediApiPollOption> options;
  @override
  @HiveField(5)
  @JsonKey(name: 'own_votes')
  final List<int>? ownVotes;
  @override
  @HiveField(6)
  final bool? voted;
  @override
  @HiveField(7)
  @JsonKey(name: 'voters_count')
  final int? votersCount;
  @override
  @HiveField(8)
  @JsonKey(name: 'votes_count')
  final int? votesCount;

  @override
  String toString() {
    return 'UnifediApiPoll(expired: $expired, expiresAt: $expiresAt, id: $id, multiple: $multiple, options: $options, ownVotes: $ownVotes, voted: $voted, votersCount: $votersCount, votesCount: $votesCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiPoll &&
            (identical(other.expired, expired) ||
                const DeepCollectionEquality()
                    .equals(other.expired, expired)) &&
            (identical(other.expiresAt, expiresAt) ||
                const DeepCollectionEquality()
                    .equals(other.expiresAt, expiresAt)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.multiple, multiple) ||
                const DeepCollectionEquality()
                    .equals(other.multiple, multiple)) &&
            (identical(other.options, options) ||
                const DeepCollectionEquality()
                    .equals(other.options, options)) &&
            (identical(other.ownVotes, ownVotes) ||
                const DeepCollectionEquality()
                    .equals(other.ownVotes, ownVotes)) &&
            (identical(other.voted, voted) ||
                const DeepCollectionEquality().equals(other.voted, voted)) &&
            (identical(other.votersCount, votersCount) ||
                const DeepCollectionEquality()
                    .equals(other.votersCount, votersCount)) &&
            (identical(other.votesCount, votesCount) ||
                const DeepCollectionEquality()
                    .equals(other.votesCount, votesCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(expired) ^
      const DeepCollectionEquality().hash(expiresAt) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(multiple) ^
      const DeepCollectionEquality().hash(options) ^
      const DeepCollectionEquality().hash(ownVotes) ^
      const DeepCollectionEquality().hash(voted) ^
      const DeepCollectionEquality().hash(votersCount) ^
      const DeepCollectionEquality().hash(votesCount);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPollCopyWith<_UnifediApiPoll> get copyWith =>
      __$UnifediApiPollCopyWithImpl<_UnifediApiPoll>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPollToJson(this);
  }
}

abstract class _UnifediApiPoll implements UnifediApiPoll {
  const factory _UnifediApiPoll(
      {@HiveField(0)
          required bool expired,
      @HiveField(1)
      @JsonKey(name: 'expires_at')
          required DateTime? expiresAt,
      @HiveField(2)
          required String? id,
      @HiveField(3)
          required bool multiple,
      @HiveField(4)
          required List<UnifediApiPollOption> options,
      @HiveField(5)
      @JsonKey(name: 'own_votes')
          required List<int>? ownVotes,
      @HiveField(6)
          required bool? voted,
      @HiveField(7)
      @JsonKey(name: 'voters_count')
          required int? votersCount,
      @HiveField(8)
      @JsonKey(name: 'votes_count')
          required int? votesCount}) = _$_UnifediApiPoll;

  factory _UnifediApiPoll.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiPoll.fromJson;

  @override
  @HiveField(0)
  bool get expired => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String? get id => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  bool get multiple => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  List<UnifediApiPollOption> get options => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  @JsonKey(name: 'own_votes')
  List<int>? get ownVotes => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  bool? get voted => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  @JsonKey(name: 'voters_count')
  int? get votersCount => throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  @JsonKey(name: 'votes_count')
  int? get votesCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPollCopyWith<_UnifediApiPoll> get copyWith =>
      throw _privateConstructorUsedError;
}
