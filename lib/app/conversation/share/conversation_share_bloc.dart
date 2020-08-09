import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/share/message_input/share_message_input_bloc.dart';
import 'package:fedi/app/share/select/share_select_account_bloc.dart';
import 'package:fedi/app/share/share_bloc.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationShareBloc extends IShareBloc {
  static IConversationShareBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IConversationShareBloc>(context, listen: listen);

  IShareMessageInputBloc get shareMessageInputBloc;

  IShareSelectAccountBloc get shareSelectAccountBloc;

  Future<List<IAccount>> customDefaultLocalAccountListLoader();

  Future<List<IPleromaAccount>> customDefaultRemoteAccountListLoader();
}
