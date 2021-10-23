import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/list/local_only/local_only_list_bloc.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/list/status_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IDraftStatusLocalOnlyListBloc extends DisposableOwner
    implements ILocalOnlyListBloc<IDraftStatus>, IStatusListBloc {
  static IDraftStatusLocalOnlyListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IDraftStatusLocalOnlyListBloc>(context, listen: listen);
}
