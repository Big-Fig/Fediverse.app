import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/rest/rest_request_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

abstract class IRestService extends Disposable {

  static IRestService of(BuildContext context, {listen: true}) =>
      Provider.of<IRestService>(context, listen: listen);

  Uri get baseUrl;

  Future<Response> sendHttpRequest<T extends RestRequest, K>(T request);

  Future<Response>
      uploadFileMultipartRequest<T extends UploadMultipartRestRequest, K>(
          T request);
}
