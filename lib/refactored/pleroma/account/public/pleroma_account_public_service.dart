import 'package:fedi/refactored/pleroma/account/public/pleroma_account_public_model.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaAccountPublicService implements IPleromaApi {
  static IPleromaAccountPublicService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPleromaAccountPublicService>(context, listen: listen);

  Future<bool> registerAccount(
      {@required IPleromaAccountRegisterRequest request,
      @required String appAccessToken});
}
