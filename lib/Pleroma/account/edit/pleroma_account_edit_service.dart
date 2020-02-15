import 'dart:io';

import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaAccountEditService {

  static IPleromaAccountEditService of(BuildContext context,
      {listen: true}) =>
      Provider.of<IPleromaAccountEditService>(context, listen: listen);

  Future<Account> changeAvatarImage({@required File file});
  Future<Account> changeHeaderImage({@required File file});
}
