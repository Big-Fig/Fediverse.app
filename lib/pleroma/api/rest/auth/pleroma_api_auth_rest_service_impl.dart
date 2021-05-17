import 'dart:io';

import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_service_impl.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:http/http.dart';

class PleromaAuthRestService extends PleromaApiRestService
    implements IPleromaApiAuthRestService {
  static final authHeaderKey = 'authorization';
  static final authHeaderValuePrefix = 'Bearer';

  @override
  final bool isPleroma;

  final String accessToken;

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
      {HttpHeaders.authorizationHeader: 'Bearer $accessToken'};

  @override
  Future<Response> sendHttpRequest<T extends RestRequest, K>(T request) {
    request.headers.addAll(createAuthHeaders());

    return super.sendHttpRequest(request);
  }

  @override
  Future<Response>
      uploadFileMultipartRequest<T extends UploadMultipartRestRequest, K>(
    T request,
  ) {
    request.headers.addAll(createAuthHeaders());

    return super.uploadFileMultipartRequest(request);
  }

  @override
  // todo: check when new backend type added
  bool get isMastodon => !isPleroma;
}
