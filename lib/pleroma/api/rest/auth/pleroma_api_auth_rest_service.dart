import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiAuthRestService
    implements IPleromaApiRestService, IPleromaApiAuth {
  static IPleromaApiAuthRestService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaApiAuthRestService>(context, listen: listen);
}
