
import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_model.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatWithLastMessageNetworkOnlyListBloc extends DisposableOwner
    implements INetworkOnlyListBloc<IPleromaChatWithLastMessage> {
  static IPleromaChatWithLastMessageNetworkOnlyListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPleromaChatWithLastMessageNetworkOnlyListBloc>(context,
          listen: listen);
}
