import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/pagination/network_only/network_only_pleroma_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatMessageNetworkOnlyPaginationBloc
    implements INetworkOnlyPleromaPaginationBloc<IChatMessage> {
  static IChatMessageNetworkOnlyPaginationBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IChatMessageNetworkOnlyPaginationBloc>(context, listen: listen);
}
