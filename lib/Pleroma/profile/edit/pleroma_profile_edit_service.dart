import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaProfileEditService {

  static IPleromaProfileEditService of(BuildContext context,
      {listen: true}) =>
      Provider.of<IPleromaProfileEditService>(context, listen: listen);

  Future<String> changeAvatarImage({@required File file});
  Future<String> changeHeaderImage({@required File file});
}