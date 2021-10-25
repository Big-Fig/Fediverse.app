// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rest_request_type_sealed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RestRequestTypeTearOff {
  const _$RestRequestTypeTearOff();

  _Get get({String stringValue = RestRequestType.getStringValue}) {
    return _Get(
      stringValue: stringValue,
    );
  }

  _Post post({String stringValue = RestRequestType.postStringValue}) {
    return _Post(
      stringValue: stringValue,
    );
  }

  _Head head({String stringValue = RestRequestType.headStringValue}) {
    return _Head(
      stringValue: stringValue,
    );
  }

  _Put put({String stringValue = RestRequestType.putStringValue}) {
    return _Put(
      stringValue: stringValue,
    );
  }

  _Patch patch({String stringValue = RestRequestType.patchStringValue}) {
    return _Patch(
      stringValue: stringValue,
    );
  }

  _Delete delete({String stringValue = RestRequestType.deleteStringValue}) {
    return _Delete(
      stringValue: stringValue,
    );
  }
}

/// @nodoc
const $RestRequestType = _$RestRequestTypeTearOff();

/// @nodoc
mixin _$RestRequestType {
  String get stringValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) get,
    required TResult Function(String stringValue) post,
    required TResult Function(String stringValue) head,
    required TResult Function(String stringValue) put,
    required TResult Function(String stringValue) patch,
    required TResult Function(String stringValue) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? get,
    TResult Function(String stringValue)? post,
    TResult Function(String stringValue)? head,
    TResult Function(String stringValue)? put,
    TResult Function(String stringValue)? patch,
    TResult Function(String stringValue)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? get,
    TResult Function(String stringValue)? post,
    TResult Function(String stringValue)? head,
    TResult Function(String stringValue)? put,
    TResult Function(String stringValue)? patch,
    TResult Function(String stringValue)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Get value) get,
    required TResult Function(_Post value) post,
    required TResult Function(_Head value) head,
    required TResult Function(_Put value) put,
    required TResult Function(_Patch value) patch,
    required TResult Function(_Delete value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Post value)? post,
    TResult Function(_Head value)? head,
    TResult Function(_Put value)? put,
    TResult Function(_Patch value)? patch,
    TResult Function(_Delete value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Post value)? post,
    TResult Function(_Head value)? head,
    TResult Function(_Put value)? put,
    TResult Function(_Patch value)? patch,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RestRequestTypeCopyWith<RestRequestType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestRequestTypeCopyWith<$Res> {
  factory $RestRequestTypeCopyWith(
          RestRequestType value, $Res Function(RestRequestType) then) =
      _$RestRequestTypeCopyWithImpl<$Res>;
  $Res call({String stringValue});
}

