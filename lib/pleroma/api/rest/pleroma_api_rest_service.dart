import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiRestService implements IRestService, IPleromaApi {
  static IPleromaApiRestService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaApiRestService>(
        context,
        listen: listen,
      );
}
