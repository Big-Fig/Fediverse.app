import 'dart:io';

import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_service_impl.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:http/http.dart';

class PleromaAuthRestService extends PleromaRestService
    implements IPleromaAuthRestService {
  static final authHeaderKey = "authorization";
  static final authHeaderValuePrefix = "Bearer";

  @override
  final bool isPleroma;

  final String? accessToken;

  PleromaAuthRestService({
    required IRestService restService,
    required IConnectionService connectionService,
    required this.isPleroma,
    required this.accessToken,
  }) : super(
          restService: restService,
          connectionService: connectionService,
        );

  Map<String, String> createAuthHeaders() =>
      {HttpHeaders.authorizationHeader: "Bearer $accessToken"};

  @override
  Future<Response> sendHttpRequest<T extends RestRequest, K>(T request) {
    request.headers.addAll(createAuthHeaders());
    return super.sendHttpRequest(request);
  }

  @override
  Future<Response>
      uploadFileMultipartRequest<T extends UploadMultipartRestRequest, K>(
          T request) {
    request.headers.addAll(createAuthHeaders());
    return super.uploadFileMultipartRequest(request);
  }

  @override
  bool get isMastodon => !isPleroma;
}
