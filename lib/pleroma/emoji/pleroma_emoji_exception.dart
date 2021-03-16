import 'package:fedi/pleroma/rest/pleroma_rest_model.dart';

class PleromaEmojiException extends PleromaRestException {
  PleromaEmojiException({
    required int statusCode,
    required String body,
  }) : super(
          statusCode: statusCode,
          body: body,
        );
}
