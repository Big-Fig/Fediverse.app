import 'dart:async';
import 'dart:convert';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path_lib;

import '../../../json/json_model.dart';
import '../../../url/query/arg/url_query_arg_model.dart';
import '../../../url/url_path_helper.dart';
import '../../header/rest_header_helper.dart';
import '../../request/rest_request_model.dart';
import '../../request/rest_request_model_impl.dart';
import '../../response/code/type/rest_response_code_type_sealed.dart';
import '../../response/error/exception/rest_response_error_exception_impl.dart';
import '../../response/error/rest_response_error_model.dart';
import '../../response/error/rest_response_error_model_impl.dart';
import '../../response/parsed/rest_parsed_response_model.dart';
import '../../response/parsed/rest_parsed_response_model_impl.dart';
import '../../response/rest_response_model.dart';
import '../../response/rest_response_model_impl.dart';
import '../rest_service.dart';

final Logger _logger = Logger('http_rest_service_impl.dart');

// ignore: one_member_abstracts
abstract class ComputeImpl {
  Future<T> perform<T, K>(
    T Function(K arg) func,
    K arg,
  );
}

typedef RestResponseErrorExceptionCreator = Exception Function(
  RestResponseError restResponseError,
);

class HttpRestService extends DisposableOwner implements IRestService {
  // ignore: close_sinks
  final StreamController<IRestResponseError> errorStreamController =
      StreamController.broadcast();

  @override
  Stream<IRestResponseError> get errorStream => errorStreamController.stream;

  @override
  final Uri baseUri;

  @override
  final Duration multipartRequestTimeout;

  @override
  final Duration simpleRequestTimeout;

  @override
  final bool parseInIsolateByDefault;

  @override
  final Encoding encoding;

  final ComputeImpl? computeImpl;
  final RestResponseErrorExceptionCreator?
      customRestResponseErrorExceptionCreator;

  HttpRestService({
    required this.baseUri,
    required this.encoding,
    required this.computeImpl,
    required this.customRestResponseErrorExceptionCreator,
    this.simpleRequestTimeout = IRestService.defaultSimpleRequestTimeout,
    this.multipartRequestTimeout = IRestService.defaultMultipartRequestTimeout,
    this.parseInIsolateByDefault = false,
  });

  @override
  Future<IRestResponse> sendHttpRequest<T extends IRestRequest>({
    required T request,
  }) async {
    var files = request.files;

    return files != null && files.isNotEmpty
        ? await uploadFileMultipartRequest(request)
        : await sendSimpleHttpRequest(request);
  }

  @override
  Future<IParsedRestResponse<K>>
      sendHttpRequestAndParse<T extends IRestRequest, K>({
    required T request,
    required RestResultParser<String, K> parser,
    required bool? parseInIsolateOverride,
  }) async {
    var rawResponse = await sendHttpRequest(request: request);

    // ignore: avoid-non-null-assertion
    var content = rawResponse.content!;

    var isNeedCompute =
        parseInIsolateOverride == true || parseInIsolateByDefault;

    var computeImpl = this.computeImpl;
    var parsedObj = isNeedCompute && computeImpl != null
        ? await computeImpl.perform(parser, content)
        : parser(content);

    return ParsedRestResponse<K>(
      result: parsedObj,
      request: request.toRestRequest(),
      statusCode: rawResponse.statusCode,
      content: content,
    );
  }

  @override
  Future<IParsedRestResponse<K>>
      sendHttpRequestAndParseJson<T extends IRestRequest, K extends IJsonObj?>({
    required T request,
    required JsonParser<K> jsonParser,
    bool? parseInIsolateOverride,
  }) =>
          sendHttpRequestAndParse(
            request: request,
            parser: (String content) {
              var json = jsonDecode(content) as Map<String, dynamic>;

              return jsonParser(json);
            },
            parseInIsolateOverride: parseInIsolateOverride,
          );

