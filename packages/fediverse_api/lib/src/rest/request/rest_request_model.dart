import 'dart:io';

import '../../url/query/arg/url_query_arg_model.dart';
import '../header/rest_header_model.dart';
import 'type/rest_request_type_sealed.dart';

abstract class IRestRequest {
  RestRequestType get type;

  String get relativeUrlPath;

  List<UrlQueryArg>? get queryArgs;

  Map<String, dynamic>? get bodyJson;

  List<RestHeader>? get headers;

  Map<String, File>? get files;
}
