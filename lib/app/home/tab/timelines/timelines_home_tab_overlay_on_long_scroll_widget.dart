import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/avatar/my_account_avatar_widget.dart';
import 'package:fedi/app/status/post/new/new_post_status_page.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:flutter/cupertino.dart';

class TimelinesHomeTabOverlayOnLongScrollWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FediDarkStatusBarStyleArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            goToNewPostStatusPage(context);
          },
          child: Container(
            color: FediColors.white,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: FediSizes.smallPadding,
                  horizontal: FediSizes.bigPadding,
                ),
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
          ),
        ),
      );

  const TimelinesHomeTabOverlayOnLongScrollWidget();
}
