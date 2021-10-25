import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../fediverse_api.dart';

part 'rest_request_type_sealed.freezed.dart';

// ignore_for_file: no-magic-number
@freezed
class RestRequestType with _$RestRequestType implements IFediverseApiUnion {
  static const getStringValue = 'get';
  static const postStringValue = 'post';
  static const headStringValue = 'head';
  static const putStringValue = 'put';
  static const patchStringValue = 'patch';
  static const deleteStringValue = 'delete';

  static const getValue = RestRequestType.get();
  static const postValue = RestRequestType.post();
  static const headValue = RestRequestType.head();
  static const putValue = RestRequestType.put();
  static const patchValue = RestRequestType.patch();
  static const deleteValue = RestRequestType.delete();

  static const values = [
    getValue,
    postValue,
    headValue,
    putValue,
    patchValue,
    deleteValue,
  ];

  const factory RestRequestType.get({
    @Default(RestRequestType.getStringValue) String stringValue,
  }) = _Get;

  const factory RestRequestType.post({
    @Default(RestRequestType.postStringValue) String stringValue,
  }) = _Post;

  const factory RestRequestType.head({
    @Default(RestRequestType.headStringValue) String stringValue,
  }) = _Head;

  const factory RestRequestType.put({
    @Default(RestRequestType.putStringValue) String stringValue,
  }) = _Put;

  const factory RestRequestType.patch({
    @Default(RestRequestType.patchStringValue) String stringValue,
  }) = _Patch;

  const factory RestRequestType.delete({
    @Default(RestRequestType.deleteStringValue) String stringValue,
  }) = _Delete;
}
