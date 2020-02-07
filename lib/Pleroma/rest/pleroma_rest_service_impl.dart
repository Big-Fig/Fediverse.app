import 'dart:io';

import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/rest/pleroma_rest_service.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:path/path.dart';

var _logger = Logger("pleroma_rest_service_impl.dart");

class PleromaRestService extends IPleromaRestService {
  static final authHeaderKey = "authorization";
  static final authHeaderValuePrefix = "Bearer";

  String get accessToken => CurrentInstance.instance.currentClient.accessToken;
  String get baseUrl => CurrentInstance.instance.currentClient.baseURL;

  Map<String, String> createAuthHeaders() =>
      {"authorization": "Bearer $accessToken"};

  Uri createUrl({@required String relativeUrlPath}) =>
      Uri.parse("$baseUrl$relativeUrlPath");

  Future<http.Response> uploadFileMultipartRequest(
      {@required String relativeUrlPath,
      @required HTTPMethod httpMethod,
      @required File file,
      @required String fileParamKey}) async {
    var url = createUrl(relativeUrlPath: relativeUrlPath);
    var request = new http.MultipartRequest(
      httpMethod.toString(),
      url,
    );
    request.headers.addAll(createAuthHeaders());

    var path = file.path;
    var multipartFile = await createMultipartFile(path, fileParamKey);
    request.files.add(multipartFile);

    var streamedResponse = await request.send();

    var response = await http.Response.fromStream(streamedResponse);

    var log = () => "multipartFileRequest \n"
        "file: ${file.path} \n"
        "url: $url \n"
        "response(${response.statusCode}): ${response.body}";
    if (response.statusCode == 200) {
      _logger.fine(log);
    } else {
      _logger.warning(log);
    }

    return response;
  }

  Future<http.MultipartFile> createMultipartFile(
      String path, String fileParamKey) async {
    return await http.MultipartFile.fromPath(fileParamKey, path,
        filename: basename(path));
  }

  @override
  Future<http.Response> httpRequest({@required HTTPMethod httpMethod}) {
    throw UnimplementedError();
  }
}
