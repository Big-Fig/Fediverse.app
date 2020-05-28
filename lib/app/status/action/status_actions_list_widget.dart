import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/status/action/status_comment_action_widget.dart';
import 'package:fedi/app/status/action/status_emoji_action_widget.dart';
import 'package:fedi/app/status/action/status_favourite_action_widget.dart';
import 'package:fedi/app/status/action/status_more_action_widget.dart';
import 'package:fedi/app/status/action/status_reblog_action_widget.dart';
import 'package:flutter/cupertino.dart';

class StatusActionsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var currentAuthInstanceBloc =
    ICurrentAuthInstanceBloc.of(context, listen: false);



    var isPleromaInstance =
        currentAuthInstanceBloc.currentInstance.isPleromaInstance;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              StatusCommentActionWidget(),
              StatusFavouriteActionWidget(),
              if (isPleromaInstance)
                StatusEmojiActionWidget(),
              StatusReblogActionWidget()
            ],
          ),
          StatusShareActionWidget(),
        ],
      ),
    );
  }

}