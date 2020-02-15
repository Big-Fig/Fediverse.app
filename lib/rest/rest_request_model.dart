import 'dart:io';

import 'package:fedi/rest/rest_model.dart';
import 'package:flutter/widgets.dart';

class RestRequest<T> {
  final RestRequestType type;

  final String relativeUrlPath;

  final String additionalQueryArgsString;
   Map<String, String> queryArgs;
   Map<String, String> bodyJson;
   Map<String, String> headers;

  RestRequest._private(
      {@required this.type,
      @required this.relativeUrlPath,
      @required this.queryArgs,
      @required this.additionalQueryArgsString,
      @required this.bodyJson,
      @required this.headers}) {
    queryArgs = queryArgs ?? {};
    bodyJson = bodyJson ?? {};
    headers = headers ?? {};
  }

  RestRequest.get({
    @required String relativePath,
    Map<String, String> queryArgs,
    Map<String, String> headers,
    String additionalQueryArgsString,
  }) : this._private(
            type: RestRequestType.get,
            relativeUrlPath: relativePath,
            queryArgs: queryArgs,
            headers: headers,
            bodyJson: null,
            additionalQueryArgsString: additionalQueryArgsString);

  RestRequest.head({
    @required String relativePath,
    Map<String, String> queryArgs,
    Map<String, String> headers,
    String additionalQueryArgsString,
  }) : this._private(
            type: RestRequestType.head,
            relativeUrlPath: relativePath,
            queryArgs: queryArgs,
            headers: headers,
            bodyJson: null,
            additionalQueryArgsString: additionalQueryArgsString);

  RestRequest.delete({
    @required String relativePath,
    Map<String, String> queryArgs,
    Map<String, String> headers,
    String additionalQueryArgsString,
  }) : this._private(
            type: RestRequestType.delete,
            relativeUrlPath: relativePath,
            queryArgs: queryArgs,
            headers: headers,
            bodyJson: null,
            additionalQueryArgsString: additionalQueryArgsString);

  RestRequest.post({
    @required String relativePath,
    Map<String, String> queryArgs,
    Map<String, String> headers,
    Map<String, String> bodyJson,
    String additionalQueryArgsString,
  }) : this._private(
            type: RestRequestType.post,
            relativeUrlPath: relativePath,
            queryArgs: queryArgs,
            headers: headers,
            bodyJson: bodyJson,
            additionalQueryArgsString: additionalQueryArgsString);

  RestRequest.put({
    @required String relativePath,
    Map<String, String> queryArgs,
    Map<String, String> headers,
    Map<String, String> bodyJson,
    String additionalQueryArgsString,
  }) : this._private(
            type: RestRequestType.put,
            relativeUrlPath: relativePath,
            queryArgs: queryArgs,
            headers: headers,
            bodyJson: bodyJson,
            additionalQueryArgsString: additionalQueryArgsString);

  RestRequest.patch({
    @required String relativePath,
    Map<String, String> queryArgs,
    Map<String, String> headers,
    Map<String, String> bodyJson,
    String additionalQueryArgsString,
  }) : this._private(
            type: RestRequestType.patch,
            relativeUrlPath: relativePath,
            queryArgs: queryArgs,
            headers: headers,
            bodyJson: bodyJson,
            additionalQueryArgsString: additionalQueryArgsString);

  @override
  String toString() {
    return 'RestRequest{type: $type, '
        ' relativePath: $relativeUrlPath, queryArgs: $queryArgs,'
        ' bodyJson: $bodyJson, headers: $headers';
  }
}

class UploadMultipartRestRequest<T> extends RestRequest<T> {
  final Map<String, File> files;

  UploadMultipartRestRequest.get({
    @required String relativePath,
    @required this.files,
    Map<String, String> queryArgs,
    Map<String, String> headers,
    String additionalQueryArgsString,
  }) : super.get(
            relativePath: relativePath,
            queryArgs: queryArgs,
            headers: headers,
            additionalQueryArgsString: additionalQueryArgsString);

  UploadMultipartRestRequest.delete({
    @required String relativePath,
    @required this.files,
    Map<String, String> queryArgs,
    Map<String, String> headers,
    String additionalQueryArgsString,
  }) : super.delete(
            relativePath: relativePath,
            queryArgs: queryArgs,
            headers: headers,
            additionalQueryArgsString: additionalQueryArgsString);

  UploadMultipartRestRequest.head({
    @required String relativePath,
    @required this.files,
    Map<String, String> queryArgs,
    Map<String, String> headers,
    String additionalQueryArgsString,
  }) : super.head(
            relativePath: relativePath,
            queryArgs: queryArgs,
            headers: headers,
            additionalQueryArgsString: additionalQueryArgsString);

  UploadMultipartRestRequest.post({
    @required String relativePath,
    @required this.files,
    Map<String, String> queryArgs,
    Map<String, String> headers,
    Map<String, String> bodyJson,
    String additionalQueryArgsString,
  }) : super.post(
            relativePath: relativePath,
            queryArgs: queryArgs,
            headers: headers,
            bodyJson: bodyJson,
            additionalQueryArgsString: additionalQueryArgsString);

  UploadMultipartRestRequest.put({
    @required String relativePath,
    @required this.files,
    Map<String, String> queryArgs,
    Map<String, String> headers,
    Map<String, String> bodyJson,
    String additionalQueryArgsString,
  }) : super.put(
            relativePath: relativePath,
            queryArgs: queryArgs,
            headers: headers,
            bodyJson: bodyJson,
            additionalQueryArgsString: additionalQueryArgsString);

  UploadMultipartRestRequest.patch({
    @required String relativePath,
    @required this.files,
    Map<String, String> queryArgs,
    Map<String, String> headers,
    Map<String, String> bodyJson,
    String additionalQueryArgsString,
  }) : super.patch(
            relativePath: relativePath,
            queryArgs: queryArgs,
            headers: headers,
            bodyJson: bodyJson,
            additionalQueryArgsString: additionalQueryArgsString);
}
