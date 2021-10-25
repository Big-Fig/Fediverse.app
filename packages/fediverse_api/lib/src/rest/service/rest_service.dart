import 'dart:convert';

import 'package:easy_dispose/easy_dispose.dart';

import '../../json/json_model.dart';
import '../request/rest_request_model.dart';
import '../response/error/rest_response_error_model.dart';
import '../response/parsed/rest_parsed_response_model.dart';
import '../response/rest_response_model.dart';

// ignore_for_file: no-magic-number

typedef RestResultParser<Req, Res> = Res Function(Req body);

abstract class IRestService extends IDisposable {
  static const defaultSimpleRequestTimeout = Duration(seconds: 20);
  static const defaultMultipartRequestTimeout = Duration(seconds: 300);

  // ignore: avoid-non-null-assertion
  static final Encoding defaultEncoding = Encoding.getByName('utf-8')!;

  Encoding get encoding;

  Duration get simpleRequestTimeout;

  Duration get multipartRequestTimeout;

  Uri get baseUri;

  bool get parseInIsolateByDefault;

  Stream<IRestResponseError> get errorStream;

  Future<IRestResponse> sendHttpRequest<T extends IRestRequest>({
    required T request,
  });

  Future<IParsedRestResponse<K>>
      sendHttpRequestAndParse<T extends IRestRequest, K>({
    required T request,
    required RestResultParser<String, K> parser,
    required bool? parseInIsolateOverride,
  });

  Future<IParsedRestResponse<K>>
      sendHttpRequestAndParseJson<T extends IRestRequest, K extends IJsonObj?>({
    required T request,
    required JsonParser<K> jsonParser,
    bool? parseInIsolateOverride,
  });

  Future<IParsedRestResponse<List<K>>> sendHttpRequestAndParseJsonList<
      T extends IRestRequest, K extends IJsonObj>({
    required T request,
    required JsonParser<K> jsonParser,
    bool? parseInIsolateOverride,
  });

  Future<IParsedRestResponse<List<String>>>
      sendHttpRequestAndParseStringList<T extends IRestRequest>({
    required T request,
    bool? parseInIsolateOverride,
  });
}
