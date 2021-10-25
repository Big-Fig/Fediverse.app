import 'package:mastodon_api/mastodon_api.dart';

import '../../pleroma_api_model.dart';
import '../pleroma_api_application_model.dart';

abstract class IPleromaApiClientApplication
    implements
        IMastodonApiClientApplication,
        IPleromaApiApplication,
        IPleromaApiResponse {}
