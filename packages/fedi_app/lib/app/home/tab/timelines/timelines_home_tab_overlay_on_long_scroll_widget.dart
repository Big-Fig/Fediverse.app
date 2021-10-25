import 'package:fedi_app/app/account/my/avatar/my_account_avatar_widget.dart';
import 'package:fedi_app/app/status/post/new/new_post_status_page.dart';
import 'package:fedi_app/app/ui/fedi_sizes.dart';
import 'package:fedi_app/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class TimelinesHomeTabOverlayOnLongScrollWidget extends StatelessWidget {
  const TimelinesHomeTabOverlayOnLongScrollWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FediDarkStatusBarStyleArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            goToNewPostStatusPageWithInitial(context);
          },
          child: Container(
            color: IFediUiColorTheme.of(context).white,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: FediSizes.smallPadding,
                  horizontal: FediSizes.bigPadding,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const MyAccountAvatarWidget(
                      imageSize: FediSizes.accountAvatarBigSize,
                      progressSize: FediSizes.accountAvatarProgressBigSize,
                    ),
                    const SizedBox(
                      width: FediSizes.bigPadding,
                    ),
                    Text(
                      S.of(context).app_status_post_field_message_hint,
                      style:
                          IFediUiTextTheme.of(context).subHeaderTallLightGrey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
