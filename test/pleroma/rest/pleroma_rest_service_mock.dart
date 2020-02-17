import 'package:fedi/Pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/src/response.dart';

class PleromaRestServiceMock extends IPleromaRestService {
  @override
  String baseUrl;

  Function(RestRequest request) sendHttpRequestMock;
  Function(UploadMultipartRestRequest request) uploadFileMultipartRequestMock;

  final Map<RestRequest, Response> httpRequestToResponse = Map();
  final Map<UploadMultipartRestRequest, Response> uploadRequestToResponse = Map();

  PleromaRestServiceMock({@required this.baseUrl});

  @override
  void dispose() {
    // nothing
  }

  @override
  Future<Response> sendHttpRequest<T extends RestRequest, K>(T request) {
    var response;
    if(sendHttpRequestMock != null) {
      response = sendHttpRequestMock(request);
    }

    httpRequestToResponse[request] = response;
    return response;
  }

  @override
  Future<Response>
      uploadFileMultipartRequest<T extends UploadMultipartRestRequest, K>(
          T request) {
    var response;
    if(uploadFileMultipartRequestMock != null) {
      response = uploadFileMultipartRequestMock(request);
    }

    uploadRequestToResponse[request] = response;
    return response;
  }
}
