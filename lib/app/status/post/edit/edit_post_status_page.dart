import 'package:fedi/app/status/post/edit/edit_post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_compose_widget.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/ui/button/icon/fedi_dismiss_icon_button.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/ui/scroll/unfocus_on_scroll_area_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditPostStatusPage extends StatelessWidget {
  final String titleText;

  EditPostStatusPage({
    @required this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: titleText,
        leading: const FediDismissIconButton(),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: UnfocusOnScrollAreaWidget(
                child: PostStatusComposeWidget(
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
    );
  }
}

void goToEditPostStatusPage(
  BuildContext context, {
  @required String titleText,
  @required IPostStatusData initialData,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => EditPostStatusBloc.provideToContext(
        context,
        child: EditPostStatusPage(
          titleText: titleText,
        ),
        initialData: initialData,
      ),
    ),
  );
}
