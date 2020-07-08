import 'package:fedi/app/media/attachment/select_media_attachment_type_to_pick_widget.dart';
import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:flutter/widgets.dart';

class PostMessageAttachWidget extends StatelessWidget {
  PostMessageAttachWidget();

  @override
  Widget build(BuildContext context) {
    var postMessageBloc = IPostMessageBloc.of(context, listen: false);

    return StreamBuilder<bool>(
        stream: postMessageBloc.isAttachActionSelectedStream,
        initialData: postMessageBloc.isAttachActionSelected,
        builder: (context, snapshot) {
          var isAttachActionSelected = snapshot.data;

          if (isAttachActionSelected) {
            return SelectMediaAttachmentTypeToPickWidget(
              onFileSelected: () {
                postMessageBloc.toggleAttachActionSelection();
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
