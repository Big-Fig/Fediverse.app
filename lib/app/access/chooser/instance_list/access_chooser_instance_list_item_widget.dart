import 'package:fedi/app/access/chooser/access_chooser_bloc.dart';
import 'package:fedi/app/access/chooser/instance_list/access_chooser_instance_list_item_bloc.dart';
import 'package:fedi/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/app/account/display_name/account_display_name_widget.dart';
import 'package:fedi/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_confirm_alert_dialog.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnifediApiAccessChooserInstanceListItemWidget extends StatelessWidget {
  const UnifediApiAccessChooserInstanceListItemWidget();

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: FediSizes.bigPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Row(
                children: const <Widget>[
                  _UnifediApiAccessChooserInstanceListItemLogoutButtonWidget(),
                  Flexible(
                    child:
                        _UnifediApiAccessChooserInstanceListItemAccountInfoWidget(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: FediSizes.bigPadding),
              child:
                  const _UnifediApiAccessChooserInstanceListItemSelectedIconWidget(),
            ),
          ],
        ),
      );
}

class _UnifediApiAccessChooserInstanceListItemAccountInfoWidget
    extends StatelessWidget {
  static const msToWaitBeforeChangeInstance = 500;

  const _UnifediApiAccessChooserInstanceListItemAccountInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceChooserBloc = IUnifediApiAccessChooserBloc.of(context);
    var instanceListItemBloc =
        IUnifediApiAccessChooserInstanceListItemBloc.of(context);

    return InkWell(
      onTap: () {
        if (!instanceListItemBloc.isSelected) {
          Navigator.of(context).pop();
          Future.delayed(
            Duration(milliseconds: msToWaitBeforeChangeInstance),
            () {
              instanceChooserBloc.chooseInstance(
                instanceListItemBloc.instance,
              );
            },
          );
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
              children: const [
                AccountDisplayNameWidget(),
                _UnifediApiAccessChooserInstanceListItemUserAtHostWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UnifediApiAccessChooserInstanceListItemUserAtHostWidget
    extends StatelessWidget {
  const _UnifediApiAccessChooserInstanceListItemUserAtHostWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceListItemBloc =
        IUnifediApiAccessChooserInstanceListItemBloc.of(context);

    return Text(
      instanceListItemBloc.instance.userAtHost,
      overflow: TextOverflow.ellipsis,
      style: IFediUiTextTheme.of(context).mediumShortDarkGrey,
    );
  }
}

class _UnifediApiAccessChooserInstanceListItemSelectedIconWidget
    extends StatelessWidget {
  const _UnifediApiAccessChooserInstanceListItemSelectedIconWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceListItemBloc =
        IUnifediApiAccessChooserInstanceListItemBloc.of(context);
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

class _UnifediApiAccessChooserInstanceListItemLogoutButtonWidget
    extends StatelessWidget {
  const _UnifediApiAccessChooserInstanceListItemLogoutButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceChooserBloc = IUnifediApiAccessChooserBloc.of(context);
    var instanceListItemBloc =
        IUnifediApiAccessChooserInstanceListItemBloc.of(context);

    return FediIconButton(
      icon: Icon(FediIcons.remove_circle),
      padding: EdgeInsets.zero,
      color: IFediUiColorTheme.of(context).darkGrey,
      onPressed: () async {
        await FediConfirmAlertDialog(
          context: context,
          title: S.of(context).app_auth_instance_logout_dialog_title,
          contentText: S.of(context).app_auth_instance_logout_dialog_content(
                instanceListItemBloc.instance.userAtHost,
              ),
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
        ).show<void>(context);
      },
    );
  }
}
