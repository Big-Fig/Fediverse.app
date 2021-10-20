import 'package:fedi/app/media/attachment/upload/list/upload_media_attachment_list_all_widget.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/message/action/post_message_attach_action_widget.dart';
import 'package:fedi/app/message/action/post_message_emoji_action_widget.dart';
import 'package:fedi/app/message/action/post_message_post_action_widget.dart';
import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:fedi/app/message/post_message_content_widget.dart';
import 'package:fedi/app/message/post_message_selected_action_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class PostMessageWidget extends StatelessWidget {
  final String hintText;
  final bool showActionsOnlyWhenFocused;

  const PostMessageWidget({
    Key? key,
    required this.hintText,
    required this.showActionsOnlyWhenFocused,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var postMessageBloc = IPostMessageBloc.of(context);

    return Padding(
      padding: FediPadding.allSmallPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const _PostMessageMediaAttachmentsWidget(),
          _PostMessageTextContentWidget(hintText: hintText),
          // ignore: avoid-returning-widgets
          if (!showActionsOnlyWhenFocused) buildActionsAndSendRow(),
          if (showActionsOnlyWhenFocused)
            StreamBuilder<bool>(
              stream: postMessageBloc.isInputFocusedStream,
              initialData: postMessageBloc.isInputFocused,
              builder: (context, snapshot) {
                var isInputFocused = snapshot.data!;

                if (isInputFocused) {
                  // ignore: avoid-returning-widgets
                  return buildActionsAndSendRow();
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
        ],
      ),
    );
  }

  // ignore: avoid-returning-widgets
  Widget buildActionsAndSendRow() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                // ignore: avoid-returning-widgets
                children: buildActions(),
              ),
              const PostMessagePostActionWidget(),
            ],
          ),
          const PostMessageSelectedActionWidget(),
        ],
      );

  List<Widget> buildActions() => [
        const PostMessageAttachActionWidget(),
        const PostMessageEmojiActionWidget(),
      ];
}

class _PostMessageMediaAttachmentsWidget extends StatelessWidget {
  const _PostMessageMediaAttachmentsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var postMessageBloc = IPostMessageBloc.of(context, listen: false);

    return StreamBuilder<double>(
      stream: Rx.combineLatest2(
        postMessageBloc.isAnySelectedActionVisibleStream,
        postMessageBloc
            .uploadMediaAttachmentsBloc.uploadMediaAttachmentBlocsStream,
        (
          bool isAnySelectedActionVisible,
          List<IUploadMediaAttachmentBloc>? mediaAttachmentBlocs,
        ) {
          isAnySelectedActionVisible = isAnySelectedActionVisible;
          var mediaBlocs = mediaAttachmentBlocs!.where((bloc) => bloc.isMedia);

          var nonMediaBlocs =
              mediaAttachmentBlocs.where((bloc) => !bloc.isMedia);

          var isSingleMediaVisible = mediaBlocs.length == 1;

          var isListMediaVisible = mediaBlocs.length > 1;

          var isListNonMediaVisible = nonMediaBlocs.isNotEmpty;

          var mediaQueryData = MediaQuery.of(context);
          var height = mediaQueryData.size.height;

          // status bar
          height -= mediaQueryData.padding.top;
          // nav system bar
          height -= mediaQueryData.padding.bottom;
          height -= kToolbarHeight;
          // input bar
          // todo: refactor
          // ignore: no-magic-number
          height -= 70;
          // ignore: no-magic-number
          height -= 90;
          if (isAnySelectedActionVisible) {
            // ignore: no-magic-number
            height -= 120;
          }
          if (isListMediaVisible) {
            // ignore: no-magic-number
            height -= 100;
          }
          if (isListNonMediaVisible) {
            // ignore: no-magic-number
            height -= 50;
          }
          if (isSingleMediaVisible) {
            // ignore: no-magic-number
            height -= 230;
          }

          // i am not sure, but overflow ~ 100 px so I added it here
          // ignore: no-magic-number
          height -= 100;

          // ignore: no-magic-number
          if (height < 100) {
            // ignore: no-magic-number
            height = 100;
          }

          return height;
        },
      ),
      builder: (context, snapshot) {
        var heightOnKeyboardOpen = snapshot.data;

        return UploadMediaAttachmentListAllWidget(
          scrollable: true,
          heightOnKeyboardOpen: heightOnKeyboardOpen,
        );
      },
    );
  }
}

class _PostMessageTextContentWidget extends StatelessWidget {
  const _PostMessageTextContentWidget({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  final String hintText;

  @override
  Widget build(BuildContext context) {
    var postMessageBloc = IPostMessageBloc.of(context);

    return StreamBuilder<bool>(
      stream: postMessageBloc.isExpandedStream,
      builder: (context, snapshot) {
        var isExpanded = snapshot.data ?? false;
        if (isExpanded) {
          return Expanded(
            child: PostMessageContentWidget(
              filled: false,
              hintText: hintText,
              expanded: true,
              ending: const _PostMessageMaximizeActionWidget(),
            ),
          );
        } else {
          return Row(
            children: [
              Expanded(
                child: PostMessageContentWidget(
                  hintText: hintText,
                  expanded: false,
                ),
              ),
              const _PostMessageMaximizeActionWidget(),
            ],
          );
        }
      },
    );
  }
}

class _PostMessageMaximizeActionWidget extends StatelessWidget {
  const _PostMessageMaximizeActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var postMessageBloc = IPostMessageBloc.of(context);

    return StreamBuilder<bool>(
      stream: postMessageBloc.isExpandedStream,
      builder: (context, snapshot) {
        var isExpanded = snapshot.data ?? false;

        return Align(
          alignment: Alignment.topRight,
          child: FediIconButton(
            icon: Icon(isExpanded ? FediIcons.minimize : FediIcons.maximize),
            color: IFediUiColorTheme.of(context).darkGrey,
            onPressed: () {
              postMessageBloc.toggleExpanded();
            },
          ),
        );
      },
    );
  }
}