  @override
  Future<IParsedRestResponse<List<K>>> sendHttpRequestAndParseJsonList<
          T extends IRestRequest, K extends IJsonObj>({
    required T request,
    required JsonParser<K> jsonParser,
    bool? parseInIsolateOverride,
  }) =>
      sendHttpRequestAndParse(
        request: request,
        parser: (String content) {
          dynamic json = jsonDecode(content);
          var jsonList = json as List;

          return List<K>.generate(
            jsonList.length,
            (index) {
              dynamic jsonItem = jsonList[index];
              var item = jsonParser(jsonItem as Map<String, dynamic>);

              return item;
            },
            growable: false,
          );
        },
        parseInIsolateOverride: parseInIsolateOverride,
      );

  // ignore: long-method
  Future<IRestResponse> sendSimpleHttpRequest(
    IRestRequest request,
  ) async {
    var uri = createUri(
      baseUri: baseUri,
      relativeUrlPath: request.relativeUrlPath,
      queryArgs: request.queryArgs,
    );

    _logger.fine(
      () => 'start send $uri '
          'port ${uri.port} '
          'request $request',
    );

    String? body;

    var requestType = request.type;
    var bodyJson = request.bodyJson;
    bodyJson?.removeWhere((key, dynamic value) => value == null);
    if (bodyJson?.isEmpty == true) {
      bodyJson = null;
    }
    String? requestBodyJson;
    if (bodyJson != null) {
      requestBodyJson = json.encode(bodyJson);
    }

    var requestHeaders = <String, String>{};
    var headers = request.headers;
    if (headers != null && headers.isNotEmpty) {
      var headersMap = RestHeaderHelper.toMap(headers);
      requestHeaders.addAll(headersMap);
    }
    Encoding? encoding;
    if (bodyJson?.isNotEmpty == true) {
      requestHeaders['Content-Type'] = 'application/json';
      encoding = encoding;
    }

    _logger.fine(
      () => 'start sendHttpRequest \n'
          '\t url($requestType): $uri \n'
          '\t headers: $headers \n'
          '\t requestBodyJson: $requestBodyJson \n'
          '\t encoding: $encoding \n',
    );

    var httpResponseFuture = requestType.map(
      get: (_) {
        assert(
          body?.isNotEmpty != true,
          "body shouldn't be empty for GET response",
        );

        return http.get(
          uri,
          headers: requestHeaders,
        );
      },
      post: (_) => http.post(
        uri,
        headers: requestHeaders,
        body: requestBodyJson,
        encoding: encoding,
      ),
      head: (_) {
        assert(
          body?.isNotEmpty != true,
          "body shouldn't be empty for HEAD response",
        );

        return http.head(
          uri,
          headers: requestHeaders,
        );
      },
      put: (_) => http.put(
        uri,
        headers: requestHeaders,
        body: requestBodyJson,
        encoding: encoding,
      ),
      patch: (_) => http.patch(
        uri,
        headers: requestHeaders,
        body: requestBodyJson,
        encoding: encoding,
      ),
      delete: (_) {
        var request = http.Request('DELETE', uri);
        if (requestBodyJson != null &&
            encoding != null &&
            requestBodyJson.isNotEmpty) {
          request.body = requestBodyJson;
          // ignore: cascade_invocations
          request.encoding = encoding;
        }
        if (requestHeaders.isNotEmpty) {
          request.headers.addAll(requestHeaders);
        }

        return http.Client().send(request).then(http.Response.fromStream);
      },
    );

    httpResponseFuture = httpResponseFuture.timeout(
      simpleRequestTimeout,
      onTimeout: () => throw TimeoutException(
        'TimeoutReached',
        simpleRequestTimeout,
      ),
    );

    var response = await httpResponseFuture;

    return processResponse(
      request: request,
      response: response,
    );
  }

  static Uri createUri({
    required Uri baseUri,
    required String relativeUrlPath,
    List<UrlQueryArg>? queryArgs,
  }) {
    var urlWithoutArgs = UrlPathHelper.join(
      [
        baseUri.toString(),
        relativeUrlPath,
      ],
    );

    var filteredQueryArgs = queryArgs?.where((arg) => arg.value.isNotEmpty);

    String url;
    if (filteredQueryArgs?.isNotEmpty == true) {
      String queryString;
      if (filteredQueryArgs != null) {
        queryString = filteredQueryArgs.toQueryPart();
        queryString = queryString.replaceAll(' ', '%20');
      } else {
        queryString = '';
      }

      url = '$urlWithoutArgs?$queryString';
    } else {
      url = urlWithoutArgs;
    }

    return Uri.parse(url);
  }

