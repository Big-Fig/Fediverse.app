import 'dart:convert';

import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_model.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

final _logger = Logger("pleroma_rest_service_impl.dart");

class PleromaApiRestService extends DisposableOwner
    implements IPleromaApiRestService {
  final IConnectionService connectionService;

  // TODO: rework seed state
  // ignore: close_sinks
  final BehaviorSubject<PleromaApiState> _pleromaApiStateSubject =
      BehaviorSubject.seeded(PleromaApiState.validAuth);

  @override
  PleromaApiState get pleromaApiState => _pleromaApiStateSubject.value!;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      _pleromaApiStateSubject.stream;

  @override
  bool get isConnected => connectionService.isConnected;

  @override
  Stream<bool> get isConnectedStream => connectionService.isConnectedStream;

  @override
  final IRestService restService;

  @override
  Uri get baseUri => restService.baseUri;

  PleromaApiRestService({
    required this.restService,
    required this.connectionService,
  }) {
    addDisposable(subject: _pleromaApiStateSubject);
  }

  @override
  Future<Response> sendHttpRequest<T extends RestRequest, K>(T request) async {
    var response = await restService.sendHttpRequest(request);

    return response;
  }

  @override
  Future<Response>
      uploadFileMultipartRequest<T extends UploadMultipartRestRequest, K>(
    T request,
  ) {
    return restService.uploadFileMultipartRequest(request);
  }

  @override
  void processEmptyResponse<T>(
    Response response,
  ) {
    var statusCode = response.statusCode;

    if (statusCode == RestResponse.successResponseStatusCode) {
      return;
    } else {
      throw createException(response);
    }
  }

  @override
  String processStringResponse(
    Response response,
  ) {
    var statusCode = response.statusCode;

    if (statusCode == RestResponse.successResponseStatusCode) {
      return response.body;
    } else {
      throw createException(response);
    }
  }

  @override
  Future<List<String>> processStringListResponse(
    Response response,
  ) async {
    var statusCode = response.statusCode;

    if (statusCode == RestResponse.successResponseStatusCode) {
      return await compute(_parseJsonStringList, response);
    } else {
      throw createException(response);
    }
  }

  Future<List<String>> _parseJsonStringList(Response response) async {
    var json = await compute(jsonDecode, response.body);
    if (json is Iterable<String>) {
      return json.toList();
    } else {
      throw PleromaApiNotJsonResponseRestException(
        statusCode: response.statusCode,
        body: response.body,
      );
    }
  }

  @override
  Future<List<T>> processJsonListResponse<T>(
    Response response,
    ResponseJsonParser<T> responseJsonParser,
  ) async {
    var statusCode = response.statusCode;

    if (statusCode == RestResponse.successResponseStatusCode) {
      var request = _ParseJsonRequest<T>(
        jsonString: response.body,
        responseJsonParser: responseJsonParser,
      );

      return await compute(_parseJsonRequestAsList, request);
    } else {
      throw createException(response);
    }
  }

  @override
  Future<T> processJsonSingleResponse<T>(
    Response response,
    ResponseJsonParser<T> responseJsonParser,
  ) async {
    var statusCode = response.statusCode;

    if (statusCode == RestResponse.successResponseStatusCode) {
      var request = _ParseJsonRequest<T>(
        jsonString: response.body,
        responseJsonParser: responseJsonParser,
      );
      return await compute(_parseJsonRequestAsSingle, request);
    } else {
      throw createException(response);
    }
  }

  Exception createException(Response response) {
    var statusCode = response.statusCode;

    // todo: more pleroma-related errors handling
    switch (statusCode) {
      case PleromaApiUnprocessableOrThrottledRestException.httpStatusCode:
        throw PleromaApiUnprocessableOrThrottledRestException(
          statusCode: statusCode,
          body: response.body,
        );
      case PleromaApiForbiddenRestException.httpStatusCode:
        throw PleromaApiForbiddenRestException(
          statusCode: statusCode,
          body: response.body,
        );

      default:
        var body = response.body;
        var isInvalidCredentials;
        try {
          Map<String, dynamic> jsonBody = jsonDecode(body);

          var error = jsonBody[PleromaApiRestException.jsonBodyErrorKey];
          var isPleromaInvalidCredentials = error ==
                  PleromaApiInvalidCredentialsForbiddenRestException
                      .pleromaInvalidCredentialsErrorValue &&
              statusCode ==
                  PleromaApiInvalidCredentialsForbiddenRestException
                      .pleromaInvalidCredentialsStatusCode;
          var isMastodonInvalidCredentials = error ==
                  PleromaApiInvalidCredentialsForbiddenRestException
                      .mastodonInvalidCredentialsErrorValue &&
              statusCode ==
                  PleromaApiInvalidCredentialsForbiddenRestException
                      .mastodonInvalidCredentialsStatusCode;
          isInvalidCredentials =
              isPleromaInvalidCredentials || isMastodonInvalidCredentials;
        } catch (e) {
          isInvalidCredentials = false;
        }
        if (isInvalidCredentials) {
          _pleromaApiStateSubject.add(PleromaApiState.brokenAuth);
          _logger.finest(() => "pleromaApiState $pleromaApiState");
          throw PleromaApiInvalidCredentialsForbiddenRestException(
            statusCode: response.statusCode,
            body: body,
          );
        } else {
          throw PleromaApiUnknownRestException(
            statusCode: response.statusCode,
            body: body,
          );
        }
    }
  }
}

class _ParseJsonRequest<T> {
  final String jsonString;
  final ResponseJsonParser<T> responseJsonParser;

  _ParseJsonRequest({
    required this.jsonString,
    required this.responseJsonParser,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ParseJsonRequest &&
          runtimeType == other.runtimeType &&
          jsonString == other.jsonString &&
          responseJsonParser == other.responseJsonParser;

  @override
  int get hashCode => jsonString.hashCode ^ responseJsonParser.hashCode;

  @override
  String toString() {
    return '_ParseJsonRequest{'
        'jsonString: $jsonString, '
        'responseJsonParser: $responseJsonParser'
        '}';
  }
}

List<T> _parseJsonRequestAsList<T>(_ParseJsonRequest<T> request) {
  var json = jsonDecode(request.jsonString);

  if (json is List) {
    List<T> result = List.generate(
      json.length,
      (index) {
        var jsonItem = json[index];
        T item = request.responseJsonParser(jsonItem);
        return item;
      },
      growable: false,
    );

    return result;
  } else {
    throw PleromaApiNotJsonListResponseRestException(
      // ignore: no-magic-number
      statusCode: 200,
      body: request.jsonString,
    );
  }
}

T _parseJsonRequestAsSingle<T>(_ParseJsonRequest<T> request) {
  var json = jsonDecode(request.jsonString);

  return request.responseJsonParser(json);
}
