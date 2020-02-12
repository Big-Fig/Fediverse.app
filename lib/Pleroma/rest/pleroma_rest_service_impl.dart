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

class PleromaRestService extends IPleromaRestService {
  static final authHeaderKey = "authorization";
  static final authHeaderValuePrefix = "Bearer";

  // Should be reworked to final config fields
  String get accessToken => CurrentInstance.instance.currentClient.accessToken;
  String get baseUrl => CurrentInstance.instance.currentClient.baseURL;

  Map<String, String> createAuthHeaders() =>
      {"authorization": "Bearer $accessToken"};

  Uri createUrl({@required String relativeUrlPath}) =>
      Uri.parse(urlPath.join(baseUrl, relativeUrlPath));

  Future<http.Response> uploadFileMultipartRequest(
      {@required String relativeUrlPath,
      @required HTTPMethod httpMethod,
      @required File file,
      @required String fileParamKey}) async {
    var url = createUrl(relativeUrlPath: relativeUrlPath);
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
  Future<http.Response> httpRequest({@required HTTPMethod httpMethod}) {
    throw UnimplementedError();
  }
}
