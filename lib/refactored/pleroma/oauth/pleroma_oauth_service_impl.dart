import 'dart:async';

import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/pleroma/oauth/pleroma_oauth_exception.dart';
import 'package:fedi/refactored/pleroma/oauth/pleroma_oauth_model.dart';
import 'package:fedi/refactored/pleroma/oauth/pleroma_oauth_service.dart';
import 'package:fedi/refactored/pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/refactored/rest/rest_request_model.dart';
import 'package:fedi/refactored/rest/rest_response_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
var _logger = Logger("pleroma_oauth_service_impl.dart");

class PleromaOAuthService extends DisposableOwner
    implements IPleromaOAuthService {
  final oauthRelativeUrlPath = "/oauth/";
  final IPleromaRestService restService;

  @override
  Stream<PleromaApiState> get pleromaStateStream =>
      restService.pleromaStateStream;

  @override
  PleromaApiState get pleromaState => restService.pleromaState;

  @override
  Stream<bool> get isApiReadyToUseStream => restService.isApiReadyToUseStream;

  @override
  bool get isApiReadyToUse => restService.isApiReadyToUse;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaOAuthService({@required this.restService});

  @override
  void dispose() {
    super.dispose();
// nothing
  }

  PleromaOAuthToken parseTokenResponse(Response httpResponse) {
    RestResponse<PleromaOAuthToken> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) =>
          PleromaOAuthToken.fromJsonString(httpResponse.body),
    );

    if (restResponse.isSuccess) {
      return restResponse.body;
    } else {
      throw PleromaOAuthException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future<bool> launchAuthorizeFormAndExtractAuthorizationCode(
      {@required PleromaOAuthAuthorizeRequest authorizeRequest,
      @required AuthorizationCodeSuccessCallback successCallback,
      @required AuthorizationCodeErrorCallback errorCallback}) async {
    _logger.finest(() => "launchAuthorizeFormAndExtractAuthorizationCode");
    var host = restService.baseUrl;
    var baseUrl = join(oauthRelativeUrlPath, "authorize");

    var keyValueMap = authorizeRequest.toJson();

    var queryArgs = keyValueMap.entries
        .map((entry) => "${entry.key}=${entry.value}")
        .join("&");

    queryArgs = queryArgs.replaceAll(" ", "%20");

    var url = "$host/$baseUrl?$queryArgs";
    var isCanLaunch = await canLaunch(url);

    _logger.finest(() => "launchAuthorizeFormAndExtractAuthorizationCode \n"
        "\t url = $url\n"
        "\t canLaunch=$isCanLaunch");
    if (isCanLaunch) {
      StreamSubscription<Uri> subscription;
      subscription = getUriLinksStream().listen((Uri uri) {
        subscription.cancel();
        closeWebView();
        var code = uri.queryParameters['code'].toString();
        successCallback(code);
      }, onError: (e) {
        subscription.cancel();
        closeWebView();
        errorCallback(e);
      });
      _logger.finest(() => "launch url=$url");
      return await launch(url);
    } else {
      throw "Can't launch $url";
    }
  }

  @override
  Future<PleromaOAuthToken> retrieveAccountAccessToken(
      {@required PleromaOAuthAccountTokenRequest tokenRequest}) async {
    var queryArgs = tokenRequest
        .toJson()
        .entries
        .map((entry) => RestRequestQueryArg(entry.key, entry.value))
        .toList();

    var request = RestRequest.post(
      relativePath: join(oauthRelativeUrlPath, "token"), queryArgs: queryArgs,
//        bodyJson: tokenRequest.toJson()
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return parseTokenResponse(httpResponse);
  }

  @override
  Future<PleromaOAuthToken> retrieveAppAccessToken(
      {@required PleromaOAuthAppTokenRequest tokenRequest}) async {
    var request = RestRequest.post(
        relativePath: join(oauthRelativeUrlPath, "token"),
        bodyJson: tokenRequest.toJson());
    var httpResponse = await restService.sendHttpRequest(request);

    return parseTokenResponse(httpResponse);
  }

  @override
  Future<bool> revokeToken(
      {@required PleromaOAuthAppTokenRevokeRequest revokeRequest}) async {
    var request = RestRequest.post(
        relativePath: join(oauthRelativeUrlPath, "revoke"),
        bodyJson: revokeRequest.toJson());
    var httpResponse = await restService.sendHttpRequest(request);

    return httpResponse.statusCode == 200;
  }
}
