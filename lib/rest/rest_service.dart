import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

abstract class IRestService extends IDisposable {
  static IRestService of(BuildContext context, {listen = true}) =>
      Provider.of<IRestService>(context, listen: listen);

  Uri get baseUri;

  Future<Response> sendHttpRequest<T extends RestRequest, K>(T request);

  Future<Response>
      uploadFileMultipartRequest<T extends UploadMultipartRestRequest, K>(
    T request,
  );
}
