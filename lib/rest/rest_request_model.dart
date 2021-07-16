import 'dart:io';

import 'package:fedi/rest/rest_model.dart';

class RestRequest<T> {
  final RestRequestType type;

  final String relativeUrlPath;

  final List<RestRequestQueryArg> queryArgs;
  final Map<String, dynamic> bodyJson;
  final Map<String, String> headers;

  RestRequest._private({
    required this.type,
    required this.relativeUrlPath,
    required List<RestRequestQueryArg>? queryArgs,
    required Map<String, dynamic>? bodyJson,
    required Map<String, String>? headers,
  })  : queryArgs = queryArgs ?? [],
        bodyJson = bodyJson ?? {},
        headers = headers ?? {};

  RestRequest.get({
    required String relativePath,
    List<RestRequestQueryArg>? queryArgs,
    Map<String, String>? headers,
  }) : this._private(
          type: RestRequestType.get,
          relativeUrlPath: relativePath,
          queryArgs: queryArgs,
          headers: headers,
          bodyJson: null,
        );

  RestRequest.head({
    required String relativePath,
    List<RestRequestQueryArg>? queryArgs,
    Map<String, String>? headers,
  }) : this._private(
          type: RestRequestType.head,
          relativeUrlPath: relativePath,
          queryArgs: queryArgs,
          headers: headers,
          bodyJson: null,
        );

  RestRequest.delete({
    required String relativePath,
    List<RestRequestQueryArg>? queryArgs,
    Map<String, String>? headers,
    Map<String, dynamic>? bodyJson,
  }) : this._private(
          type: RestRequestType.delete,
          relativeUrlPath: relativePath,
          queryArgs: queryArgs,
          headers: headers,
          bodyJson: bodyJson,
        );

  RestRequest.post({
    required String relativePath,
    List<RestRequestQueryArg>? queryArgs,
    Map<String, String>? headers,
    Map<String, dynamic>? bodyJson,
  }) : this._private(
          type: RestRequestType.post,
          relativeUrlPath: relativePath,
          queryArgs: queryArgs,
          headers: headers,
          bodyJson: bodyJson,
        );

  RestRequest.put({
    required String relativePath,
    List<RestRequestQueryArg>? queryArgs,
    Map<String, String>? headers,
    Map<String, dynamic>? bodyJson,
  }) : this._private(
          type: RestRequestType.put,
          relativeUrlPath: relativePath,
          queryArgs: queryArgs,
          headers: headers,
          bodyJson: bodyJson,
        );

  RestRequest.patch({
    required String relativePath,
    List<RestRequestQueryArg>? queryArgs,
    Map<String, String>? headers,
    Map<String, dynamic>? bodyJson,
  }) : this._private(
          type: RestRequestType.patch,
          relativeUrlPath: relativePath,
          queryArgs: queryArgs,
          headers: headers,
          bodyJson: bodyJson,
        );

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
    required String relativePath,
    required this.files,
    List<RestRequestQueryArg>? queryArgs,
    Map<String, String>? headers,
  }) : super.get(
          relativePath: relativePath,
          queryArgs: queryArgs,
          headers: headers,
        );

  UploadMultipartRestRequest.delete({
    required String relativePath,
    required this.files,
    List<RestRequestQueryArg>? queryArgs,
    Map<String, String>? headers,
  }) : super.delete(
          relativePath: relativePath,
          queryArgs: queryArgs,
          headers: headers,
        );

  UploadMultipartRestRequest.head({
    required String relativePath,
    required this.files,
    List<RestRequestQueryArg>? queryArgs,
    Map<String, String>? headers,
  }) : super.head(
          relativePath: relativePath,
          queryArgs: queryArgs,
          headers: headers,
        );

  UploadMultipartRestRequest.post({
    required String relativePath,
    required this.files,
    List<RestRequestQueryArg>? queryArgs,
    Map<String, String>? headers,
    Map<String, dynamic>? bodyJson,
  }) : super.post(
          relativePath: relativePath,
          queryArgs: queryArgs,
          headers: headers,
          bodyJson: bodyJson,
        );

  UploadMultipartRestRequest.put({
    required String relativePath,
    required this.files,
    List<RestRequestQueryArg>? queryArgs,
    Map<String, String>? headers,
    Map<String, dynamic>? bodyJson,
  }) : super.put(
          relativePath: relativePath,
          queryArgs: queryArgs,
          headers: headers,
          bodyJson: bodyJson,
        );

  UploadMultipartRestRequest.patch({
    required String relativePath,
    required this.files,
    List<RestRequestQueryArg>? queryArgs,
    Map<String, String>? headers,
    Map<String, dynamic>? bodyJson,
  }) : super.patch(
          relativePath: relativePath,
          queryArgs: queryArgs,
          headers: headers,
          bodyJson: bodyJson,
        );
}

class RestRequestQueryArg {
  final String key;
  final String? value;

  RestRequestQueryArg({
    required this.key,
    required this.value,
  });

  @override
  String toString() {
    return 'RestRequestQueryArg{key: $key, value: $value}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RestRequestQueryArg &&
          runtimeType == other.runtimeType &&
          key == other.key &&
          value == other.value;

  @override
  int get hashCode => key.hashCode ^ value.hashCode;

  static List<RestRequestQueryArg> listFromJson(Map<String, dynamic> json) {
    var queryArgs = <RestRequestQueryArg>[];

    json.entries.forEach((entry) {
      var value = entry.value;
      if (value != null) {
        if (value is Iterable) {
          var iterable = value;
          queryArgs.addAll(
            iterable.map(
              (item) => RestRequestQueryArg(
                key: entry.key,
                value: item.toString(),
              ),
            ),
          );
        } else {
          queryArgs.add(
            RestRequestQueryArg(
              key: entry.key,
              value: entry.value.toString(),
            ),
          );
        }
      }
    });

    return queryArgs;
  }
}