  Future<http.MultipartFile> createMultipartFile(
    String path,
    String fileParamKey,
  ) =>
      http.MultipartFile.fromPath(
        fileParamKey,
        path,
        filename: path_lib.basename(path),
      );

  static Map<String, String> buildJsonTypeHeaders() => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

  // ignore: long-method
  Future<IRestResponse> uploadFileMultipartRequest(
    IRestRequest request,
  ) async {
    var requestType = request.type;
    var files = request.files;
    var headers = request.headers;
    assert(files != null, 'files required for multipart request');

    var url = createUri(
      baseUri: baseUri,
      relativeUrlPath: request.relativeUrlPath,
      queryArgs: request.queryArgs,
    );

    _logger.fine(() => 'start send $url request $request');
    var httpMethodString = requestType.stringValue;
    var multipartRequest = http.MultipartRequest(
      httpMethodString,
      url,
    );

    if (headers != null) {
      var headersMap = RestHeaderHelper.toMap(headers);
      multipartRequest.headers.addAll(headersMap);
    }

    if (files != null) {
      for (final fileEntry in files.entries) {
        multipartRequest.files.add(
          await createMultipartFile(
            fileEntry.value.path,
            fileEntry.key,
          ),
        );
      }
    }

    var bodyJson = request.bodyJson;
    if (bodyJson != null) {
      for (final field in bodyJson.entries) {
        var value = field.value as String?;
        if (value != null) {
          multipartRequest.fields[field.key] = value;
        }
      }
    }

    _logger.fine(
      () => 'start multipartFileRequest \n'
          '\t url($requestType): $url \n'
          '\t headers: $headers \n'
          '\t bodyJson: $bodyJson \n'
          '\t files: $files \n',
    );
    var sendFuture = multipartRequest.send();
    sendFuture = sendFuture.timeout(
      multipartRequestTimeout,
      onTimeout: () => throw TimeoutException(
        'TimeoutReached',
        multipartRequestTimeout,
      ),
    );
    var streamedResponse = await sendFuture;

    var response = await http.Response.fromStream(streamedResponse);

    return processResponse(
      request: request,
      response: response,
    );
  }

  Future<IRestResponse> processResponse({
    required IRestRequest request,
    required http.Response response,
  }) async {
    // ignore: prefer_function_declarations_over_variables
    var log = () => 'processResponse \n'
        '\t $request \n'
        '\t response(${response.statusCode}): ${response.body}';

    var statusCode = response.statusCode;

    var responseCodeType = RestResponseCodeType.detectByStatusCode(statusCode);

    if (responseCodeType == RestResponseCodeType.successValue) {
      _logger.finest(log);

      return RestResponse(
        request: request.toRestRequest(),
        statusCode: statusCode,
        content: response.body,
      );
    } else {
      _logger.shout(log);
      var restResponseError = RestResponseError(
        request: request.toRestRequest(),
        statusCode: statusCode,
        content: response.body,
      );
      var customRestResponseErrorExceptionCreator =
          this.customRestResponseErrorExceptionCreator;
      if (customRestResponseErrorExceptionCreator != null) {
        throw customRestResponseErrorExceptionCreator(
          restResponseError,
        );
      } else {
        throw RestResponseErrorException(
          restResponseError: restResponseError,
        );
      }
    }
  }

  @override
  Future<IParsedRestResponse<List<String>>>
      sendHttpRequestAndParseStringList<T extends IRestRequest>({
    required T request,
    bool? parseInIsolateOverride,
  }) =>
          sendHttpRequestAndParse(
            request: request,
            parser: (String content) {
              var json = jsonDecode(content) as Map<String, dynamic>;
              var jsonList = json as List;

              return List<String>.generate(
                jsonList.length,
                (index) {
                  dynamic jsonItem = jsonList[index];

                  return jsonItem.toString();
                },
                growable: false,
              );
            },
            parseInIsolateOverride: parseInIsolateOverride,
          );
}
