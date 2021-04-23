import 'package:fedi/pleroma/api/rest/pleroma_rest_model.dart';

class PleromaAnnouncementException extends PleromaRestException {
  PleromaAnnouncementException({
    required int statusCode,
    required String body,
  }) : super(
          statusCode: statusCode,
          body: body,
        );
}
