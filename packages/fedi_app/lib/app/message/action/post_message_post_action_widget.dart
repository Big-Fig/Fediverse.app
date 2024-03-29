import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_button_builder_widget.dart';
import 'package:fedi_app/app/message/post_message_bloc.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_icon_in_circle_filled_button.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef IPostChatMessageCallback = Function(BuildContext context);

class PostMessagePostActionWidget extends StatelessWidget {
  const PostMessagePostActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var postChatMessageBloc = IPostMessageBloc.of(context, listen: true);

    return StreamBuilder<bool>(
      stream: postChatMessageBloc.isReadyToPostStream,
      initialData: postChatMessageBloc.isReadyToPost,
      builder: (context, snapshot) {
        var isReadyToPost = snapshot.data!;

        return UnifediAsyncOperationButtonBuilderWidget(
          showProgressDialog: false,
          asyncButtonAction: () async {
            await postChatMessageBloc.post();
          },
          builder: (BuildContext context, onPressed) {
            if (isReadyToPost) {
              return FediIconInCircleFilledButton(
                FediIcons.send,
                onPressed: isReadyToPost ? onPressed : null,
              );
            } else {
              return FediIconInCircleTransparentButton(
                FediIcons.send,
                onPressed: isReadyToPost ? onPressed : null,
                color: IFediUiColorTheme.of(context).lightGrey,
              );
            }
          },
        );
      },
    );
  }
}
