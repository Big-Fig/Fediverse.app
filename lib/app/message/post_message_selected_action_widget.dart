import 'package:fedi/app/media/attachment/select_media_attachment_type_to_pick_widget.dart';
import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:fedi/app/message/post_message_model.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_widget.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/emoji/picker/emoji_picker_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:flutter/widgets.dart';

class PostMessageSelectedActionWidget extends StatelessWidget {
  PostMessageSelectedActionWidget();

  @override
  Widget build(BuildContext context) {
    var postMessageBloc = IPostMessageBloc.of(context, listen: false);

    return StreamBuilder<PostMessageSelectedAction>(
        stream: postMessageBloc.selectedActionStream,
        initialData: postMessageBloc.selectedAction,
        builder: (context, snapshot) {
          var selectedAction = snapshot.data;

          switch (selectedAction) {
            case PostMessageSelectedAction.attach:
              return Column(
                children: <Widget>[
                  Padding(
                    padding: FediPadding.verticalBigPadding,
                    child: const FediUltraLightGreyDivider(),
                  ),
                  SelectMediaAttachmentTypeToPickWidget(
                    onFileSelected: () {
                      postMessageBloc.onFileSelected();

                    },
                  ),
                ],
              );
              break;
            case PostMessageSelectedAction.emoji:
              return Column(
                children: <Widget>[
                  Padding(
                    padding: FediPadding.verticalBigPadding,
                    child: const FediUltraLightGreyDivider(),
                  ),
                  EmojiPickerWidget(
                    onEmojiSelected: (emoji) {
                      postMessageBloc.appendText(emoji.code);
                      postMessageBloc.clearSelectedAction();
                    }, useImageEmoji: true,
                  ),
                ],
              );
              break;
            case PostMessageSelectedAction.poll:
              return Column(
                children: <Widget>[
                  Padding(
                    padding: FediPadding.verticalBigPadding,
                    child: const FediUltraLightGreyDivider(),
                  ),
                 Padding(
                   padding: FediPadding.horizontalSmallPadding,
                   child: PostStatusPollWidget(),
                 ),
                ],
              );
              break;
            default:
              return const SizedBox.shrink();
              break;
          }
        });
  }
}
