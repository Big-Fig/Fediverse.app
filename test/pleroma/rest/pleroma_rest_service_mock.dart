import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:http/src/response.dart';

class PleromaRestServiceMock extends DisposableOwner
    implements IPleromaRestService {
  @override
  final Uri baseUri;

  Function(RestRequest request)? sendHttpRequestMock;
  Function(UploadMultipartRestRequest request)? uploadFileMultipartRequestMock;

  final Map<RestRequest, Response?> httpRequestToResponse = {};
  final Map<UploadMultipartRestRequest, Response?> uploadRequestToResponse = {};

  PleromaRestServiceMock({
    required this.baseUri,
  });

  @override
  Future dispose() async {
    return await super.dispose();
  }

  @override
  Future<Response> sendHttpRequest<T extends RestRequest, K>(T request) {
    var response;
    if (sendHttpRequestMock != null) {
      response = sendHttpRequestMock!(request);
    }

    httpRequestToResponse[request] = response;
    return response;
  }

  @override
  Future<Response>
      uploadFileMultipartRequest<T extends UploadMultipartRestRequest, K>(
          T request) {
    var response;
    if (uploadFileMultipartRequestMock != null) {
      response = uploadFileMultipartRequestMock!(request);
    }

    uploadRequestToResponse[request] = response;
    return response;
  }

  @override
  bool get isConnected => throw UnimplementedError();

  @override
  Stream<bool> get isConnectedStream => throw UnimplementedError();

  @override
  bool get isApiReadyToUse => throw UnimplementedError();

  @override
  Stream<bool> get isApiReadyToUseStream => throw UnimplementedError();

  @override
  PleromaApiState get pleromaApiState => throw UnimplementedError();

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      throw UnimplementedError();

  @override
  IRestService get restService => this;
}