/// @nodoc
class _$RestRequestTypeCopyWithImpl<$Res>
    implements $RestRequestTypeCopyWith<$Res> {
  _$RestRequestTypeCopyWithImpl(this._value, this._then);

  final RestRequestType _value;
  // ignore: unused_field
  final $Res Function(RestRequestType) _then;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_value.copyWith(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$GetCopyWith<$Res> implements $RestRequestTypeCopyWith<$Res> {
  factory _$GetCopyWith(_Get value, $Res Function(_Get) then) =
      __$GetCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$GetCopyWithImpl<$Res> extends _$RestRequestTypeCopyWithImpl<$Res>
    implements _$GetCopyWith<$Res> {
  __$GetCopyWithImpl(_Get _value, $Res Function(_Get) _then)
      : super(_value, (v) => _then(v as _Get));

  @override
  _Get get _value => super._value as _Get;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Get(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Get implements _Get {
  const _$_Get({this.stringValue = RestRequestType.getStringValue});

  @JsonKey(defaultValue: RestRequestType.getStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'RestRequestType.get(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Get &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$GetCopyWith<_Get> get copyWith =>
      __$GetCopyWithImpl<_Get>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) get,
    required TResult Function(String stringValue) post,
    required TResult Function(String stringValue) head,
    required TResult Function(String stringValue) put,
    required TResult Function(String stringValue) patch,
    required TResult Function(String stringValue) delete,
  }) {
    return get(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? get,
    TResult Function(String stringValue)? post,
    TResult Function(String stringValue)? head,
    TResult Function(String stringValue)? put,
    TResult Function(String stringValue)? patch,
    TResult Function(String stringValue)? delete,
  }) {
    return get?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? get,
    TResult Function(String stringValue)? post,
    TResult Function(String stringValue)? head,
    TResult Function(String stringValue)? put,
    TResult Function(String stringValue)? patch,
    TResult Function(String stringValue)? delete,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Get value) get,
    required TResult Function(_Post value) post,
    required TResult Function(_Head value) head,
    required TResult Function(_Put value) put,
    required TResult Function(_Patch value) patch,
    required TResult Function(_Delete value) delete,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Post value)? post,
    TResult Function(_Head value)? head,
    TResult Function(_Put value)? put,
    TResult Function(_Patch value)? patch,
    TResult Function(_Delete value)? delete,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Post value)? post,
    TResult Function(_Head value)? head,
    TResult Function(_Put value)? put,
    TResult Function(_Patch value)? patch,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class _Get implements RestRequestType {
  const factory _Get({String stringValue}) = _$_Get;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GetCopyWith<_Get> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PostCopyWith<$Res> implements $RestRequestTypeCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) then) =
      __$PostCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$PostCopyWithImpl<$Res> extends _$RestRequestTypeCopyWithImpl<$Res>
    implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(_Post _value, $Res Function(_Post) _then)
      : super(_value, (v) => _then(v as _Post));

  @override
  _Post get _value => super._value as _Post;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Post(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Post implements _Post {
  const _$_Post({this.stringValue = RestRequestType.postStringValue});

  @JsonKey(defaultValue: RestRequestType.postStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'RestRequestType.post(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Post &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$PostCopyWith<_Post> get copyWith =>
      __$PostCopyWithImpl<_Post>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) get,
    required TResult Function(String stringValue) post,
    required TResult Function(String stringValue) head,
    required TResult Function(String stringValue) put,
    required TResult Function(String stringValue) patch,
    required TResult Function(String stringValue) delete,
  }) {
    return post(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? get,
    TResult Function(String stringValue)? post,
    TResult Function(String stringValue)? head,
    TResult Function(String stringValue)? put,
    TResult Function(String stringValue)? patch,
    TResult Function(String stringValue)? delete,
  }) {
    return post?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? get,
    TResult Function(String stringValue)? post,
    TResult Function(String stringValue)? head,
    TResult Function(String stringValue)? put,
    TResult Function(String stringValue)? patch,
    TResult Function(String stringValue)? delete,
    required TResult orElse(),
  }) {
    if (post != null) {
      return post(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Get value) get,
    required TResult Function(_Post value) post,
    required TResult Function(_Head value) head,
    required TResult Function(_Put value) put,
    required TResult Function(_Patch value) patch,
    required TResult Function(_Delete value) delete,
  }) {
    return post(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Post value)? post,
    TResult Function(_Head value)? head,
    TResult Function(_Put value)? put,
    TResult Function(_Patch value)? patch,
    TResult Function(_Delete value)? delete,
  }) {
    return post?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Post value)? post,
    TResult Function(_Head value)? head,
    TResult Function(_Put value)? put,
    TResult Function(_Patch value)? patch,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (post != null) {
      return post(this);
    }
    return orElse();
  }
}

abstract class _Post implements RestRequestType {
  const factory _Post({String stringValue}) = _$_Post;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PostCopyWith<_Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$HeadCopyWith<$Res> implements $RestRequestTypeCopyWith<$Res> {
  factory _$HeadCopyWith(_Head value, $Res Function(_Head) then) =
      __$HeadCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$HeadCopyWithImpl<$Res> extends _$RestRequestTypeCopyWithImpl<$Res>
    implements _$HeadCopyWith<$Res> {
  __$HeadCopyWithImpl(_Head _value, $Res Function(_Head) _then)
      : super(_value, (v) => _then(v as _Head));

  @override
  _Head get _value => super._value as _Head;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Head(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Head implements _Head {
  const _$_Head({this.stringValue = RestRequestType.headStringValue});

  @JsonKey(defaultValue: RestRequestType.headStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'RestRequestType.head(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Head &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$HeadCopyWith<_Head> get copyWith =>
      __$HeadCopyWithImpl<_Head>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) get,
    required TResult Function(String stringValue) post,
    required TResult Function(String stringValue) head,
    required TResult Function(String stringValue) put,
    required TResult Function(String stringValue) patch,
    required TResult Function(String stringValue) delete,
  }) {
    return head(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? get,
    TResult Function(String stringValue)? post,
    TResult Function(String stringValue)? head,
    TResult Function(String stringValue)? put,
    TResult Function(String stringValue)? patch,
    TResult Function(String stringValue)? delete,
  }) {
    return head?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? get,
    TResult Function(String stringValue)? post,
    TResult Function(String stringValue)? head,
    TResult Function(String stringValue)? put,
    TResult Function(String stringValue)? patch,
    TResult Function(String stringValue)? delete,
    required TResult orElse(),
  }) {
    if (head != null) {
      return head(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Get value) get,
    required TResult Function(_Post value) post,
    required TResult Function(_Head value) head,
    required TResult Function(_Put value) put,
    required TResult Function(_Patch value) patch,
    required TResult Function(_Delete value) delete,
  }) {
    return head(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Post value)? post,
    TResult Function(_Head value)? head,
    TResult Function(_Put value)? put,
    TResult Function(_Patch value)? patch,
    TResult Function(_Delete value)? delete,
  }) {
    return head?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Post value)? post,
    TResult Function(_Head value)? head,
    TResult Function(_Put value)? put,
    TResult Function(_Patch value)? patch,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (head != null) {
      return head(this);
    }
    return orElse();
  }
}

