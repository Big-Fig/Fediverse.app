import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/refactored/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/refactored/pleroma/rest/pleroma_rest_service_impl.dart';
import 'package:fedi/refactored/connection/connection_service.dart';
import 'package:fedi/refactored/rest/rest_request_model.dart';
import 'package:fedi/refactored/rest/rest_service.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class PleromaAuthRestService extends PleromaRestService
    implements IPleromaAuthRestService {
  static final authHeaderKey = "authorization";
  static final authHeaderValuePrefix = "Bearer";

  final String accessToken;

  PleromaAuthRestService(
      {@required IRestService restService,
      @required IConnectionService connectionService,
      @required this.accessToken
      })
      : super(restService: restService, connectionService: connectionService);


  Map<String, String> createAuthHeaders() =>
      {"authorization": "Bearer $accessToken"};

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
}
