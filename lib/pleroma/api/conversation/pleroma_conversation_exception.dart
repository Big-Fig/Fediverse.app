import 'package:fedi/pleroma/api/rest/pleroma_rest_model.dart';

class PleromaConversationException extends PleromaRestException {
  PleromaConversationException({
    required int statusCode,
    required String body,
  }) : super(
          statusCode: statusCode,
          body: body,
        );
}
