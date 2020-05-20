import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaAccountFollowRequestsService implements IPleromaApi {
  static IPleromaAccountFollowRequestsService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPleromaAccountFollowRequestsService>(context,
          listen: listen);

  Future<IPleromaAccountRelationship> acceptFollowRequestFrom(
      {@required String accountId});

  Future<IPleromaAccountRelationship> rejectFollowRequestFrom(
      {@required String accountId});

  Future<List<IPleromaAccount>> getPendingFollowRequests({
    String sinceId,
    String minId,
    String maxId,
    int limit = 20,
  });
}