abstract class _Head implements RestRequestType {
  const factory _Head({String stringValue}) = _$_Head;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HeadCopyWith<_Head> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PutCopyWith<$Res> implements $RestRequestTypeCopyWith<$Res> {
  factory _$PutCopyWith(_Put value, $Res Function(_Put) then) =
      __$PutCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$PutCopyWithImpl<$Res> extends _$RestRequestTypeCopyWithImpl<$Res>
    implements _$PutCopyWith<$Res> {
  __$PutCopyWithImpl(_Put _value, $Res Function(_Put) _then)
      : super(_value, (v) => _then(v as _Put));

  @override
  _Put get _value => super._value as _Put;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Put(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Put implements _Put {
  const _$_Put({this.stringValue = RestRequestType.putStringValue});

  @JsonKey(defaultValue: RestRequestType.putStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'RestRequestType.put(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Put &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$PutCopyWith<_Put> get copyWith =>
      __$PutCopyWithImpl<_Put>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) get,
    required TResult Function(String stringValue) post,
    required TResult Function(String stringValue) head,
    required TResult Function(String stringValue) put,
    required TResult Function(String stringValue) patch,
    required TResult Function(String stringValue) delete,
  }) {
    return put(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? get,
    TResult Function(String stringValue)? post,
    TResult Function(String stringValue)? head,
    TResult Function(String stringValue)? put,
    TResult Function(String stringValue)? patch,
    TResult Function(String stringValue)? delete,
  }) {
    return put?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? get,
    TResult Function(String stringValue)? post,
    TResult Function(String stringValue)? head,
    TResult Function(String stringValue)? put,
    TResult Function(String stringValue)? patch,
    TResult Function(String stringValue)? delete,
    required TResult orElse(),
  }) {
    if (put != null) {
      return put(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Get value) get,
    required TResult Function(_Post value) post,
    required TResult Function(_Head value) head,
    required TResult Function(_Put value) put,
    required TResult Function(_Patch value) patch,
    required TResult Function(_Delete value) delete,
  }) {
    return put(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Post value)? post,
    TResult Function(_Head value)? head,
    TResult Function(_Put value)? put,
    TResult Function(_Patch value)? patch,
    TResult Function(_Delete value)? delete,
  }) {
    return put?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Post value)? post,
    TResult Function(_Head value)? head,
    TResult Function(_Put value)? put,
    TResult Function(_Patch value)? patch,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (put != null) {
      return put(this);
    }
    return orElse();
  }
}

