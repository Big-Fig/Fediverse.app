import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/avatar/my_account_avatar_widget.dart';
import 'package:fedi/app/status/post/new/new_post_status_page.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';

class TimelinesHomeTabOverlayOnLongScrollWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        goToNewPostStatusPage(context);
      },
      child: Container(
        color: FediColors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              MyAccountAvatarWidget(
                imageSize: 40,
                progressSize: 24,
              ),
              SizedBox(
                width: 24.0,
              ),
              Text(
                tr("app.status.post.field.message.hint"),
                style: TextStyle(
                    fontSize: 18.0,
                    color: FediColors.lightGrey,
                    height: 1.5,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
    );
  }

  const TimelinesHomeTabOverlayOnLongScrollWidget();
}
