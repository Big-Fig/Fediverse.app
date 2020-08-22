import 'package:fedi/app/list/local_only/network_only_list_bloc.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IDraftStatusLocalOnlyListBloc extends DisposableOwner
    implements ILocalOnlyListBloc<IDraftStatus> {
  static IDraftStatusLocalOnlyListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IDraftStatusLocalOnlyListBloc>(context, listen: listen);
}
