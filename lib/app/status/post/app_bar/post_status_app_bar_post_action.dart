import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_primary_filled_text_button_with_border.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class PostStatusAppBarPostAction extends StatelessWidget {
  const PostStatusAppBarPostAction();

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
                ? () {
                    postStatusBloc.post();
                  }
                : null,
            expanded: false,
          ),
        );
      },
    );
  }
}
