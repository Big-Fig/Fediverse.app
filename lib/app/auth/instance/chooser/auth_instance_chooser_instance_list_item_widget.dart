import 'package:fedi/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/app/account/display_name/account_display_name_widget.dart';
import 'package:fedi/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/app/auth/instance/chooser/auth_instance_chooser_bloc.dart';
import 'package:fedi/app/auth/instance/chooser/auth_instance_chooser_instance_list_item_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_confirm_alert_dialog.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthInstanceChooserInstanceListItemWidget extends StatelessWidget {
  const AuthInstanceChooserInstanceListItemWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: FediSizes.bigPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                const _AuthInstanceChooserInstanceListItemLogoutButtonWidget(),
                const FediBigHorizontalSpacer(),
                Flexible(
                  child:
                      const _AuthInstanceChooserInstanceListItemAccountInfoWidget(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: FediSizes.bigPadding),
            child:
                const _AuthInstanceChooserInstanceListItemSelectedIconWidget(),
          ),
        ],
      ),
    );
  }
}

class _AuthInstanceChooserInstanceListItemAccountInfoWidget
    extends StatelessWidget {
  const _AuthInstanceChooserInstanceListItemAccountInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceChooserBloc = IAuthInstanceChooserBloc.of(context);
    var instanceListItemBloc =
        IAuthInstanceChooserInstanceListItemBloc.of(context);
    return InkWell(
      onTap: () {
        if (!instanceListItemBloc.isSelected) {
          Navigator.of(context).pop();
          Future.delayed(Duration(milliseconds: 500), () {
            instanceChooserBloc.chooseInstance(instanceListItemBloc.instance);
          });
        }
      },
      child: Row(
        children: [
          AccountAvatarWidget(
            imageSize: FediSizes.accountAvatarBigSize,
            progressSize: FediSizes.accountAvatarProgressBigSize,
          ),
          const FediBigHorizontalSpacer(),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AccountDisplayNameWidget(),
                const _AuthInstanceChooserInstanceListItemUserAtHostWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AuthInstanceChooserInstanceListItemUserAtHostWidget
    extends StatelessWidget {
  const _AuthInstanceChooserInstanceListItemUserAtHostWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceListItemBloc =
        IAuthInstanceChooserInstanceListItemBloc.of(context);
    return Text(
      instanceListItemBloc?.instance?.userAtHost ?? "",
      overflow: TextOverflow.ellipsis,
      style: IFediUiTextTheme.of(context).mediumShortDarkGrey,
    );
  }
}

class _AuthInstanceChooserInstanceListItemSelectedIconWidget
    extends StatelessWidget {
  const _AuthInstanceChooserInstanceListItemSelectedIconWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceListItemBloc =
        IAuthInstanceChooserInstanceListItemBloc.of(context);
    if (instanceListItemBloc.isSelected) {
      return FediIconInCircleTransparentButton(
        FediIcons.check,
        size: FediSizes.smallFilledButtonHeight,
        onPressed: null,
        color: IFediUiColorTheme.of(context).primary,
      );
    } else {
      return SizedBox(width: FediSizes.smallFilledButtonHeight);
    }
  }
}

class _AuthInstanceChooserInstanceListItemLogoutButtonWidget
    extends StatelessWidget {
  const _AuthInstanceChooserInstanceListItemLogoutButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceChooserBloc = IAuthInstanceChooserBloc.of(context);
    var instanceListItemBloc =
        IAuthInstanceChooserInstanceListItemBloc.of(context);
    return FediIconInCircleTransparentButton(
      FediIcons.remove,
      color: IFediUiColorTheme.of(context).darkGrey,
      size: FediSizes.smallFilledButtonHeight,
      onPressed: () async {
        await FediConfirmAlertDialog(
          context: context,
          title: S.of(context).app_auth_instance_logout_dialog_title,
          contentText: S.of(context).app_auth_instance_logout_dialog_content(
              instanceListItemBloc.instance.userAtHost),
          onAction: (context) async {
            if (instanceListItemBloc.isSelected) {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              var authHostBloc = AuthHostBloc.createFromContext(
                context,
                instanceBaseUri: instanceListItemBloc.instance.uri,
              );
              await authHostBloc.performAsyncInit();
              await authHostBloc.logout();
            } else {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              await instanceChooserBloc.removeInstance(
                instanceListItemBloc.instance,
              );
            }
          },
        ).show(context);
      },
    );
  }
}
