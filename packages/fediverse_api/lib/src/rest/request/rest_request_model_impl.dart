import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../interface_to_impl/interface_to_impl_helper.dart';
import '../../url/query/arg/url_query_arg_model.dart';
import '../header/rest_header_model.dart';
import 'rest_request_model.dart';
import 'type/rest_request_type_sealed.dart';

part 'rest_request_model_impl.freezed.dart';

@freezed
class RestRequest with _$RestRequest implements IRestRequest {
  const factory RestRequest({
    required RestRequestType type,
    required String relativeUrlPath,
    required List<UrlQueryArg>? queryArgs,
    required Map<String, dynamic>? bodyJson,
    required List<RestHeader>? headers,
    required Map<String, File>? files,
  }) = _RestRequest;

  static RestRequest get({
    required String relativePath,
    List<UrlQueryArg>? queryArgs,
    List<RestHeader>? headers,
  }) =>
      RestRequest(
        type: RestRequestType.getValue,
        relativeUrlPath: relativePath,
        queryArgs: queryArgs,
        headers: headers,
        bodyJson: null,
        files: null,
      );

  static RestRequest head({
    required String relativePath,
    List<UrlQueryArg>? queryArgs,
    List<RestHeader>? headers,
  }) =>
      RestRequest(
        type: RestRequestType.headValue,
        relativeUrlPath: relativePath,
        queryArgs: queryArgs,
        headers: headers,
        bodyJson: null,
        files: null,
      );

  static RestRequest delete({
    required String relativePath,
    List<UrlQueryArg>? queryArgs,
    List<RestHeader>? headers,
    Map<String, dynamic>? bodyJson,
  }) =>
      RestRequest(
        type: RestRequestType.deleteValue,
        relativeUrlPath: relativePath,
        queryArgs: queryArgs,
        headers: headers,
        bodyJson: bodyJson,
        files: null,
      );

  static RestRequest post({
    required String relativePath,
    List<UrlQueryArg>? queryArgs,
    List<RestHeader>? headers,
    Map<String, dynamic>? bodyJson,
    Map<String, File>? files,
  }) =>
      RestRequest(
        type: RestRequestType.postValue,
        relativeUrlPath: relativePath,
        queryArgs: queryArgs,
        headers: headers,
        bodyJson: bodyJson,
        files: files,
      );

  static RestRequest put({
    required String relativePath,
    List<UrlQueryArg>? queryArgs,
    List<RestHeader>? headers,
    Map<String, dynamic>? bodyJson,
    Map<String, File>? files,
  }) =>
      RestRequest(
        type: RestRequestType.putValue,
        relativeUrlPath: relativePath,
        queryArgs: queryArgs,
        headers: headers,
        bodyJson: bodyJson,
        files: files,
      );

  static RestRequest patch({
    required String relativePath,
    List<UrlQueryArg>? queryArgs,
    List<RestHeader>? headers,
    Map<String, dynamic>? bodyJson,
    Map<String, File>? files,
  }) =>
      RestRequest(
        type: RestRequestType.patchValue,
        relativeUrlPath: relativePath,
        queryArgs: queryArgs,
        headers: headers,
        bodyJson: bodyJson,
        files: files,
      );
}

// ignore: lines_longer_than_80_chars
extension RestRequestInterfaceExtension on IRestRequest {
  RestRequest toRestRequest({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => RestRequest(
          type: type,
          relativeUrlPath: relativeUrlPath,
          queryArgs: queryArgs,
          bodyJson: bodyJson,
          headers: headers,
          files: files,
        ),
        forceNewObject: forceNewObject,
      );

  IRestRequest copyAndAppend({
    List<UrlQueryArg>? queryArgs,
    Map<String, dynamic>? bodyJson,
    List<RestHeader>? headers,
    Map<String, File>? files,
  }) {
    var newHeaders = this.headers;
    var newQueryArgs = this.queryArgs;
    var newFiles = this.files;
    var newBodyJson = this.bodyJson;

    if (headers != null && headers.isNotEmpty) {
      newHeaders = newHeaders ?? [];
      // ignore: cascade_invocations
      newHeaders.addAll(headers);
    }

    if (queryArgs != null && queryArgs.isNotEmpty) {
      newQueryArgs = newQueryArgs ?? [];
      // ignore: cascade_invocations
      newQueryArgs.addAll(queryArgs);
    }

    if (files != null && files.isNotEmpty) {
      newFiles = newFiles ?? {};
      // ignore: cascade_invocations
      newFiles.addAll(files);
    }

    if (bodyJson != null && bodyJson.isNotEmpty) {
      newBodyJson = newBodyJson ?? <String, dynamic>{};
      // ignore: cascade_invocations
      newBodyJson.addAll(bodyJson);
    }

    return RestRequest(
      relativeUrlPath: relativeUrlPath,
      type: type,
      headers: newHeaders,
      queryArgs: newQueryArgs,
      files: newFiles,
      bodyJson: newBodyJson,
    );
  }
}
