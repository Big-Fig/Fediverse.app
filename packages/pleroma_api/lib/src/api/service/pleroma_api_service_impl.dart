import 'package:easy_dispose/easy_dispose.dart';

import '../rest/pleroma_api_rest_service.dart';
import 'pleroma_api_service.dart';

class PleromaApiService extends DisposableOwner implements IPleromaApiService {
  @override
  final IPleromaApiRestService restService;

  PleromaApiService({
    required this.restService,
  });
}
