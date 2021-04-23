import 'dart:convert';

import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_exception.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_model.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_service.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:http/http.dart';

class PleromaApiEmojiService extends DisposableOwner
    implements IPleromaApiEmojiService {
  final emojiRelativeUrlPath = "/api/pleroma/emoji";
  @override
  final IPleromaApiAuthRestService restService;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaApiEmojiService({required this.restService});

  @override
  Future dispose() async {
    return await super.dispose();
  }

  @override
  Future<List<IPleromaApiCustomEmoji>> getCustomEmojis() async {
    var request = RestRequest.get(
      relativePath: emojiRelativeUrlPath,
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return parsePleromaCustomEmojiListResponse(httpResponse);
  }

  List<IPleromaApiCustomEmoji> parsePleromaCustomEmojiListResponse(
    Response httpResponse,
  ) {
    RestResponse<List<IPleromaApiCustomEmoji>> restResponse =
        RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) {
        var jsonData = json.decode(body);
        if (jsonData == null || !(jsonData is Map<String, dynamic>)) {
          return [];
        } else {
          var map = jsonData;
          return map.entries.map((entry) {
            var name = entry.key;
            var json = entry.value;
            var customEmoji = PleromaApiCustomEmoji.fromJson(json);
            customEmoji = PleromaApiCustomEmoji(
              name: name,
              tags: customEmoji.tags,
              imageUrl: customEmoji.imageUrl,
            );
            return customEmoji;
          }).toList();
        }
      },
    );

    if (restResponse.isSuccess) {
      return restResponse.body!;
    } else {
      throw PleromaApiEmojiException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }
}
