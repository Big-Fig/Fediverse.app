import 'package:fedi/rest/rest_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMastodonRestService implements IRestService {
  static IMastodonRestService of(BuildContext context, {listen: true}) =>
      Provider.of<IMastodonRestService>(context, listen: listen);
}
