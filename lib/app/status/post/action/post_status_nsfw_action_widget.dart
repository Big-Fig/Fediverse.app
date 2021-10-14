import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusNsfwActionWidget extends StatelessWidget {
  const PostStatusNsfwActionWidget();

  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);

    return InkWell(
      onTap: () {
        postStatusBloc
            .changeNsfwSensitive(!postStatusBloc.isNsfwSensitiveEnabled!);
      },
      child: StreamBuilder<bool?>(
        stream: postStatusBloc.isNsfwSensitiveEnabledStream,
        initialData: postStatusBloc.isNsfwSensitiveEnabled,
        builder: (context, snapshot) {
          var nsfwSensitive = snapshot.data!;

          return FediIconButton(
            icon: Icon(
              nsfwSensitive ? FediIcons.hide : FediIcons.show,
              color: calculateColor(
                context,
                sensitive: nsfwSensitive,
              ),
            ),
            onPressed: () {
              postStatusBloc
                  .changeNsfwSensitive(!postStatusBloc.isNsfwSensitiveEnabled!);
            },
          );
        },
      ),
    );
  }

  Color calculateColor(
    BuildContext context, {
    required bool sensitive,
  }) =>
      sensitive
          ? IFediUiColorTheme.of(context).primary
          : IFediUiColorTheme.of(context).darkGrey;
}
