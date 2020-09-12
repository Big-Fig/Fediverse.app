import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/visibility/status_visibility_icon_widget.dart';
import 'package:fedi/app/status/visibility/status_visibility_title_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_selection_chooser_dialog.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusVisibilityActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);

    return StreamBuilder<PleromaVisibility>(
        stream: postStatusBloc.visibilityStream,
        initialData: postStatusBloc.visibility,
        builder: (context, snapshot) {
          var visibility = snapshot.data;
          var icon = StatusVisibilityIconWidget.buildVisibilityIcon(
              context: context,
              visibility: visibility,
              isSelectedVisibility: false,
              isPossibleToChangeVisibility: true);

          return FediIconButton(
              icon: icon,
              onPressed: () {
                showFediSelectionChooserDialog(
                    context: context,
                    title: "app.status.post.visibility.title".tr(),
                    actions: [
                      buildVisibilityDialogAction(
                          context, postStatusBloc, PleromaVisibility.public),
                      buildVisibilityDialogAction(
                          context, postStatusBloc, PleromaVisibility.direct),
                      buildVisibilityDialogAction(
                          context, postStatusBloc, PleromaVisibility.unlisted),
                      buildVisibilityDialogAction(
                          context, postStatusBloc, PleromaVisibility.private),
                    ]);
              });
        });
  }

  SelectionDialogAction buildVisibilityDialogAction(
    BuildContext context,
    IPostStatusBloc postStatusBloc,
    PleromaVisibility visibility,
  ) {
    Null Function() onPressed;
    var isPossibleToChangeVisibility =
        postStatusBloc.isPossibleToChangeVisibility;
    var isSelectedVisibility = postStatusBloc.visibility == visibility;
    if (isPossibleToChangeVisibility) {
      onPressed = () {
        postStatusBloc.changeVisibility(visibility);
        Navigator.of(context).pop();
      };
    }

    return SelectionDialogAction(
      icon: StatusVisibilityIconWidget.mapVisibilityToIconData(visibility),
      label:
          StatusVisibilityTitleWidget.mapVisibilityToTitle(context, visibility),
      onAction: onPressed,
      isSelected: isSelectedVisibility,
    );
  }
}
