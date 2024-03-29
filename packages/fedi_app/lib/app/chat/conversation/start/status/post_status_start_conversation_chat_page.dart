import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/chat/conversation/start/status/post_status_start_conversation_chat_bloc_impl.dart';
import 'package:fedi_app/app/status/post/app_bar/post_status_app_bar_post_action.dart';
import 'package:fedi_app/app/status/post/post_status_compose_widget.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_dismiss_icon_button.dart';
import 'package:fedi_app/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusStartConversationChatPage extends StatelessWidget {
  const PostStatusStartConversationChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: PostStatusStartConversationChatPageAppBar(),
        body: _PostStatusStartConversationChatPageBodyWidget(),
      );
}

class PostStatusStartConversationChatPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PostStatusStartConversationChatPageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediPageTitleAppBar(
        title: S.of(context).app_chat_conversation_start_title,
        leading: const FediDismissIconButton(),
        actions: const [
          PostStatusAppBarPostAction(),
        ],
      );

  @override
  Size get preferredSize => FediPageTitleAppBar.calculatePreferredSize();
}

class _PostStatusStartConversationChatPageBodyWidget extends StatelessWidget {
  const _PostStatusStartConversationChatPageBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: PostStatusComposeWidget(
                autofocus: true,
                goBackOnSuccess: true,
                expanded: true,
                maxLines: null,
                displayAccountAvatar: false,
                showPostAction: false,
                displaySubjectField: false,
              ),
            ),
          ],
        ),
      );
}

Future<void> goToPostStatusStartConversationPage(
  BuildContext context, {
  required List<IAccount> conversationAccountsWithoutMe,
}) async {
  await Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (context) =>
          PostStatusStartConversationChatBloc.provideToContext(
        context,
        conversationAccountsWithoutMe: conversationAccountsWithoutMe,
        child: const PostStatusStartConversationChatPage(),
        successCallback: (IStatus? status) {
          // todo: rework with pop until
          Navigator.of(context).pop();
        },
      ),
    ),
  );
}
