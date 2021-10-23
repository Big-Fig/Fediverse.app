import 'package:fedi/app/account/action/account_action_list_widget.dart';
import 'package:fedi/app/account/field/account_field_list_widget.dart';
import 'package:fedi/app/account/header/account_header_background_widget.dart';
import 'package:fedi/app/account/info/account_info_widget.dart';
import 'package:fedi/app/account/note/account_note_widget.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/ui/callback/on_click_ui_callback.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  final OnClickUiCallback onStatusesTapCallback;
  final Widget footer;

  const AccountWidget({
    Key? key,
    required this.onStatusesTapCallback,
    required this.footer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  color: IFediUiColorTheme.of(context).white,
                  child: const AccountHeaderBackgroundWidget(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: FediSizes.bigPadding,
                  bottom: FediSizes.smallPadding,
                  left: FediSizes.bigPadding,
                  // ignore: no-equal-arguments
                  right: FediSizes.bigPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: FediSizes.smallPadding),
                      child: AccountInfoWidget(
                        onStatusesTapCallback: onStatusesTapCallback,
                      ),
                    ),
                    const AccountActionListWidget(),
                    const _AccountNoteWidget(),
                    const _AccountFieldListWidget(),
                  ],
                ),
              ),
            ],
          ),
          footer,
        ],
      );
}

class _AccountFieldListWidget extends StatelessWidget {
  const _AccountFieldListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(_) => const Padding(
        padding: EdgeInsets.only(
          left: FediSizes.accountAvatarBigSize + FediSizes.bigPadding * 2,
          right: FediSizes.bigPadding,
        ),
        child: AccountFieldListWidget(
          brightness: Brightness.light,
        ),
      );
}

class _AccountNoteWidget extends StatelessWidget {
  const _AccountNoteWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AccountNoteWidget(
        textStyle: IFediUiTextTheme.of(context).bigTallBoldWhite,
      );
}
