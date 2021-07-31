import 'package:pleroma_fediverse_api/src/pleroma/api/captcha/pleroma_api_captcha_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/captcha/pleroma_api_captcha_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:base_fediverse_api/base_fediverse_api.dart';

class PleromaApiCaptchaService extends BasePleromaApiService
    implements IPleromaApiCaptchaService {
  final captchaRelativeUrlPath = '/api/pleroma/captcha';

  PleromaApiCaptchaService({
    required IPleromaApiRestService restService,
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
