import 'dart:io';

import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

abstract class IPleromaRestService {

  static IPleromaRestService of(BuildContext context,
      {listen: true}) =>
      Provider.of<IPleromaRestService>(context, listen: listen);

  Future<http.Response> httpRequest({@required HTTPMethod httpMethod});

  Future<http.Response> uploadFileMultipartRequest(
      {@required String relativeUrlPath,
      @required HTTPMethod httpMethod,
      @required File file,
      @required String fileParamKey});
}
