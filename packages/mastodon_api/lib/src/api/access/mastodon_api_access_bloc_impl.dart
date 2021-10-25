import 'package:fediverse_api/fediverse_api.dart';

import 'mastodon_api_access_bloc.dart';
import 'mastodon_api_access_model.dart';

class MastodonApiAccessBloc extends FediverseApiAccessBloc<IMastodonApiAccess>
    implements IMastodonApiAccessBloc {
  MastodonApiAccessBloc({
    required IMastodonApiAccess access,
  }) : super(
          access: access,
        );
}
