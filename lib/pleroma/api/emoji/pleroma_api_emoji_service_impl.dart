import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_model.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';

class PleromaApiEmojiService extends BasePleromaApiService
    with PleromaApiAuthMixinService
    implements IPleromaApiEmojiService {
  final emojiRelativeUrlPath = '/api/pleroma/emoji';
  @override
  final IPleromaApiAuthRestService restService;

  @override
  IPleromaApiAuthRestService get restApiAuthService => restService;

  PleromaApiEmojiService({
    required this.restService,
  }) : super(
          restService: restService,
        );

  @override
  Future<List<IPleromaApiCustomEmoji>> getCustomEmojis() async {
    var request = RestRequest.get(
      relativePath: emojiRelativeUrlPath,
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiCustomEmoji.fromJson,
    );
  }
}
