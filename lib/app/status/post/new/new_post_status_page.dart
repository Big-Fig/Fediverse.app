import 'package:fedi/app/status/post/new/new_post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_compose_widget.dart';
import 'package:fedi/app/status/post/unsaved/post_status_unsaved_dialog.dart';
import 'package:fedi/app/ui/button/icon/fedi_dismiss_icon_button.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void _newPostStatusPageHandleBackPressed(
    BuildContext context, IPostStatusBloc postStatusBloc) {
  var isSomethingChanged = postStatusBloc.isAnyDataEntered;
  if (isSomethingChanged) {
    showPostStatusUnsavedDialog(context, postStatusBloc);
  } else {
    Navigator.pop(context);
  }
}

class NewPostStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);
    return WillPopScope(
      // override back button
      onWillPop: () async {
        _newPostStatusPageHandleBackPressed(context, postStatusBloc);
        return true;
      },
      child: Scaffold(
        appBar: const NewPostStatusPageAppBar(),
        body: const _NewPostStatusPageBodyWidget(),
      ),
    );
  }

  const NewPostStatusPage();
}

class _NewPostStatusPageBodyWidget extends StatelessWidget {
  const _NewPostStatusPageBodyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: _NewPostStatusPageComposeWidget(),
            ),
          ],
        ),
      );
}

class _NewPostStatusPageComposeWidget extends StatelessWidget {
  const _NewPostStatusPageComposeWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const PostStatusComposeWidget(
        autofocus: true,
        goBackOnSuccess: true,
        expanded: true,
        maxLines: null,
        displayAccountAvatar: false,
        showPostAction: true,
        displaySubjectField: true,
      );
}

class NewPostStatusPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const NewPostStatusPageAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context);
    return FediPageTitleAppBar(
      title: S.of(context).app_status_post_new_title,
      leading: FediDismissIconButton(
        customOnPressed: () {
          _newPostStatusPageHandleBackPressed(context, postStatusBloc);
        },
      ),
    );
  }

  @override
  Size get preferredSize => FediPageTitleAppBar.calculatePreferredSize();
}

void goToNewPostStatusPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => NewPostStatusBloc.provideToContext(
        context,
        child: const NewPostStatusPage(),
      ),
    ),
  );
}
