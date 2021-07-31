import 'package:easy_dispose/easy_dispose.dart';
import 'rest_request_model.dart';
import 'package:http/http.dart';

abstract class IRestService extends IDisposable {
  Uri get baseUri;

  Future<Response> sendHttpRequest<T extends RestRequest, K>(T request);

  Future<Response>
      uploadFileMultipartRequest<T extends UploadMultipartRestRequest, K>(
    T request,
  );
}
