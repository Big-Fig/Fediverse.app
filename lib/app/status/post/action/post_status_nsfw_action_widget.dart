import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
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

            return Container(
              height: double.infinity,
              child: Center(
                child: Text(tr("app.status.post.nsfw.title").toUpperCase(),
                    style: TextStyle(
                      color: calculateColor(nsfwSensitive),
                      fontSize: 14,
                      height: 1.15,
                    )),
              ),
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
