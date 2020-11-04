
import 'package:fedi/app/chat/pleroma/with_last_message/chat_with_last_message_model.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatWithLastMessageNetworkOnlyListBloc extends DisposableOwner
    implements INetworkOnlyListBloc<IChatWithLastMessage> {
  static IChatWithLastMessageNetworkOnlyListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IChatWithLastMessageNetworkOnlyListBloc>(context,
          listen: listen);
}
