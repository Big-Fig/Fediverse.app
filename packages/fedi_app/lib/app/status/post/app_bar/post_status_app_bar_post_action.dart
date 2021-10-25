import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi_app/app/status/post/action/post_status_post_overlay_notification.dart';
import 'package:fedi_app/app/status/post/post_status_bloc.dart';
import 'package:fedi_app/app/ui/button/text/with_border/fedi_primary_filled_text_button_with_border.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class PostStatusAppBarPostAction extends StatelessWidget {
  const PostStatusAppBarPostAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context);

    return StreamBuilder<bool>(
      stream: postStatusBloc.isReadyToPostStream,
      initialData: postStatusBloc.isReadyToPost,
      builder: (context, snapshot) {
        var isReadyToPost = snapshot.data!;

        return Padding(
          padding: FediPadding.horizontalSmallPadding,
          child: FediPrimaryFilledTextButtonWithBorder(
            S.of(context).app_status_post_action_post,
            onPressed: isReadyToPost
                ? () async {
                    // todo: refactor
                    var dialogResult = await UnifediAsyncOperationHelper
                        .performUnifediAsyncOperation(
                      context: context,
                      asyncCode: () async {
                        await postStatusBloc.post();
                      },
                    );
                    if (dialogResult.success) {
                      showPostStatusPostOverlayNotification(
                        context: context,
                        postStatusBloc: postStatusBloc,
                        isScheduled: postStatusBloc.isScheduledAtExist,
                      );
                      Navigator.of(context).pop();
                    }
                  }
                : null,
            expanded: false,
          ),
        );
      },
    );
  }
}