abstract class _Put implements RestRequestType {
  const factory _Put({String stringValue}) = _$_Put;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PutCopyWith<_Put> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PatchCopyWith<$Res> implements $RestRequestTypeCopyWith<$Res> {
  factory _$PatchCopyWith(_Patch value, $Res Function(_Patch) then) =
      __$PatchCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$PatchCopyWithImpl<$Res> extends _$RestRequestTypeCopyWithImpl<$Res>
    implements _$PatchCopyWith<$Res> {
  __$PatchCopyWithImpl(_Patch _value, $Res Function(_Patch) _then)
      : super(_value, (v) => _then(v as _Patch));

  @override
  _Patch get _value => super._value as _Patch;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Patch(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Patch implements _Patch {
  const _$_Patch({this.stringValue = RestRequestType.patchStringValue});

  @JsonKey(defaultValue: RestRequestType.patchStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'RestRequestType.patch(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Patch &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$PatchCopyWith<_Patch> get copyWith =>
      __$PatchCopyWithImpl<_Patch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) get,
    required TResult Function(String stringValue) post,
    required TResult Function(String stringValue) head,
    required TResult Function(String stringValue) put,
    required TResult Function(String stringValue) patch,
    required TResult Function(String stringValue) delete,
  }) {
    return patch(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? get,
    TResult Function(String stringValue)? post,
    TResult Function(String stringValue)? head,
    TResult Function(String stringValue)? put,
    TResult Function(String stringValue)? patch,
    TResult Function(String stringValue)? delete,
  }) {
    return patch?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? get,
    TResult Function(String stringValue)? post,
    TResult Function(String stringValue)? head,
    TResult Function(String stringValue)? put,
    TResult Function(String stringValue)? patch,
    TResult Function(String stringValue)? delete,
    required TResult orElse(),
  }) {
    if (patch != null) {
      return patch(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Get value) get,
    required TResult Function(_Post value) post,
    required TResult Function(_Head value) head,
    required TResult Function(_Put value) put,
    required TResult Function(_Patch value) patch,
    required TResult Function(_Delete value) delete,
  }) {
    return patch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Post value)? post,
    TResult Function(_Head value)? head,
    TResult Function(_Put value)? put,
    TResult Function(_Patch value)? patch,
    TResult Function(_Delete value)? delete,
  }) {
    return patch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Post value)? post,
    TResult Function(_Head value)? head,
    TResult Function(_Put value)? put,
    TResult Function(_Patch value)? patch,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (patch != null) {
      return patch(this);
    }
    return orElse();
  }
}

abstract class _Patch implements RestRequestType {
  const factory _Patch({String stringValue}) = _$_Patch;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PatchCopyWith<_Patch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DeleteCopyWith<$Res>
    implements $RestRequestTypeCopyWith<$Res> {
  factory _$DeleteCopyWith(_Delete value, $Res Function(_Delete) then) =
      __$DeleteCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$DeleteCopyWithImpl<$Res> extends _$RestRequestTypeCopyWithImpl<$Res>
    implements _$DeleteCopyWith<$Res> {
  __$DeleteCopyWithImpl(_Delete _value, $Res Function(_Delete) _then)
      : super(_value, (v) => _then(v as _Delete));

  @override
  _Delete get _value => super._value as _Delete;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Delete(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Delete implements _Delete {
  const _$_Delete({this.stringValue = RestRequestType.deleteStringValue});

  @JsonKey(defaultValue: RestRequestType.deleteStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'RestRequestType.delete(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Delete &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$DeleteCopyWith<_Delete> get copyWith =>
      __$DeleteCopyWithImpl<_Delete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) get,
    required TResult Function(String stringValue) post,
    required TResult Function(String stringValue) head,
    required TResult Function(String stringValue) put,
    required TResult Function(String stringValue) patch,
    required TResult Function(String stringValue) delete,
  }) {
    return delete(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? get,
    TResult Function(String stringValue)? post,
    TResult Function(String stringValue)? head,
    TResult Function(String stringValue)? put,
    TResult Function(String stringValue)? patch,
    TResult Function(String stringValue)? delete,
  }) {
    return delete?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? get,
    TResult Function(String stringValue)? post,
    TResult Function(String stringValue)? head,
    TResult Function(String stringValue)? put,
    TResult Function(String stringValue)? patch,
    TResult Function(String stringValue)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Get value) get,
    required TResult Function(_Post value) post,
    required TResult Function(_Head value) head,
    required TResult Function(_Put value) put,
    required TResult Function(_Patch value) patch,
    required TResult Function(_Delete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Post value)? post,
    TResult Function(_Head value)? head,
    TResult Function(_Put value)? put,
    TResult Function(_Patch value)? patch,
    TResult Function(_Delete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Get value)? get,
    TResult Function(_Post value)? post,
    TResult Function(_Head value)? head,
    TResult Function(_Put value)? put,
    TResult Function(_Patch value)? patch,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements RestRequestType {
  const factory _Delete({String stringValue}) = _$_Delete;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DeleteCopyWith<_Delete> get copyWith => throw _privateConstructorUsedError;
}
