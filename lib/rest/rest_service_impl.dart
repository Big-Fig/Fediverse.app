import 'dart:convert';

import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/rest/error/rest_error_model.dart';
import 'package:fedi/rest/rest_model.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:rxdart/rxdart.dart';

Map<RestRequestType, String> requestTypeToStringMap = {
  RestRequestType.get: "get",
  RestRequestType.head: "head",
  RestRequestType.post: "post",
  RestRequestType.put: "put",
  RestRequestType.delete: "delete",
  RestRequestType.patch: "patch",
};

var urlPath = p.Context(style: p.Style.url);
final Encoding _defaultEncoding = Encoding.getByName("utf-8");

final Logger _logger = Logger("rest_bloc.dart");

const successResponseStatusCode = 200;

class RestService extends DisposableOwner implements IRestService {
  // ignore: close_sinks
  final BehaviorSubject<RestHttpError> _lastErrorSubject = BehaviorSubject();

  Stream<RestHttpError> get lastErrorStream => _lastErrorSubject.stream;

  String get baseUrl => CurrentInstance.instance.currentClient.baseURL;

  Future<http.Response> sendHttpRequest<T extends RestRequest, K>(
      T request) async {
    assert(request.relativeUrlPath != null);
    assert(request.type != null);
    var url = createUrl(
        baseUrl: baseUrl,
        relativeUrlPath: request.relativeUrlPath,
        additionalQueryArgsString: request.additionalQueryArgsString,
        queryArgs: request.queryArgs);

    _logger.fine(() => "start send $url request $request");

    String body;

    http.Response response;
    var requestType = request.type;

    _logger.fine(() => "start sendHttpRequest \n"
        "\t url($requestType): $url \n"
        "\t headers: ${request.headers} \n"
        "\t bodyJson: ${request.bodyJson} \n");
    var requestBodyJson = json.encode(request.bodyJson);
    var requestHeaders = Map<String, String>();
    requestHeaders.addAll(request.headers);
    if (request.bodyJson?.isNotEmpty == true) {
      requestHeaders["Content-Type"] = "application/json";
    }
    switch (request.type) {
      case RestRequestType.get:
        assert(body?.isNotEmpty != true);
        response = await http.get(url, headers: requestHeaders);
        break;
      case RestRequestType.post:
        response = await http.post(url,
            headers: requestHeaders,
            body: requestBodyJson,
            encoding: _defaultEncoding);
        break;
      case RestRequestType.patch:
        response = await http.patch(url,
            headers: requestHeaders,
            body: requestBodyJson,
            encoding: _defaultEncoding);
        break;
      case RestRequestType.delete:
        assert(body?.isNotEmpty != true);
        response = await http.delete(url, headers: requestHeaders);
        break;
      case RestRequestType.put:
        response = await http.put(url,
            headers: requestHeaders,
            body: requestBodyJson,
            encoding: _defaultEncoding);
        break;
      case RestRequestType.head:
        assert(body?.isNotEmpty != true);
        response = await http.head(url, headers: requestHeaders);
        break;
    }

    var log = () => "response sendHttpRequest \n"
        "\t url($requestType): $url \n"
        "\t response(${response.statusCode}): ${response.body}";
    if (response.statusCode == 200) {
      _logger.fine(log);
    } else {
      _logger.shout(log);
    }

    _logger.fine(() => "response $response");
    return response;
  }

  static Uri createUrl(
      {@required String baseUrl,
      @required String relativeUrlPath,
      String additionalQueryArgsString,
      Map<String, String> queryArgs}) {
    var urlWithoutArgs = urlPath.join(baseUrl, relativeUrlPath);

    var filteredQueryArgs =
        queryArgs?.entries?.where((entry) => entry.value?.isNotEmpty == true);

    var url;
    if (filteredQueryArgs?.isNotEmpty == true ||
        additionalQueryArgsString != null) {
      String queryString;
      if (filteredQueryArgs != null) {
        queryString =
            "${filteredQueryArgs.map((entry) => "${entry.key}=${entry.value}").join("&")}";
      } else {
        queryString = "";
      }

      if (additionalQueryArgsString != null) {
        if (queryString?.isNotEmpty == true) {
          queryString += "&";
        }

        queryString += additionalQueryArgsString;
      }

      url = "$urlWithoutArgs?$queryString";
    } else {
      url = urlWithoutArgs;
    }

    return Uri.parse(url);
  }

  Future<http.MultipartFile> createMultipartFile(
      String path, String fileParamKey) async {
    return await http.MultipartFile.fromPath(fileParamKey, path,
        filename: p.basename(path));
  }

  static Map<String, String> buildJsonTypeHeaders() {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  }

  @override
  Future<http.Response>
      uploadFileMultipartRequest<T extends UploadMultipartRestRequest, K>(
          T request) async {
    assert(request.relativeUrlPath != null);
    assert(request.type != null);

    if(request.bodyJson?.isNotEmpty == true) {
      throw UnsupportedError("bodyJson not supported yet for multipart "
          "request");
    }
    var url = createUrl(
        baseUrl: baseUrl,
        relativeUrlPath: request.relativeUrlPath,
        additionalQueryArgsString: request.additionalQueryArgsString,
        queryArgs: request.queryArgs);

    _logger.fine(() => "start send $url request $request");
    var requestType = request.type;
    var httpMethodString = requestTypeToStringMap[requestType];
    var multipartRequest = new http.MultipartRequest(
      httpMethodString,
      url,
    );
    multipartRequest.headers.addAll(request.headers);

    for (var fileEntry in request.files.entries) {
      multipartRequest.files
          .add(await createMultipartFile(fileEntry.value.path, fileEntry.key));
    }

    _logger.fine(() => "start multipartFileRequest \n"
        "\t url($requestType): $url \n"
        "\t headers: ${request.headers} \n"
        "\t files: ${request.files} \n");
    var streamedResponse = await multipartRequest.send();

    var response = await http.Response.fromStream(streamedResponse);

    var log = () => "response multipartFileRequest \n"
        "\t url($requestType): $url \n"
        "\t response(${response.statusCode}): ${response.body}";
    if (response.statusCode == 200) {
      _logger.fine(log);
    } else {
      _logger.shout(log);
    }

    return response;
  }
}
