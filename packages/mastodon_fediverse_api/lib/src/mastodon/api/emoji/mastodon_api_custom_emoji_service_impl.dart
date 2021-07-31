import 'dart:convert';

import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:http/http.dart';
import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:mastodon_fediverse_api/src/mastodon/api/emoji/mastodon_api_custom_emoji_service.dart';

class MastodonApiEmojiService extends DisposableOwner
    implements IMastodonApiEmojiService {
  final emojiRelativeUrlPath = '/api/v1/custom_emojis';

  final IRestService restService;

  MastodonApiEmojiService({
    required this.restService,
  });

  @override
  Future<List<IMastodonApiEmoji>> getCustomEmojis() async {
    var request = RestRequest.get(
      relativePath: emojiRelativeUrlPath,
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return processJsonListResponse(
      httpResponse,
      MastodonApiEmoji.fromJson,
    );
  }
}

@override
Future<List<T>> processJsonListResponse<T>(
  Response response,
  ResponseJsonParser<T> responseJsonParser,
) async {
  var statusCode = response.statusCode;

  if (statusCode == RestResponse.successResponseStatusCode) {
    var request = _ParseJsonRequest<T>(
      jsonString: response.body,
      responseJsonParser: responseJsonParser,
    );
    return _parseJsonRequestAsList(request);
    // return await compute(_parseJsonRequestAsList, request);
  } else {
    throw createException(response);
  }
}

Exception createException(Response response) {
  return Exception();
}

List<T> _parseJsonRequestAsList<T>(_ParseJsonRequest<T> request) {
  var json = jsonDecode(request.jsonString);

  if (json is List) {
    var result = List<T>.generate(
      json.length,
      (index) {
        var jsonItem = json[index];
        var item = request.responseJsonParser(jsonItem);

        return item;
      },
      growable: false,
    );

    return result;
  } else {
    throw Exception(
        // ignore: no-magic-number
        "statusCode: 200,body: request.jsonString,");
  }
}

typedef ResponseJsonParser<T> = T Function(Map<String, dynamic> json);

class _ParseJsonRequest<T> {
  final String jsonString;
  final ResponseJsonParser<T> responseJsonParser;

  _ParseJsonRequest({
    required this.jsonString,
    required this.responseJsonParser,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ParseJsonRequest &&
          runtimeType == other.runtimeType &&
          jsonString == other.jsonString &&
          responseJsonParser == other.responseJsonParser;

  @override
  int get hashCode => jsonString.hashCode ^ responseJsonParser.hashCode;

  @override
  String toString() {
    return '_ParseJsonRequest{'
        'jsonString: $jsonString, '
        'responseJsonParser: $responseJsonParser'
        '}';
  }
}
