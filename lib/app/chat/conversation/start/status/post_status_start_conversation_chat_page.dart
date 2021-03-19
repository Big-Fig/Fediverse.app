import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/conversation/start/status/post_status_start_conversation_chat_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_compose_widget.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusStartConversationChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediPageTitleAppBar(
        title: S.of(context).app_chat_conversation_start_title,
      ),
      body: _PostStatusStartConversationChatPageBodyWidget(),
    );
  }

  const PostStatusStartConversationChatPage();
}

class _PostStatusStartConversationChatPageBodyWidget extends StatelessWidget {
  const _PostStatusStartConversationChatPageBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              showPostAction: true,
              displaySubjectField: false,
            ),
          ),
        ],
      ),
    );
  }
}

void goToPostStatusStartConversationPage(
  BuildContext context, {
  required List<IAccount> conversationAccountsWithoutMe,
}) async {
  await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) {
      return PostStatusStartConversationChatBloc.provideToContext(
        context,
        conversationAccountsWithoutMe: conversationAccountsWithoutMe,
        child: const PostStatusStartConversationChatPage(),
        successCallback: (IStatus? status) {
          // todo: rework with pop until
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
      );
    }),
  );
}
