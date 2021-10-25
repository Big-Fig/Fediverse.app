import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/status/post/post_status_bloc.dart';
import 'package:fedi_app/app/status/visibility/status_visibility_icon_widget.dart';
import 'package:fedi_app/app/status/visibility/status_visibility_title_widget.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi_app/app/ui/dialog/chooser/selection/single/fedi_single_selection_chooser_dialog.dart';
import 'package:fedi_app/dialog/dialog_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unifedi_api/unifedi_api.dart';

class PostStatusVisibilityActionWidget extends StatelessWidget {
  const PostStatusVisibilityActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context);

    var isPleromaInstance = ICurrentAccessBloc.of(
      context,
      listen: false,
    ).currentInstance!.isPleroma;

    return StreamBuilder<UnifediApiVisibility>(
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
            showFediSingleSelectionChooserDialog<void>(
              context: context,
              title: S.of(context).app_status_post_visibility_title,
              actions: [
                buildVisibilityDialogAction(
                  context: context,
                  postStatusBloc: postStatusBloc,
                  visibility: UnifediApiVisibility.publicValue,
                ),
                if (isPleromaInstance)
                  buildVisibilityDialogAction(
                    context: context,
                    postStatusBloc: postStatusBloc,
                    visibility: UnifediApiVisibility.localValue,
                  ),
                buildVisibilityDialogAction(
                  context: context,
                  postStatusBloc: postStatusBloc,
                  visibility: UnifediApiVisibility.directValue,
                ),
                if (isPleromaInstance)
                  buildVisibilityDialogAction(
                    context: context,
                    postStatusBloc: postStatusBloc,
                    visibility: UnifediApiVisibility.listValue,
                  ),
                buildVisibilityDialogAction(
                  context: context,
                  postStatusBloc: postStatusBloc,
                  visibility: UnifediApiVisibility.unlistedValue,
                ),
                buildVisibilityDialogAction(
                  context: context,
                  postStatusBloc: postStatusBloc,
                  visibility: UnifediApiVisibility.privateValue,
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
    required UnifediApiVisibility visibility,
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
