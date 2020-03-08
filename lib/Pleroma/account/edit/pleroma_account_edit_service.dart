import 'package:fedi/Pleroma/Models/Account.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:fedi/Pleroma/account/edit/pleroma_account_edit_model.dart';

abstract class IPleromaAccountEditService {

  static IPleromaAccountEditService of(BuildContext context,
      {listen: true}) =>
      Provider.of<IPleromaAccountEditService>(context, listen: listen);

  Future<Account> updateCredentials(PleromaAccountEdit accountData);
  Future<Account> updateFiles(PleromaAccountFiles accountFiles);

}
