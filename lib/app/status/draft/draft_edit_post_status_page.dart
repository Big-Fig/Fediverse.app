import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/draft/draft_status_bloc.dart';
import 'package:fedi/app/status/post/edit/edit_post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/edit/edit_post_status_widget.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/ui/button/icon/fedi_dismiss_icon_button.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DraftEditPostStatusPage extends StatelessWidget {
  final PostStatusDataCallback onBackPressed;

  DraftEditPostStatusPage({@required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        handleBackPressed(context);
        return true;
      },
      child: Scaffold(
        appBar: FediSubPageTitleAppBar(
          title: "app.status.draft.edit.title".tr(),
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

void goToDraftEditPostStatusPage(BuildContext context, {
  @required IPostStatusData initialData,
}) {
  var draftStatusBloc = IDraftStatusBloc.of(context, listen: false);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          EditPostStatusBloc.provideToContext(
            context,
            postStatusDataCallback: (postStatusData) async {
              IPleromaStatusService.of(context, listen: false);

//          Future.delayed(Duration(milliseconds: 100), () {
//            FediBaseAlertDialog(
//              cancelable: false,
//              actions: [
//                DialogAction(onAction: () {}, label: "Post"),
//              ],
//            ).show(context);
//          });
//          await draftStatusBloc.updatePostStatusData(postStatusData);
              return true;
            },
            child: DraftEditPostStatusPage(
              onBackPressed: (postStatusData) async {
                await draftStatusBloc.updatePostStatusData(postStatusData);
                return true;
              },
            ),
            initialData: initialData,
          ),
    ),
  );
}
