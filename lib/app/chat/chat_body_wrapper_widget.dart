import 'package:fedi/app/chat/selection/chat_selection_bloc.dart';
import 'package:fedi/app/chat/selection/chat_selection_widget.dart';
import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:fedi/app/message/post_message_widget.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class ChatBodyWrapperWidget extends StatelessWidget {
  final Widget child;

  final Widget postWidget;

  const ChatBodyWrapperWidget({
    required this.child,
    this.postWidget = const _ChatPostMessageWidget(),
  });

  @override
  Widget build(BuildContext context) {
    var postMessageBloc = IPostMessageBloc.of(context, listen: false);

    var chatSelectionBloc = IChatSelectionBloc.of(context);

    return StreamBuilder<bool>(
      stream: postMessageBloc.isExpandedStream,
      initialData: postMessageBloc.isExpanded,
      builder: (context, snapshot) {
        var isPostMessageExpanded = snapshot.data!;
        if (isPostMessageExpanded) {
          return postWidget;
        } else {
          return Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: FediPadding.horizontalBigPadding,
                  child: child,
                ),
              ),
              const FediUltraLightGreyDivider(),
              StreamBuilder<bool>(
                stream: chatSelectionBloc.isSomethingSelectedStream,
                initialData: chatSelectionBloc.isSomethingSelected,
                builder: (context, snapshot) {
                  var isSomethingSelected = snapshot.data!;
                  if (isSomethingSelected) {
                    return const ChatSelectionWidget();
                  } else {
                    return postWidget;
                  }
                },
              ),
            ],
          );
        }
      },
    );
  }
}

class _ChatPostMessageWidget extends StatelessWidget {
  const _ChatPostMessageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PostMessageWidget(
      hintText: S.of(context).app_chat_post_field_content_hint,
      showActionsOnlyWhenFocused: false,
    );
  }
}
