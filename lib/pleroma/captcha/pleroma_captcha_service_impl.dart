import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/captcha/pleroma_captcha_exception.dart';
import 'package:fedi/pleroma/captcha/pleroma_captcha_model.dart';
import 'package:fedi/pleroma/captcha/pleroma_captcha_service.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

class PleromaCaptchaService extends DisposableOwner
    implements IPleromaCaptchaService {
  final captchaRelativeUrlPath = "/api/pleroma/captcha";
  @override
  final IPleromaRestService restService;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState? get pleromaApiState => restService.pleromaApiState;

  @override
  Stream<bool> get isApiReadyToUseStream => restService.isApiReadyToUseStream;

  @override
  bool get isApiReadyToUse => restService.isApiReadyToUse;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaCaptchaService({
    required this.restService,
  });

  IPleromaCaptcha parseCaptchaResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaCaptcha.fromJsonString(httpResponse.body);
    } else {
      throw PleromaCaptchaException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future<IPleromaCaptcha> getCaptcha() async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: captchaRelativeUrlPath,
      ),
    );

    return parseCaptchaResponse(httpResponse);
  }

  @override
  Future dispose() async {
    return await super.dispose();
  }
}
