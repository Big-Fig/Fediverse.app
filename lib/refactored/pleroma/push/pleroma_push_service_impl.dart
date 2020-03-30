import 'dart:convert';
import 'dart:io';

import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/refactored/pleroma/push/pleroma_push_model.dart';
import 'package:fedi/refactored/pleroma/push/pleroma_push_service.dart';
import 'package:fedi/refactored/pleroma/rest/pleroma_rest_service.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;

var urlPath = path.posix;

var _logger = Logger("pleroma_push_service_impl.dart");

class PleromaPushService extends IPleromaPushService {
  final IPleromaRestService restService;
  final PleromaPushSettingsSubscriptionKeys keys;

  String get accessToken => CurrentInstance.instance.currentClient.accessToken;
  String get baseUrl => CurrentInstance.instance.currentClient.baseURL;

  String get subscriptionUrl => "$baseUrl/api/v1/push/subscription";


//  String get subscriptionUrl => urlPath.join(
//      baseUrl,
//      "/api/v1/push/subscription"
//  );

  PleromaPushService({@required this.restService, @required this.keys});

  Future<bool> unsubscribe() async {


    _logger.finer("unsubscribe \n"
        "\t subscriptionUrl=$subscriptionUrl ");

    var headers = {
    HttpHeaders.authorizationHeader: "Bearer $accessToken",
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  var success;
  try {
    final response = await http.delete(subscriptionUrl,
        headers: headers);

    if (response.statusCode == 200) {
      _logger.finer("unsubscribe response \n"
          "\t body=${response.body} \n"
          "\t status=${response.statusCode} \n");
      success = true;
    } else {
      _logger.severe("unsubscribe response \n"
          "\t body=${response.body} \n"
          "\t status=${response.statusCode} \n");
      success = false;
    }
  } catch (e) {
    _logger.severe(
        "unsubscribe exception \n"
            "\t e=$e \n",
        e);
    success = false;
  }
  return success;
}

  Future<bool> subscribe({
    @required String endpointCallbackUrl,
    @required PleromaPushSubscribeData data,
  }) async {


    var request = PleromaPushSubscribeRequest(
        subscription: PleromaPushSubscribeRequestSubscription(
            endpoint: endpointCallbackUrl, keys: keys),
        data: data);

    var subscriptionUrl = this.subscriptionUrl;
    _logger.finer("subscribe \n"
        "\t subscriptionUrl=$subscriptionUrl \n"
        "\t request=$request \n");

    var headers = {
      HttpHeaders.authorizationHeader: "Bearer $accessToken",
      "Accept": "application/json",
      "Content-Type": "application/json",
    };

    var success;
    try {
      final response = await http.post(subscriptionUrl,
          headers: headers,
          body: request.toJsonString(),
          encoding: Encoding.getByName("utf-8"));

      if (response.statusCode == 200) {
        _logger.finer("subscribe response \n"
            "\t body=${response.body} \n"
            "\t status=${response.statusCode} \n");
        success = true;
      } else {
        _logger.severe("subscribe response \n"
            "\t body=${response.body} \n"
            "\t status=${response.statusCode} \n");
        success = false;
      }
    } catch (e) {
      _logger.severe(
          "subscribe exception \n"
          "\t e=$e \n",
          e);
      success = false;
    }
    return success;
  }

  @override
  void dispose() {
  }
}
