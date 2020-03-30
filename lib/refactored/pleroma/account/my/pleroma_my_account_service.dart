import 'package:fedi/refactored/pleroma/account/my/pleroma_my_account_model.dart';
import 'package:fedi/refactored/pleroma/account/my/pleroma_my_account_service_impl.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaMyAccountService implements IPleromaApi {
  static IPleromaMyAccountService of(BuildContext context, {listen: true}) =>
      Provider.of<IPleromaMyAccountService>(context, listen: listen);

  Future<IPleromaMyAccount> updateCredentials(IPleromaMyAccountEdit
  accountData);

  Future<IPleromaMyAccount> updateFiles(PleromaMyAccountFilesRequest accountFilesRequest);

  Future<IPleromaMyAccount> verifyCredentials();
}
