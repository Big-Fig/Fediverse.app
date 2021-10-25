import 'package:easy_dispose/easy_dispose.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../api/access/unifedi_api_access_bloc.dart';
import '../../api/access/unifedi_api_access_model.dart';
import 'unifedi_api_access_model_mastodon_adapter.dart';

class UnifediApiAccessBlocMastodonAdapter extends DisposableOwner
    implements IUnifediApiAccessBloc {
  final IMastodonApiAccessBloc mastodonApiAccessBloc;

  UnifediApiAccessBlocMastodonAdapter({
    required this.mastodonApiAccessBloc,
  });

  @override
  IUnifediApiAccess get access =>
      mastodonApiAccessBloc.access.toUnifediApiAccessMastodonAdapter();

  @override
  Stream<IUnifediApiAccess> get accessStream =>
      mastodonApiAccessBloc.accessStream.map(
        (access) => access.toUnifediApiAccessMastodonAdapter(),
      );
}

class MastodonApiAccessBlocUnifediAdapter extends DisposableOwner
    implements IMastodonApiAccessBloc {
  final IUnifediApiAccessBloc unifediApiAccessBloc;

  MastodonApiAccessBlocUnifediAdapter({
    required this.unifediApiAccessBloc,
  });

  @override
  IMastodonApiAccess get access =>
      unifediApiAccessBloc.access.toMastodonApiAccess();

  @override
  Stream<IMastodonApiAccess> get accessStream =>
      unifediApiAccessBloc.accessStream.map(
        (access) => access.toMastodonApiAccess(),
      );
}
