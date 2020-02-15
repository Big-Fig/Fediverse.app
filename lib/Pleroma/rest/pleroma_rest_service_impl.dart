import 'dart:io';

import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/rest/pleroma_rest_service.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;

var urlPath = p.Context(style: p.Style.url);
var _logger = Logger("pleroma_rest_service_impl.dart");

Map<HTTPMethod, String> httpMethodToStringMap = {
  HTTPMethod.GET: "get",
  HTTPMethod.HEAD: "head",
  HTTPMethod.POST: "post",
  HTTPMethod.PUT: "put",
  HTTPMethod.DELETE: "delete",
  HTTPMethod.PATCH: "patch",
};

class PleromaRestService extends IPleromaRestService {
  static final authHeaderKey = "authorization";
  static final authHeaderValuePrefix = "Bearer";

  // Should be reworked to final config fields
  String get accessToken => CurrentInstance.instance.currentClient.accessToken;

  String get baseUrl => CurrentInstance.instance.currentClient.baseURL;

  Map<String, String> createAuthHeaders() =>
      {"authorization": "Bearer $accessToken"};

  static Uri createUrl(
      {@required baseUrl,
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

  Future<http.Response> uploadFileMultipartRequest(
      {@required String relativeUrlPath,
      @required HTTPMethod httpMethod,
      @required File file,
      @required String fileParamKey}) async {
    var url = createUrl(baseUrl: baseUrl, relativeUrlPath: relativeUrlPath);
    var httpMethodString = httpMethodToStringMap[httpMethod];
    var request = new http.MultipartRequest(
      httpMethodString,
      url,
    );
    request.headers.addAll(createAuthHeaders());

    var path = file.path;
    var multipartFile = await createMultipartFile(path, fileParamKey);
    request.files.add(multipartFile);

    _logger.fine(() => "start multipartFileRequest \n"
        "\t url($httpMethod): $url \n"
        "\t headers: ${request.headers} \n"
        "\t file($fileParamKey): ${file.path} \n");
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

  @override
  Future<http.Response> httpRequest({
    @required String relativeUrlPath,
    @required HTTPMethod httpMethod,
    Map<String, String> queryArgs,
    String additionalQueryArgsString,
    Map<String, String> bodyArgs,
  }) async {
    assert(relativeUrlPath != null);
    assert(httpMethod != null);

    var url = createUrl(
        baseUrl: baseUrl,
        relativeUrlPath: relativeUrlPath,
        queryArgs: queryArgs,
        additionalQueryArgsString: additionalQueryArgsString);

    var headers = createAuthHeaders();

    _logger.fine(() => "start httpRequest \n"
        "\t url($httpMethod): $url \n"
        "\t headers: $headers \n"
        "\t bodyArgs: $bodyArgs \n");

    var response;
    switch (httpMethod) {
      case HTTPMethod.GET:
        assert(bodyArgs?.isNotEmpty != true);
        response = await http.get(url, headers: headers);
        break;
      case HTTPMethod.HEAD:
        assert(bodyArgs?.isNotEmpty != true);
        response = await http.head(url, headers: headers);
        break;
      case HTTPMethod.POST:
        response = await http.post(url, headers: headers, body: bodyArgs);
        break;
      case HTTPMethod.PUT:
        response = await http.put(url, headers: headers, body: bodyArgs);
        break;
      case HTTPMethod.DELETE:
        assert(bodyArgs?.isNotEmpty != true);
        response = await http.delete(url, headers: headers);
        break;
      case HTTPMethod.PATCH:
        response = await http.patch(url, headers: headers, body: bodyArgs);
        break;
    }

    var log = () => "response httpRequest \n"
        "\t url($httpMethod): $url \n"
        "\t response(${response.statusCode}): ${response.body}";

    if (response.statusCode == 200) {
      _logger.fine(log);
    } else {
      _logger.shout(log);
    }

    return response;
  }
}
