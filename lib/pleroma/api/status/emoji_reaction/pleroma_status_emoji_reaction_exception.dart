import 'package:fedi/pleroma/api/rest/pleroma_rest_model.dart';

class PleromaStatusEmojiReactionException extends PleromaRestException {
  PleromaStatusEmojiReactionException({
    required int statusCode,
    required String body,
  }) : super(
          statusCode: statusCode,
          body: body,
        );
}
