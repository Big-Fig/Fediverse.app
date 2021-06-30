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
  final IPleromaApiAuthRestService restApiAuthService;

  PleromaApiEmojiService({
    required this.restApiAuthService,
  }) : super(
          restService: restApiAuthService,
        );

  @override
  Future<List<IPleromaApiCustomEmoji>> getCustomEmojis() async {
    var request = RestRequest.get(
      relativePath: emojiRelativeUrlPath,
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      _parseEmojiListResponse,
    );
  }
}

List<IPleromaApiCustomEmoji> _parseEmojiListResponse(
  Map<String, dynamic> json,
) {
  // hack due to Map inside response but should be list
  // {"8b_a":{"image_url":"/emoji/8bfont/8b_a.png","tags":["pack:8bfont"]}}
  if (json is Map<String, dynamic>) {
    return json.entries.map((e) {
      var valueMap = e.value as Map<String, dynamic>;
      valueMap['name'] = e.key;

      return PleromaApiCustomEmoji.fromJson(valueMap);
    }).toList();
  } else {
    return [];
  }
}
