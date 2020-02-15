import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/mastodon/rest/mastodon_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

class MastodonRestService implements IMastodonRestService {
  static final authHeaderKey = "authorization";
  static final authHeaderValuePrefix = "Bearer";

  final IRestService restService;

  @override
  String get baseUrl => restService.baseUrl;

  MastodonRestService(
      {@required
          this.restService}); // Should be reworked to final config fields
  String get accessToken => CurrentInstance.instance.currentClient.accessToken;

  Map<String, String> createAuthHeaders() =>
      {"authorization": "Bearer $accessToken"};

  @override
  Future<Response> sendHttpRequest<T extends RestRequest, K>(T request) {
    request.headers.addAll(createAuthHeaders());
    return restService.sendHttpRequest(request);
  }

  @override
  Future<Response>
      uploadFileMultipartRequest<T extends UploadMultipartRestRequest, K>(
          T request) {
    request.headers.addAll(createAuthHeaders());
    return restService.uploadFileMultipartRequest(request);
  }

  @override
  void dispose() {
    // nothing
  }
}
