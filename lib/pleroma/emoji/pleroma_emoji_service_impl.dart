import 'dart:convert';

import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_exception.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_service.dart';
import 'package:fedi/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';

class PleromaEmojiService extends DisposableOwner
    implements IPleromaEmojiService {
  final emojiRelativeUrlPath = "/api/pleroma/emoji";
  @override
  final IPleromaAuthRestService restService;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  Stream<bool> get isApiReadyToUseStream => restService.isApiReadyToUseStream;

  @override
  bool get isApiReadyToUse => restService.isApiReadyToUse;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaEmojiService({@required this.restService});

  @override
  Future dispose() async {
    return await super.dispose();
  }

  @override
  Future<List<IPleromaCustomEmoji>> getCustomEmojis(
      {@required String emojiRemoteId}) async {
    var request = RestRequest.get(
        relativePath: join(emojiRelativeUrlPath, emojiRemoteId));
    var httpResponse = await restService.sendHttpRequest(request);

    return parsePleromaCustomEmojiListResponse(httpResponse);
  }

  List<IPleromaCustomEmoji> parsePleromaCustomEmojiListResponse(
      Response httpResponse) {
    RestResponse<List<IPleromaCustomEmoji>> restResponse =
        RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) {
        var jsonData = json.decode(body);
        if (jsonData == null || !(jsonData is Map<String, dynamic>)) {
          return [];
        } else {
          var map = jsonData as Map<String, dynamic>;
          return map.entries.map((entry) {
            var name = entry.key;
            var json = entry.value;
            var customEmoji = PleromaCustomEmoji.fromJson(json);
            customEmoji = PleromaCustomEmoji(
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
      return restResponse.body;
    } else {
      throw PleromaEmojiException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }
}
