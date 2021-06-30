import 'package:fedi/mastodon/api/emoji/mastodon_api_custom_emoji_service.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';

class MastodonApiEmojiService extends BasePleromaApiService
    with PleromaApiAuthMixinService
    implements IMastodonApiEmojiService {
  final emojiRelativeUrlPath = '/api/v1/custom_emojis';

  @override
  final IPleromaApiAuthRestService restApiAuthService;

  MastodonApiEmojiService({
    required this.restApiAuthService,
  }) : super(
          restService: restApiAuthService,
        );

  @override
  Future<List<IPleromaApiEmoji>> getCustomEmojis() async {
    var request = RestRequest.get(
      relativePath: emojiRelativeUrlPath,
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiEmoji.fromJson,
    );
  }
}
