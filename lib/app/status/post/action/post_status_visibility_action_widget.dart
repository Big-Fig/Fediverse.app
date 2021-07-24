import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/visibility/status_visibility_icon_widget.dart';
import 'package:fedi/app/status/visibility/status_visibility_title_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/dialog/chooser/selection/single/fedi_single_selection_chooser_dialog.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusVisibilityActionWidget extends StatelessWidget {
  const PostStatusVisibilityActionWidget();

  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context);

    var isPleromaInstance = ICurrentAuthInstanceBloc.of(
      context,
      listen: false,
    ).currentInstance!.isPleroma;

    return StreamBuilder<PleromaApiVisibility>(
      stream: postStatusBloc.visibilityStream,
      initialData: postStatusBloc.visibility,
      builder: (context, snapshot) {
        var visibility = snapshot.data;
        var icon = StatusVisibilityIconWidget.buildVisibilityIcon(
          context: context,
          visibility: visibility!,
          isSelectedVisibility: false,
          isPossibleToChangeVisibility: true,
        );

        return FediIconButton(
          icon: icon,
          onPressed: () {
            showFediSingleSelectionChooserDialog(
              context: context,
              title: S.of(context).app_status_post_visibility_title,
              actions: [
                buildVisibilityDialogAction(
                  context: context,
                  postStatusBloc: postStatusBloc,
                  visibility: PleromaApiVisibility.public,
                ),
                if (isPleromaInstance)
                  buildVisibilityDialogAction(
                    context: context,
                    postStatusBloc: postStatusBloc,
                    visibility: PleromaApiVisibility.local,
                  ),
                buildVisibilityDialogAction(
                  context: context,
                  postStatusBloc: postStatusBloc,
                  visibility: PleromaApiVisibility.direct,
                ),
                if (isPleromaInstance)
                  buildVisibilityDialogAction(
                    context: context,
                    postStatusBloc: postStatusBloc,
                    visibility: PleromaApiVisibility.list,
                  ),
                buildVisibilityDialogAction(
                  context: context,
                  postStatusBloc: postStatusBloc,
                  visibility: PleromaApiVisibility.unlisted,
                ),
                buildVisibilityDialogAction(
                  context: context,
                  postStatusBloc: postStatusBloc,
                  visibility: PleromaApiVisibility.private,
                ),
              ],
            );
          },
        );
      },
    );
  }

  SelectionDialogAction buildVisibilityDialogAction({
    required BuildContext context,
    required IPostStatusBloc postStatusBloc,
    required PleromaApiVisibility visibility,
  }) {
    DialogActionCallback? onPressed;
    var isPossibleToChangeVisibility =
        postStatusBloc.isPossibleToChangeVisibility;
    var isSelectedVisibility = postStatusBloc.visibility == visibility;
    if (isPossibleToChangeVisibility) {
      onPressed = (context) {
        postStatusBloc.changeVisibility(visibility);
        Navigator.of(context).pop();
      };
    }

    return SelectionDialogAction(
      key: null,
      icon: StatusVisibilityIconWidget.mapVisibilityToIconData(visibility),
      label:
          StatusVisibilityTitleWidget.mapVisibilityToTitle(context, visibility),
      onAction: onPressed,
      isSelected: isSelectedVisibility,
    );
  }
}
