import 'dart:convert';
import 'dart:io';

import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/rest/pleroma_rest_model.dart';
import 'package:fedi/Pleroma/rest/pleroma_rest_service.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;

final Encoding _defaultEncoding = Encoding.getByName("utf-8");

var urlPath = p.Context(style: p.Style.url);
var _logger = Logger("pleroma_rest_service_impl.dart");

class PleromaRestService extends IPleromaRestService {
  static final authHeaderKey = "authorization";
  static final authHeaderValuePrefix = "Bearer";

  // Should be reworked to final config fields
  String get accessToken => CurrentInstance.instance.currentClient.accessToken;

  String get baseUrl => CurrentInstance.instance.currentClient.baseURL;

  Map<String, String> createAuthHeaders() =>
      {"authorization": "Bearer $accessToken"};

  Future<http.Response> multipartRequest({
    @required String relativeUrlPath,
    @required HTTPMethod httpMethod,
    @required Map<String, File> files,
  }) async {
    var url = createUrl(relativeUrlPath: relativeUrlPath, baseUrl: baseUrl);
    var httpMethodString = httpMethodToStringMap[httpMethod];
    var request = new http.MultipartRequest(
      httpMethodString,
      url,
    );
    request.headers.addAll(createAuthHeaders());

    var filteredFileEntries = files.entries.where((entry) => entry.value != null);
    for (var fileEntry in filteredFileEntries) {
      var path = fileEntry.value.path;
      var multipartFile = await createMultipartFile(path, fileEntry.key);
      request.files.add(multipartFile);
    }


    _logger.fine(() => "start multipartFileRequest \n"
        "\t url($httpMethod): $url \n"
        "\t fields: ${request.fields} \n"
        "\t files: $files \n"
        "\t headers: ${request.headers} \n");

    var streamedResponse = await request.send();

    var response = await http.Response.fromStream(streamedResponse);

    var log = () => "response multipartFileRequest \n"
        "\t url($httpMethod): $url \n"
        "\t response(${response.statusCode}): ${response.body}";
    if (response.statusCode == 200) {
      _logger.fine(log);
    } else {
      _logger.shout(log);
    }

    return response;
  }

  Future<http.MultipartFile> createMultipartFile(
      String path, String fileParamKey) async {
    return await http.MultipartFile.fromPath(fileParamKey, path,
        filename: p.basename(path));
  }

  Future<http.Response> sendHttpRequest<T extends RestRequest, K>(
      T request) async {
    assert(request.relativeUrlPath != null);
    assert(request.type != null);
    var url = createUrl(
        baseUrl: baseUrl,
        relativeUrlPath: request.relativeUrlPath,
        queryArgs: request.queryArgs);

    _logger.fine(() => "start send $url request $request");

    request.headers.addAll(createAuthHeaders());

    String body;

    http.Response response;
    var requestType = request.type;

    var bodyJson = request.bodyJson;
    bodyJson.removeWhere((key, value) => value == null);
    var requestBodyJson = json.encode(bodyJson);
    _logger.fine(() => "start sendHttpRequest \n"
        "\t url($requestType): $url \n"
        "\t headers: ${request.headers} \n"
        "\t bodyJson: $requestBodyJson \n");
    var requestHeaders = Map<String, String>();
    requestHeaders.addAll(request.headers);
    if (bodyJson?.isNotEmpty == true) {
      requestHeaders["Content-Type"] = "application/json";
    }
    switch (request.type) {
      case HTTPMethod.GET:
        assert(body?.isNotEmpty != true);
        response = await http.get(url, headers: requestHeaders);
        break;
      case HTTPMethod.POST:
        response = await http.post(url,
            headers: requestHeaders,
            body: requestBodyJson,
            encoding: _defaultEncoding);
        break;
      case HTTPMethod.PATCH:
        response = await http.patch(url,
            headers: requestHeaders,
            body: requestBodyJson,
            encoding: _defaultEncoding);
        break;
      case HTTPMethod.DELETE:
        assert(body?.isNotEmpty != true);
        response = await http.delete(url, headers: requestHeaders);
        break;
      case HTTPMethod.PUT:
        response = await http.put(url,
            headers: requestHeaders,
            body: requestBodyJson,
            encoding: _defaultEncoding);
        break;
      case HTTPMethod.HEAD:
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
      List<RestRequestQueryArg> queryArgs}) {
    var urlWithoutArgs = urlPath.join(baseUrl, relativeUrlPath);

    var filteredQueryArgs =
        queryArgs?.where((arg) => arg.value?.isNotEmpty == true);

    var url;
    if (filteredQueryArgs?.isNotEmpty == true) {
      String queryString;
      if (filteredQueryArgs != null) {
        queryString =
            "${filteredQueryArgs.map((arg) => "${arg.key}=${arg.value}").join("&")}";
      } else {
        queryString = "";
      }

      url = "$urlWithoutArgs?$queryString";
    } else {
      url = urlWithoutArgs;
    }

    return Uri.parse(url);
  }
}
