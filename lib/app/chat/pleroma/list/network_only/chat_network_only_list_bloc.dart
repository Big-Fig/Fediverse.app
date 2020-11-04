import 'package:fedi/app/chat/pleroma/chat_model.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatNetworkOnlyListBloc extends DisposableOwner
    implements INetworkOnlyListBloc<IChat> {
  static IChatNetworkOnlyListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IChatNetworkOnlyListBloc>(context, listen: listen);
}
