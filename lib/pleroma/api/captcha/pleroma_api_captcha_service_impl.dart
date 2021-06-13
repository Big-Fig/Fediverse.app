import 'package:fedi/pleroma/api/captcha/pleroma_api_captcha_model.dart';
import 'package:fedi/pleroma/api/captcha/pleroma_api_captcha_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';

class PleromaApiCaptchaService extends BasePleromaApiService
    implements IPleromaApiCaptchaService {
  final captchaRelativeUrlPath = '/api/pleroma/captcha';
  @override
  final IPleromaApiRestService restService;

  PleromaApiCaptchaService({
    required this.restService,
  }) : super(restService: restService);

  @override
  Future<IPleromaApiCaptcha> getCaptcha() async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: captchaRelativeUrlPath,
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiCaptcha.fromJson,
    );
  }
}
