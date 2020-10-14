import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/post/edit/edit_post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/edit/edit_post_status_widget.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_dismiss_icon_button.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScheduledEditPostStatusPage extends StatelessWidget {
  final PostStatusDataCallback onBackPressed;

  ScheduledEditPostStatusPage({@required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        handleBackPressed(context);
        return true;
      },
      child: Scaffold(
        appBar: FediSubPageTitleAppBar(
          title: "app.status.scheduled.edit.title".tr(),
          leading: FediDismissIconButton(
            customOnPressed: () {
              handleBackPressed(context);
            },
          ),
        ),
        body: SafeArea(
          child: EditPostStatusWidget(),
        ),
      ),
    );
  }

  void handleBackPressed(BuildContext context) async {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);
    await onBackPressed(
      postStatusBloc.calculateCurrentPostStatusData(),
    );
  }
}

void goToScheduledEditPostStatusPage(
  BuildContext context, {
  @required IPostStatusData initialData,
  @required VoidCallback successCallback,
}) {
  var scheduledStatusBloc = IScheduledStatusBloc.of(context, listen: false);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => EditPostStatusBloc.provideToContext(
        context,
        postStatusDataCallback: (PostStatusData postStatusData) async {
          var success = await scheduledStatusBloc.postScheduledPost(postStatusData);
          if(success) {
            successCallback();
          }
          return success;
        },
        child: ScheduledEditPostStatusPage(
          onBackPressed: (PostStatusData postStatusData) async {
            Navigator.of(context).pop();
            return true;
          },
        ),
        initialData: initialData,
      ),
    ),
  );
}
