import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:mastodon_api/mastodon_api.dart';

import 'pleroma_api_access_bloc.dart';
import 'pleroma_api_access_model.dart';

class PleromaApiAccessBloc extends FediverseApiAccessBloc<IPleromaApiAccess>
    implements IPleromaApiAccessBloc {
  PleromaApiAccessBloc({
    required IPleromaApiAccess access,
  }) : super(
          access: access,
        ) {
    mastodonApiAccessBloc = PleromaApiAccessBlocMastodonAdapter(this);
  }

  @override
  // ignore: avoid-late-keyword
  late IMastodonApiAccessBloc<IMastodonApiAccess> mastodonApiAccessBloc;
}

class PleromaApiAccessBlocMastodonAdapter extends DisposableOwner
    implements IMastodonApiAccessBloc {
  final PleromaApiAccessBloc pleromaApiAccessBloc;

  PleromaApiAccessBlocMastodonAdapter(this.pleromaApiAccessBloc);

  @override
  IMastodonApiAccess get access => pleromaApiAccessBloc.access;

  @override
  Stream<IMastodonApiAccess> get accessStream =>
      pleromaApiAccessBloc.accessStream;
}
