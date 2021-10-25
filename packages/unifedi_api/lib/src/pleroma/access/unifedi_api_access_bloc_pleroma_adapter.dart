import 'package:easy_dispose/easy_dispose.dart';
import 'package:mastodon_api/mastodon_api.dart';

import 'package:pleroma_api/pleroma_api.dart';

import '../../api/access/unifedi_api_access_bloc.dart';
import '../../api/access/unifedi_api_access_model.dart';
import '../../mastodon/access/unifedi_api_access_bloc_mastodon_adapter.dart';
import 'unifedi_api_access_model_pleroma_adapter.dart';

class UnifediApiAccessBlocPleromaAdapter extends DisposableOwner
    implements IUnifediApiAccessBloc {
  final IPleromaApiAccessBloc pleromaApiAccessBloc;

  UnifediApiAccessBlocPleromaAdapter({
    required this.pleromaApiAccessBloc,
  });

  @override
  IUnifediApiAccess get access =>
      pleromaApiAccessBloc.access.toUnifediApiAccessPleromaAdapter();

  @override
  Stream<IUnifediApiAccess> get accessStream =>
      pleromaApiAccessBloc.accessStream.map(
        (access) => access.toUnifediApiAccessPleromaAdapter(),
      );
}

class PleromaApiAccessBlocUnifediAdapter extends DisposableOwner
    implements IPleromaApiAccessBloc {
  final IUnifediApiAccessBloc unifediApiAccessBloc;

  PleromaApiAccessBlocUnifediAdapter({
    required this.unifediApiAccessBloc,
  });

  @override
  IPleromaApiAccess get access =>
      unifediApiAccessBloc.access.toPleromaApiAccess();

  @override
  Stream<IPleromaApiAccess> get accessStream =>
      unifediApiAccessBloc.accessStream.map(
        (access) => access.toPleromaApiAccess(),
      );

  @override
  IMastodonApiAccessBloc get mastodonApiAccessBloc =>
      MastodonApiAccessBlocUnifediAdapter(
        unifediApiAccessBloc: unifediApiAccessBloc,
      );
}
