import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/action/account_action_list_widget.dart';
import 'package:fedi/app/account/field/account_field_list_widget.dart';
import 'package:fedi/app/account/header/account_header_background_widget.dart';
import 'package:fedi/app/account/my/edit/edit_my_account_page.dart';
import 'package:fedi/app/account/my/info/my_account_info_widget.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/statuses/bookmarked/my_account_bookmarked_statuses_page.dart';
import 'package:fedi/app/account/note/account_note_widget.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_transparent_text_button_with_border.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/ui/callback/on_click_ui_callback.dart';
import 'package:flutter/material.dart';

class MyAccountWidget extends StatelessWidget {
  final OnClickUiCallback? onStatusesTapCallback;
  final Widget? footer;
  final Brightness brightness;

  const MyAccountWidget({
    required this.onStatusesTapCallback,
    required this.footer,
    required this.brightness,
  });

  static const EdgeInsets _bodyPadding = EdgeInsets.only(
    left: FediSizes.accountAvatarBigSize + FediSizes.bigPadding * 2,
    right: FediSizes.bigPadding,
  );

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);
    var myAccountBloc = IMyAccountBloc.of(context, listen: false);
    var isNotMyAccount = !myAccountBloc.checkAccountIsMe(accountBloc.account);
    return Column(
      children: [
        Stack(
          children: [
            if (brightness == Brightness.light)
              Positioned.fill(
                child: Container(
                  color: IFediUiColorTheme.of(context).white,
                  child: const AccountHeaderBackgroundWidget(),
                ),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                MyAccountInfoWidget(
                  onStatusesTapCallback: onStatusesTapCallback,
                  brightness: brightness,
                ),
                if (isNotMyAccount)
                  Container(
                    color: IFediUiColorTheme.of(context).primary,
                    child: const AccountActionListWidget(),
                  ),
                AccountNoteWidget(
                  textStyle: brightness == Brightness.dark
                      ? IFediUiTextTheme.of(context).bigTallBoldDarkGrey
                      : IFediUiTextTheme.of(context).bigTallBoldWhite,
                ),
                Padding(
                  padding: _bodyPadding,
                  child: AccountFieldListWidget(
                    brightness: brightness,
                  ),
                ),
                Padding(
                  padding: _bodyPadding,
                  child: _MyAccountFooterWidget(
                    brightness: brightness,
                  ),
                ),
                const FediBigVerticalSpacer(),
              ],
            ),
          ],
        ),
        if (footer != null) footer!,
      ],
    );
  }
}

class _MyAccountFooterWidget extends StatelessWidget {
  final Brightness brightness;

  const _MyAccountFooterWidget({
    Key? key,
    required this.brightness,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = brightness == Brightness.dark
        ? IFediUiColorTheme.of(context).mediumGrey
        : IFediUiColorTheme.of(context).ultraLightGrey;

    return Row(
      children: [
        Expanded(
          child: FediTransparentTextButtonWithBorder(
            S.of(context).app_account_my_action_edit,
            onPressed: () {
              goToEditMyAccountPage(context);
            },
            color: color,
            expanded: true,
          ),
        ),
        const FediBigHorizontalSpacer(),
        Expanded(
          child: FediTransparentTextButtonWithBorder(
            S.of(context).app_account_my_action_bookmarked,
            onPressed: () {
              goToMyAccountBookmarkedStatusesPage(context);
            },
            color: color,
            expanded: true,
          ),
        ),
      ],
    );
  }
}
