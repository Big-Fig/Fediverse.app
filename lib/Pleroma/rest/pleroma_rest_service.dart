import 'dart:io';

import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/rest/pleroma_rest_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

abstract class IPleromaRestService {
  static IPleromaRestService of(BuildContext context, {listen: true}) =>
      Provider.of<IPleromaRestService>(context, listen: listen);

  Future<http.Response> sendHttpRequest<T extends RestRequest, K>(
      T request);

  Future<http.Response> multipartRequest(
      {@required String relativeUrlPath,
      @required HTTPMethod httpMethod,
      @required Map<String, File> files,
      });
}
