import 'package:fedi/mastodon/api/directory/mastodon_api_directory_service.dart';
import 'package:fedi/mastodon/api/pagination/mastodon_api_pagination_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiDirectoryService
    implements IMastodonApiDirectoryService, IPleromaApi {

  static IPleromaApiDirectoryService of(
      BuildContext context, {
        bool listen = true,
      }) =>
      Provider.of<IPleromaApiDirectoryService>(
        context,
        listen: listen,
      );

  // /api/v1/directory
  @override
  Future<List<IPleromaApiAccount>> getDirectoryAccounts({
    IMastodonApiPaginationRequest? pagination,
  });
}
