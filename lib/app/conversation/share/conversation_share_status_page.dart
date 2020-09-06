import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/conversation/share/conversation_share_bloc.dart';
import 'package:fedi/app/conversation/share/conversation_share_status_bloc_impl.dart';
import 'package:fedi/app/share/select/share_select_account_widget.dart';
import 'package:fedi/app/share/status/share_status_with_message_widget.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversationShareStatusPage extends StatelessWidget {
  final IStatus status;

  ConversationShareStatusPage({@required this.status});

  @override
  Widget build(BuildContext context) {
    var conversationShareBloc =
        IConversationShareBloc.of(context, listen: false);
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: "app.conversation.share.title".tr(),
      ),
      body: ShareStatusWithMessageWidget(
        status: status,
        header: ShareSelectAccountWidget(
          customLocalAccountListLoader:
              conversationShareBloc.customLocalAccountListLoader,
          customRemoteAccountListLoader:
              conversationShareBloc.customRemoteAccountListLoader,
        ),
      ),
    );
  }
}

void goToConversationShareStatusPage(
    {@required BuildContext context, @required IStatus status}) {
  Navigator.push(
    context,
    createConversationShareStatusPageRoute(
      context: context,
      status: status,
    ),
  );
}

MaterialPageRoute createConversationShareStatusPageRoute({
  @required BuildContext context,
  @required IStatus status,
}) {
  return MaterialPageRoute(
    builder: (context) => ConversationShareStatusBloc.provideToContext(
      context,
      status: status,
      child: Provider.value(
        value: status,
        child: DisposableProxyProvider<IStatus, IStatusBloc>(
          update: (context, value, previous) =>
              StatusBloc.createFromContext(context, status),
          child: ConversationShareStatusPage(
            status: status,
          ),
        ),
      ),
    ),
  );
}
