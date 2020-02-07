import 'dart:io';

import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

abstract class IPleromaRestService {
  Future<http.Response> httpRequest({@required HTTPMethod httpMethod});

  Future<http.Response> uploadFileMultipartRequest(
      {@required String relativeUrlPath,
      @required HTTPMethod httpMethod,
      @required File file,
      @required String fileParamKey});
}
