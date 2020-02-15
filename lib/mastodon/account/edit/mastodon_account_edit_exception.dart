import 'package:fedi/Mastodon/rest/mastodon_rest_exception.dart';
import 'package:flutter/widgets.dart';

class MastodonAccountEditException extends MastodonRestException {
  MastodonAccountEditException({@required int statusCode, @required String body})
      : super(statusCode: statusCode, body: body);
}
