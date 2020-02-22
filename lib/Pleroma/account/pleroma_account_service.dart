import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaAccountService implements IPleromaApi {
  static IPleromaAccountService of(BuildContext context, {listen: true}) =>
      Provider.of<IPleromaAccountService>(context, listen: listen);

  Future<List<IPleromaAccount>> getAccountFollowings({
    @required String accountRemoteId,

    /// Return results newer than id
    String sinceId,

    /// Return results immediately newer than id
    String maxId,

    /// Maximum number of results to return
    int limit = 20,
  });
}
