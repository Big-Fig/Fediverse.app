import 'package:fedi/pleroma/api/rest/pleroma_rest_model.dart';

class PleromaEmojiException extends PleromaRestException {
  PleromaEmojiException({
    required int statusCode,
    required String body,
  }) : super(
          statusCode: statusCode,
          body: body,
        );
}
