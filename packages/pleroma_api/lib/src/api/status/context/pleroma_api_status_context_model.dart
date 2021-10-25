import 'package:mastodon_api/mastodon_api.dart';
import '../../pleroma_api_model.dart';
import '../pleroma_api_status_model.dart';

abstract class IPleromaApiStatusContext
    implements IMastodonApiStatusContext, IPleromaApiResponse {
  @override
  List<IPleromaApiStatus> get descendants;

  @override
  List<IPleromaApiStatus> get ancestors;
}
