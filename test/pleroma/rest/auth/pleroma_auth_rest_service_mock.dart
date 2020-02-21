import 'package:fedi/Pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:flutter/widgets.dart';

import '../pleroma_rest_service_mock.dart';

class PleromaAuthRestServiceMock extends PleromaRestServiceMock implements
    IPleromaAuthRestService {

  PleromaAuthRestServiceMock({@required String baseUrl}):super(baseUrl: baseUrl);
}