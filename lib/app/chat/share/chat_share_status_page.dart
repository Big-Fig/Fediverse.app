import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/chat/share/chat_share_status_bloc_impl.dart';
import 'package:fedi/app/share/select/share_select_account_widget.dart';
import 'package:fedi/app/share/status/share_status_with_message_widget.dart';
import 'package:fedi/app/share/to_account/share_to_account_icon_button_widget.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatShareStatusPage extends StatelessWidget {
  final IStatus status;

  ChatShareStatusPage({@required this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: S.of(context).app_chat_share_title,
        actions: [
          ShareToAccountIconButtonWidget(),
        ],
      ),
      body: ShareSelectAccountWidget(
        header: ShareStatusWithMessageWidget(
          status: status,
          footer: null,
        ),
        alwaysShowHeader: true,
      ),
    );
  }
}

void goToChatShareStatusPage(
    {@required BuildContext context, @required IStatus status}) {
  Navigator.push(
    context,
    createChatShareStatusPageRoute(
      context: context,
      status: status,
    ),
  );
}

MaterialPageRoute createChatShareStatusPageRoute({
  @required BuildContext context,
  @required IStatus status,
}) {
  return MaterialPageRoute(
    builder: (context) => ChatShareStatusBloc.provideToContext(context,
        status: status,
        child: Provider.value(
          value: status,
          child: DisposableProxyProvider<IStatus, IStatusBloc>(
            update: (context, value, previous) =>
                StatusBloc.createFromContext(context, value),
            child: ChatShareStatusPage(
              status: status,
            ),
          ),
        )),
  );
}
