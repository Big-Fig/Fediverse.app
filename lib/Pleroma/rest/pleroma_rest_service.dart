import 'package:fedi/rest/rest_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaRestService implements IRestService {
  static IPleromaRestService of(BuildContext context, {listen: true}) =>
      Provider.of<IPleromaRestService>(context, listen: listen);
}
