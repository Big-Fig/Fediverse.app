import 'package:easy_localization/easy_localization.dart';
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
import 'package:fedi/ui/scroll/unfocus_on_scroll_area_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPostStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);
    return WillPopScope(
      // override back button
      onWillPop: () async {
        handleBackPressed(context, postStatusBloc);
        return true;
      },
      child: Scaffold(
        appBar: FediSubPageTitleAppBar(
          title: tr("app.status.post.new.title"),
          leading: FediDismissIconButton(
            customOnPressed: () {
              handleBackPressed(context, postStatusBloc);
            },
          ),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: UnfocusOnScrollAreaWidget(
                  child: PostStatusComposeWidget(
                    autofocus: true,
                    goBackOnSuccess: true,
                    expanded: true,
                    maxLines: null,
                    displayAccountAvatar: false,
                    showPostAction: true,
                    displaySubjectField: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleBackPressed(BuildContext context, IPostStatusBloc postStatusBloc) {
    var isSomethingChanged = postStatusBloc.isAnyDataEntered;
    if (isSomethingChanged) {
      alertUnsaved(context, postStatusBloc);
    } else {
      Navigator.pop(context);
    }
  }

  void alertUnsaved(BuildContext context, IPostStatusBloc postStatusBloc) {
    FediBaseAlertDialog(
        title: tr("app.status.post.new.unsaved.dialog.title"),
        actionsAxis: Axis.vertical,
        actions: [
          DialogAction(
            label: tr("app.status.post.new.unsaved.dialog.action.discard"),
            onAction: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
          DialogAction(
            label: tr("app.status.post.new.unsaved.dialog.action"
                ".save_as_draft"),
            onAction: () async {
              var postStatusData =
                  postStatusBloc.calculateCurrentPostStatusData();

              var draftStatusRepository =
                  IDraftStatusRepository.of(context, listen: false);
              await draftStatusRepository.addDraftStatus(
                draftStatus: DbDraftStatusWrapper(
                  DbDraftStatus(
                      id: null,
                      updatedAt: DateTime.now(),
                      data: postStatusData),
                ),
              );
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ]).show(context);
  }
}

void goToNewPostStatusPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => NewPostStatusBloc.provideToContext(context,
            child: NewPostStatusPage())),
  );
}
