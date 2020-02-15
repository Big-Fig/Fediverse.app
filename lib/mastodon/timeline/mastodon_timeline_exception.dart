import 'package:fedi/mastodon/rest/mastodon_rest_exception.dart';
import 'package:flutter/widgets.dart';

class MastodonTimelineException extends MastodonRestException {
  MastodonTimelineException({@required int statusCode, @required String body})
      : super(statusCode: statusCode, body: body);
}
