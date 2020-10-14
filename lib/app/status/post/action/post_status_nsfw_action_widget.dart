import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusNsfwActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);

    return InkWell(
      child: StreamBuilder<bool>(
          stream: postStatusBloc.isNsfwSensitiveEnabledStream,
          initialData: postStatusBloc.isNsfwSensitiveEnabled,
          builder: (context, snapshot) {
            var nsfwSensitive = snapshot.data;

            return FediIconButton(
              icon: Icon(
                Icons.visibility,
                color: calculateColor(nsfwSensitive),
              ),
              onPressed: () {
                postStatusBloc.changeNsfwSensitive(
                    !postStatusBloc.isNsfwSensitiveEnabled);
              },
            );
          }),
      onTap: () {
        postStatusBloc
            .changeNsfwSensitive(!postStatusBloc.isNsfwSensitiveEnabled);
      },
    );
  }

  Color calculateColor(bool sensitive) {
    return sensitive ? FediColors.primaryColor : FediColors.darkGrey;
  }
}
