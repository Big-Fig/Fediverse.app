import 'package:fedi_app/app/status/post/expire/post_status_expire_dialog.dart';
import 'package:fedi_app/app/status/post/post_status_bloc.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusExpireActionWidget extends StatelessWidget {
  const PostStatusExpireActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);

    return StreamBuilder<bool>(
      stream: postStatusBloc.isExpireDurationExistStream,
      initialData: postStatusBloc.isExpireDurationExist,
      builder: (context, snapshot) {
        var isExpireAtExist = snapshot.data!;

        Null Function() onPressed;
        onPressed = () {
          showPostStatusExpireDialog(
            context: context,
            postStatusBloc: postStatusBloc,
          );
        };

        return FediIconButton(
          icon: Icon(
            FediIcons.post_expiry,
            color: isExpireAtExist
                ? IFediUiColorTheme.of(context).primary
                : IFediUiColorTheme.of(context).darkGrey,
          ),
          onPressed: onPressed,
        );
      },
    );
  }
}
