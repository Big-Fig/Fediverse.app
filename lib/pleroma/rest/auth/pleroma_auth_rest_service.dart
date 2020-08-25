import 'package:fedi/pleroma/rest/pleroma_rest_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaAuthRestService implements IPleromaRestService {
  static IPleromaAuthRestService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPleromaAuthRestService>(context, listen: listen);
}
