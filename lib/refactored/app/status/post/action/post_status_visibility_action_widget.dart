import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/refactored/app/status/post/post_status_bloc.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusVisibilityActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);

    return IconButton(
      icon: InitialDataStreamBuilder<PleromaVisibility>(
          stream: postStatusBloc.visibilityStream,
          initialData: postStatusBloc.visibility,
          builder: (context, snapshot) {
            var visibility = snapshot.data;
            return buildVisibilityIcon(
                context: context,
                visibility: visibility,
                isSelectedVisibility: true,
                isPossibleToChangeVisibility: true);
          }),
      onPressed: () {
        showModalBottomSheet(
            builder: (BuildContext context) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // TODO: why only 3 options when 5 visibilities available
                  buildVisibilityButton(
                      context, postStatusBloc, PleromaVisibility.PUBLIC),
                  buildVisibilityButton(
                      context, postStatusBloc, PleromaVisibility.UNLISTED),
                  buildVisibilityButton(
                      context, postStatusBloc, PleromaVisibility.PRIVATE),
                  Container(
                    height: 30,
                  ),
                  buildCancelButton(context),
                ],
              ),
            context: context);
      },
    );
  }

  Padding buildCancelButton(BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: OutlineButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context).tr("post.quick_post.action"
                        ".cancel"),
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );

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
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: OutlineButton(
              child: Row(
                children: <Widget>[
                  buildVisibilityIcon(
                      context: context,
                      visibility: visibility,
                      isPossibleToChangeVisibility:
                          isPossibleToChangeVisibility,
                      isSelectedVisibility: isSelectedVisibility),
                  buildVisibilityTitle(
                      context: context,
                      visibility: visibility,
                      isPossibleToChangeVisibility:
                          isPossibleToChangeVisibility,
                      isSelectedVisibility: isSelectedVisibility)
                ],
              ),
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }

  Icon buildVisibilityIcon(
          {@required BuildContext context,
          @required PleromaVisibility visibility,
          @required isPossibleToChangeVisibility,
          @required isSelectedVisibility}) =>
      Icon(mapVisibilityToIconData(visibility),
          color: calculateVisibilityColor(
              isSelectedVisibility, isPossibleToChangeVisibility));

  IconData mapVisibilityToIconData(PleromaVisibility visibility) {
    switch (visibility) {
      case PleromaVisibility.PUBLIC:
        return Icons.public;
        break;
      case PleromaVisibility.UNLISTED:
        return Icons.lock_open;
        break;
      case PleromaVisibility.DIRECT:
        return Icons.message;
        break;
      case PleromaVisibility.LIST:
        return Icons.list;
        break;
      case PleromaVisibility.PRIVATE:
        return Icons.lock;
        break;
    }
    throw "Not supported visibility $visibility";
  }

  Text buildVisibilityTitle({
    @required BuildContext context,
    @required PleromaVisibility visibility,
    @required isPossibleToChangeVisibility,
    @required isSelectedVisibility,
  }) =>
      Text(mapVisibilityToTitle(context, visibility),
          style: TextStyle(
              color: calculateVisibilityColor(
                  isSelectedVisibility, isPossibleToChangeVisibility)));

  Color calculateVisibilityColor(
      isSelectedVisibility, isPossibleToChangeVisibility) {
    return isSelectedVisibility
        ? Colors.blue
        : isPossibleToChangeVisibility ? Colors.black : Colors.grey;
  }

  String mapVisibilityToTitle(
      BuildContext context, PleromaVisibility visibility) {
    var appLocalizations = AppLocalizations.of(context);
    switch (visibility) {
      case PleromaVisibility.PUBLIC:
        return appLocalizations.tr("post.quick_post.visibility.public");
        break;
      case PleromaVisibility.UNLISTED:
        return appLocalizations.tr("post.quick_post.visibility.unlisted");
        break;
      case PleromaVisibility.DIRECT:
        return appLocalizations.tr("post.quick_post.visibility.direct");
        break;
      case PleromaVisibility.LIST:
        return appLocalizations.tr("post.quick_post.visibility.list");
        break;
      case PleromaVisibility.PRIVATE:
        return appLocalizations.tr("post.quick_post.visibility.private");
        break;
    }
    throw "Not supported visibility $visibility";
  }
}
