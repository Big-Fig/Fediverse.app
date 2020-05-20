import 'package:fedi/pleroma/account/my/pleroma_my_account_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaMyAccountService implements IPleromaApi {
  static IPleromaMyAccountService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPleromaMyAccountService>(context, listen: listen);

  Future<IPleromaMyAccount> updateCredentials(IPleromaMyAccountEdit 
  accountEditData);

  Future<IPleromaMyAccount> updateFiles(
      PleromaMyAccountFilesRequest accountFilesRequest);

  Future<IPleromaMyAccount> verifyCredentials();
}
