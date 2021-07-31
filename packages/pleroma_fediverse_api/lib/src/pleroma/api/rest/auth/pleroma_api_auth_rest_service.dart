import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/rest/pleroma_api_rest_service.dart';

abstract class IPleromaApiAuthRestService
    implements IPleromaApiRestService, IPleromaApiAuth {}
