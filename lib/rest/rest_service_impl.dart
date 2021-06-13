import 'dart:async';
import 'dart:convert';

import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/rest/error/rest_error_model.dart';
import 'package:fedi/rest/rest_model.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;
import 'package:rxdart/rxdart.dart';

Map<RestRequestType, String> requestTypeToStringMap = {
  RestRequestType.get: 'get',
  RestRequestType.head: 'head',
  RestRequestType.post: 'post',
  RestRequestType.put: 'put',
  RestRequestType.delete: 'delete',
  RestRequestType.patch: 'patch',
};

// ignore: no-magic-number
final _defaultTimeoutDuration = Duration(seconds: 20);
// ignore: no-magic-number
final _uploadTimeoutDuration = Duration(seconds: 300);

var urlPath = p.Context(style: p.Style.url);
final Encoding? _defaultEncoding = Encoding.getByName('utf-8');

final Logger _logger = Logger('rest_service_impl.dart');

class RestService extends DisposableOwner implements IRestService {
  // ignore: close_sinks
  final BehaviorSubject<RestHttpError> _lastErrorSubject = BehaviorSubject();

  Stream<RestHttpError> get lastErrorStream => _lastErrorSubject.stream;

  @override
  final Uri baseUri;

  RestService({
    required this.baseUri,
  });

  @override
  // ignore: long-method
  Future<http.Response> sendHttpRequest<T extends RestRequest, K>(
    T request,
  ) async {
    var url = createUrl(
      baseUri: baseUri,
      relativeUrlPath: request.relativeUrlPath,
      queryArgs: request.queryArgs,
    );

    _logger.fine(() => 'start send $url request $request');

    String? body;

    // ignore: avoid-late-keyword
    late Future<http.Response> responseFuture;
    var requestType = request.type;
    Map<String, dynamic>? bodyJson = request.bodyJson;
    bodyJson.removeWhere((key, value) => value == null);
    if (bodyJson.isEmpty) {
      bodyJson = null;
    }
    String? requestBodyJson;
    if (bodyJson != null) {
      requestBodyJson = json.encode(bodyJson);
    }

    var requestHeaders = <String, String>{};
    requestHeaders.addAll(request.headers);
    Encoding? encoding;
    if (request.bodyJson.isNotEmpty) {
      requestHeaders['Content-Type'] = 'application/json';
      encoding = _defaultEncoding;
    }

    _logger.fine(() => 'start sendHttpRequest \n'
        '\t url($requestType): $url \n'
        '\t headers: ${request.headers} \n'
        '\t requestBodyJson: $requestBodyJson \n'
        '\t encoding: $encoding \n');
    switch (request.type) {
      case RestRequestType.get:
        assert(body?.isNotEmpty != true);
        responseFuture = http.get(
          url,
          headers: requestHeaders,
        );
        break;
      case RestRequestType.post:
        responseFuture = http.post(
          url,
          headers: requestHeaders,
          body: requestBodyJson,
          encoding: encoding,
        );
        break;
      case RestRequestType.patch:
        responseFuture = http.patch(
          url,
          headers: requestHeaders,
          body: requestBodyJson,
          encoding: encoding,
        );
        break;
      case RestRequestType.delete:
        var rq = http.Request('DELETE', url);
        if (requestBodyJson?.isNotEmpty == true) {
          rq.body = requestBodyJson!;
          rq.encoding = encoding!;
        }
        if (requestHeaders.isNotEmpty) {
          rq.headers.addAll(requestHeaders);
        }
        responseFuture = http.Client().send(rq).then(http.Response.fromStream);

        // we dont use http.delete because it is dont support body
//        response = await http.delete(url,
//            body: requestBodyJson, headers: requestHeaders);
        break;
      case RestRequestType.put:
        responseFuture = http.put(
          url,
          headers: requestHeaders,
          body: requestBodyJson,
          encoding: encoding,
        );
        break;
      case RestRequestType.head:
        assert(body?.isNotEmpty != true);
        responseFuture = http.head(
          url,
          headers: requestHeaders,
        );
        break;
    }

    responseFuture = responseFuture.timeout(
      _defaultTimeoutDuration,
      onTimeout: () => throw TimeoutException(
        'TimeoutReached',
        _defaultTimeoutDuration,
      ),
    );

    var response = await responseFuture;

    var log = () => 'response sendHttpRequest \n'
        '\t url($requestType): $url \n'
        '\t response(${response.statusCode}): ${response.body}';

    if (response.statusCode == RestResponse.successResponseStatusCode) {
      _logger.fine(log);
    } else {
      _logger.shout(log);
    }

    _logger.fine(() => 'response $response');

    return response;
  }

  static Uri createUrl({
    required Uri baseUri,
    required String relativeUrlPath,
    List<RestRequestQueryArg>? queryArgs,
  }) {
    var urlWithoutArgs = urlPath.join(baseUri.toString(), relativeUrlPath);

    var filteredQueryArgs =
        queryArgs?.where((arg) => arg.value?.isNotEmpty == true);

    var url;
    if (filteredQueryArgs?.isNotEmpty == true) {
      String queryString;
      if (filteredQueryArgs != null) {
        queryString =
            '${filteredQueryArgs.map((arg) => '${arg.key}=${arg.value}').join('&')}';
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
  ) async {
    return await http.MultipartFile.fromPath(
      fileParamKey,
      path,
      filename: p.basename(path),
    );
  }

  static Map<String, String> buildJsonTypeHeaders() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  @override
  Future<http.Response>
      uploadFileMultipartRequest<T extends UploadMultipartRestRequest, K>(
    T request,
  ) async {
    var url = createUrl(
      baseUri: baseUri,
      relativeUrlPath: request.relativeUrlPath,
      queryArgs: request.queryArgs,
    );

    _logger.fine(() => 'start send $url request $request');
    var requestType = request.type;
    var httpMethodString = requestTypeToStringMap[requestType]!;
    var multipartRequest = http.MultipartRequest(
      httpMethodString,
      url,
    );
    multipartRequest.headers.addAll(request.headers);

    for (var fileEntry in request.files.entries) {
      multipartRequest.files.add(
        await createMultipartFile(
          fileEntry.value.path,
          fileEntry.key,
        ),
      );
    }

    for (var field in request.bodyJson.entries) {
      assert(field.value is String);
      if (field.value != null) {
        multipartRequest.fields[field.key] = field.value;
      }
    }

    _logger.fine(() => 'start multipartFileRequest \n'
        '\t url($requestType): $url \n'
        '\t headers: ${request.headers} \n'
        '\t bodyJson: ${request.bodyJson} \n'
        '\t files: ${request.files} \n');
    var sendFuture = multipartRequest.send();
    sendFuture = sendFuture.timeout(
      _uploadTimeoutDuration,
      onTimeout: () => throw TimeoutException(
        'TimeoutReached',
        _uploadTimeoutDuration,
      ),
    );
    var streamedResponse = await sendFuture;

    var response = await http.Response.fromStream(streamedResponse);

    var log = () => 'response multipartFileRequest \n'
        '\t url($requestType): $url \n'
        '\t response(${response.statusCode}): ${response.body}';
    if (response.statusCode == RestResponse.successResponseStatusCode) {
      _logger.fine(log);
    } else {
      _logger.shout(log);
    }

    return response;
  }
}
