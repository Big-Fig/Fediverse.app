import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/draft/repository/draft_status_repository.dart';
import 'package:fedi/app/status/post/new/new_post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_compose_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_dismiss_icon_button.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_base_alert_dialog.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/ui/scroll/unfocus_on_scroll_area_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void _newPostStatusPageHandleBackPressed(
    BuildContext context, IPostStatusBloc postStatusBloc) {
  var isSomethingChanged = postStatusBloc.isAnyDataEntered;
  if (isSomethingChanged) {
    _newPostStatusPageAlertUnsaved(context, postStatusBloc);
  } else {
    Navigator.pop(context);
  }
}

void _newPostStatusPageAlertUnsaved(
    BuildContext context, IPostStatusBloc postStatusBloc) {
  FediBaseAlertDialog(
      title: S.of(context).app_status_post_new_unsaved_dialog_title,
      actionsAxis: Axis.vertical,
      actions: [
        DialogAction(
          label:
              S.of(context).app_status_post_new_unsaved_dialog_action_discard,
          onAction: (context) {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
        DialogAction(
          label: S
              .of(context)
              .app_status_post_new_unsaved_dialog_action_saveAsDraft,
          onAction: (context) async {
            var postStatusData =
                postStatusBloc.calculateCurrentPostStatusData();

            var draftStatusRepository =
                IDraftStatusRepository.of(context, listen: false);
            await draftStatusRepository.addDraftStatus(
              draftStatus: DbDraftStatusWrapper(
                DbDraftStatus(
                    id: null, updatedAt: DateTime.now(), data: postStatusData),
              ),
            );
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
      ]).show(context);
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
}

class _NewPostStatusPageBodyWidget extends StatelessWidget {
  const _NewPostStatusPageBodyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: UnfocusOnScrollAreaWidget(
                child: const _NewPostStatusPageComposeWidget(),
              ),
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
  Widget build(BuildContext context) {
    return PostStatusComposeWidget(
      autofocus: true,
      goBackOnSuccess: true,
      expanded: true,
      maxLines: null,
      displayAccountAvatar: false,
      showPostAction: true,
      displaySubjectField: true,
    );
  }
}

class NewPostStatusPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const NewPostStatusPageAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context);
    return FediSubPageTitleAppBar(
      title: S.of(context).app_status_post_nsfw_title,
      leading: FediDismissIconButton(
        customOnPressed: () {
          _newPostStatusPageHandleBackPressed(context, postStatusBloc);
        },
      ),
    );
  }

  @override
  Size get preferredSize => FediSubPageTitleAppBar.calculatePreferredSize();
}

void goToNewPostStatusPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => NewPostStatusBloc.provideToContext(
        context,
        child: NewPostStatusPage(),
      ),
    ),
  );
}
