import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/message/post_message_bloc.dart';
import 'package:fedi_app/app/message/post_message_model.dart';
import 'package:fedi_app/app/status/post/action/post_status_poll_action_badge_bloc_impl.dart';
import 'package:fedi_app/app/status/post/poll/post_status_poll_bloc.dart';
import 'package:fedi_app/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:fedi_app/app/ui/badge/bool/fedi_bool_badge_widget.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusPollActionWidget extends StatelessWidget {
  const PostStatusPollActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var postMessageBloc = IPostMessageBloc.of(context, listen: false);

    return StreamBuilder<PostMessageSelectedAction?>(
      stream: postMessageBloc.selectedActionStream,
      initialData: postMessageBloc.selectedAction,
      builder: (context, snapshot) {
        var selectedAction = snapshot.data;

        var button = FediIconButton(
          icon: Icon(
            FediIcons.poll,
            color: selectedAction == PostMessageSelectedAction.poll
                ? IFediUiColorTheme.of(context).primary
                : IFediUiColorTheme.of(context).darkGrey,
          ),
          onPressed: () {
            postMessageBloc.togglePollActionSelection();
          },
        );
        var postStatusPollBloc = IPostStatusPollBloc.of(context, listen: false);

        return StreamBuilder<bool>(
          stream: postStatusPollBloc.isSomethingChangedStream,
          initialData: postStatusPollBloc.isSomethingChanged,
          builder: (context, snapshot) {
            var isSomethingChanged = snapshot.data!;
            if (isSomethingChanged) {
              return DisposableProxyProvider<IPostStatusPollBloc,
                  IFediBoolBadgeBloc>(
                update: (context, postStatusPollBloc, _) =>
                    PostStatusPollActionBadgeBloc(
                  postStatusPollBloc: postStatusPollBloc,
                ),
                child: FediBoolBadgeWidget(
                  // todo: refactor
                  // ignore: no-magic-number
                  offset: 8.0,
                  child: button,
                ),
              );
            } else {
              return button;
            }
          },
        );
      },
    );
  }
}
