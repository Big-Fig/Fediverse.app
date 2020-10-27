import 'package:fedi/generated/l10n.dart';
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

                    title: S.of(context).app_status_post_visibility_title,
                    actions: [
                      buildVisibilityDialogAction(
                        context: context,
                        postStatusBloc: postStatusBloc,
                        visibility: PleromaVisibility.public,
                      ),
                      buildVisibilityDialogAction(
                        context: context,
                        postStatusBloc: postStatusBloc,
                        visibility: PleromaVisibility.direct,
                      ),
                      buildVisibilityDialogAction(
                        context: context,
                        postStatusBloc: postStatusBloc,
                        visibility: PleromaVisibility.unlisted,
                      ),
                      buildVisibilityDialogAction(
                        context: context,
                        postStatusBloc: postStatusBloc,
                        visibility: PleromaVisibility.private,
                      ),
                    ]);
              });
        });
  }

  SelectionDialogAction buildVisibilityDialogAction({
    @required BuildContext context,
    @required IPostStatusBloc postStatusBloc,
    @required PleromaVisibility visibility,
  }) {
    DialogActionCallback onPressed;
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
      icon: StatusVisibilityIconWidget.mapVisibilityToIconData(visibility),
      label:
          StatusVisibilityTitleWidget.mapVisibilityToTitle(context, visibility),
      onAction: onPressed,
      isSelected: isSelectedVisibility,
    );
  }
}
