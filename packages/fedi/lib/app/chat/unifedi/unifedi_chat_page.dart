import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/chat/chat_page_app_bar_body_widget.dart';
import 'package:fedi/app/chat/selection/chat_page_selection_app_bar_widget.dart';
import 'package:fedi/app/chat/selection/chat_selection_bloc_impl.dart';
import 'package:fedi/app/chat/unifedi/accounts/unifedi_chat_accounts_page.dart';
import 'package:fedi/app/chat/unifedi/current/unifedi_chat_current_bloc.dart';
import 'package:fedi/app/chat/unifedi/post/unifedi_chat_post_message_bloc_impl.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_bloc.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_bloc_impl.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_model.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_custom_app_bar.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UnifediChatPage extends StatelessWidget {
  const UnifediChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FediDarkStatusBarStyleArea(
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: const [
                _UnifediChatPageAppBarWidget(),
                Expanded(
                  child: UnifediChatWidget(),
                ),
              ],
            ),
          ),
        ),
      );
}

class _UnifediChatPageAppBarWidget extends StatelessWidget {
  const _UnifediChatPageAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ChatPageSelectionAppBarWidget(
        emptySelectionAppBar: FediPageCustomAppBar(
          leading: const FediBackIconButton(),
          child: InkWell(
            onTap: () {
              var chatBloc = IUnifediChatBloc.of(context, listen: false);

              goToUnifediChatAccountsPage(
                context,
                chat: chatBloc.chat,
              );
            },
            child: const ChatPageAppBarBodyWidget(),
          ),
        ),
      );
}

void goToUnifediChatPage(
  BuildContext context, {
  required IUnifediChat chat,
}) {
  Navigator.push(
    context,
    createUnifediChatPageRoute(chat),
  );
}

MaterialPageRoute<void> createUnifediChatPageRoute(IUnifediChat chat) =>
    MaterialPageRoute<void>(
      builder: (context) => DisposableProvider<IUnifediChatBloc>(
        create: (context) {
          var chatBloc = UnifediChatBloc.createFromContext(
            context,
            chat: chat,
            lastChatMessage: null,
          );

          // we dont need to await
          // ignore: cascade_invocations
          chatBloc.markAsRead();

          var currentChatBloc =
              IUnifediChatCurrentBloc.of(context, listen: false);

          // ignore: cascade_invocations
          currentChatBloc.onChatOpened(chat);

          chatBloc
              .addCustomDisposable(() => currentChatBloc.onChatClosed(chat));

          return chatBloc;
        },
        child: UnifediChatPostMessageBloc.provideToContext(
          context,
          chatRemoteId: chat.remoteId,
          child: ProxyProvider<IUnifediChatBloc, IChatBloc>(
            update: (context, value, _) => value,
            child: ChatSelectionBloc.provideToContext(
              context,
              child: const UnifediChatPage(),
            ),
          ),
        ),
      ),
    );
