import 'package:fedi/app/media/attachment/select_media_attachment_type_to_pick_widget.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:flutter/widgets.dart';

class PostStatusAttachWidget extends StatelessWidget {
  PostStatusAttachWidget();

  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);

    return StreamBuilder<bool>(
        stream: postStatusBloc.isAttachActionSelectedStream,
        initialData: postStatusBloc.isAttachActionSelected,
        builder: (context, snapshot) {
          var isAttachActionSelected = snapshot.data;

          if (isAttachActionSelected) {
            return SelectMediaAttachmentTypeToPickWidget(
              onFileSelected: () {
                postStatusBloc.toggleAttachActionSelection();
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
