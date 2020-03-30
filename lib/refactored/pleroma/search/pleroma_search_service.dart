import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/pleroma/search/pleroma_search_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class IPleromaSearchService implements IPleromaApi {
  static IPleromaSearchService of(BuildContext context, {listen: true}) =>
      Provider.of<IPleromaSearchService>(context, listen: listen);

  Future<IPleromaSearchResult> search(
      {@required IPleromaSearchRequest request});
}
