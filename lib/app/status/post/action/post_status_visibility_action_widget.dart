import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/model_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusVisibilityActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);

    return IconButton(
      icon: StreamBuilder<PleromaVisibility>(
          stream: postStatusBloc.visibilityStream,
          initialData: postStatusBloc.visibility,
          builder: (context, snapshot) {
            var visibility = snapshot.data;
            return buildVisibilityIcon(
                context: context,
                visibility: visibility,
                isSelectedVisibility: false,
                isPossibleToChangeVisibility: true);
          }),
      onPressed: () {
        showFediModalBottomSheetDialog(
            context: context,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                // TODO: why only 4 options when 5 visibilities available
                buildVisibilityButton(
                    context, postStatusBloc, PleromaVisibility.PUBLIC),
                buildVisibilityButton(
                    context, postStatusBloc, PleromaVisibility.DIRECT),
                buildVisibilityButton(
                    context, postStatusBloc, PleromaVisibility.UNLISTED),
                buildVisibilityButton(
                    context, postStatusBloc, PleromaVisibility.PRIVATE),
              ],
            ));
      },
    );
  }

  Padding buildVisibilityButton(
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: FediSizes.middlePadding),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              onTap: () {
                onPressed();
              },
              title: Row(
                children: <Widget>[
                  buildVisibilityIcon(
                      context: context,
                      visibility: visibility,
                      isPossibleToChangeVisibility:
                          isPossibleToChangeVisibility,
                      isSelectedVisibility: isSelectedVisibility),
                  const FediBigHorizontalSpacer(),
                  buildVisibilityTitle(
                      context: context,
                      visibility: visibility,
                      isPossibleToChangeVisibility:
                          isPossibleToChangeVisibility,
                      isSelectedVisibility: isSelectedVisibility)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
