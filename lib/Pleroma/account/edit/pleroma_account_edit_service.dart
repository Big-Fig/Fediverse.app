import 'dart:io';

import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaAccountEditService implements IPleromaApi {

  static IPleromaAccountEditService of(BuildContext context,
      {listen: true}) =>
      Provider.of<IPleromaAccountEditService>(context, listen: listen);

  Future<IPleromaAccount> changeAvatarImage({@required File file});
  Future<IPleromaAccount> changeHeaderImage({@required File file});
}
