import 'package:fedi/app/conversation/conversation_model.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationNetworkOnlyListBloc extends DisposableOwner
    implements INetworkOnlyListBloc<IConversation> {
  static IConversationNetworkOnlyListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IConversationNetworkOnlyListBloc>(context, listen: listen);
}
