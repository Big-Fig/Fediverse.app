import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/app/account/display_name/account_display_name_widget.dart';
import 'package:fedi/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/chooser/auth_instance_chooser_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_confirm_alert_dialog.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthInstanceChooserInstanceListItemWidget extends StatelessWidget {
  final bool isSelected;
  final AuthInstance instance;

  AuthInstanceChooserInstanceListItemWidget({
    @required this.isSelected,
    @required this.instance,
  });

  @override
  Widget build(BuildContext context) {
    var instanceChooserBloc =
        IAuthInstanceChooserBloc.of(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(bottom: FediSizes.bigPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                buildLogoutButton(context, instance),
                const FediBigHorizontalSpacer(),
                Flexible(
                  child: buildAccountInfo(context, instanceChooserBloc),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: FediSizes.bigPadding),
            child: buildSelectedIcon(
              context: context,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAccountInfo(
      BuildContext context, IAuthInstanceChooserBloc instanceChooserBloc) {
    return InkWell(
      onTap: () {
        if (!isSelected) {
          Navigator.of(context).pop();
          Future.delayed(Duration(milliseconds: 500), () {
            instanceChooserBloc.chooseInstance(instance);
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
                AccountDisplayNameWidget(),
                buildInstanceUserAtHost(
                  context: context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSelectedIcon({@required BuildContext context}) {
    if (isSelected) {
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

  Text buildInstanceUserAtHost({@required BuildContext context}) {
    return Text(
      instance.userAtHost,
      overflow: TextOverflow.ellipsis,
      style: IFediUiTextTheme.of(context).mediumShortDarkGrey,
    );
  }

  Widget buildLogoutButton(BuildContext context, AuthInstance instance) =>
      FediIconInCircleTransparentButton(
        FediIcons.remove,
        color: IFediUiColorTheme.of(context).darkGrey,
        size: FediSizes.smallFilledButtonHeight,
        onPressed: () async {
          var instanceChooserBloc =
              IAuthInstanceChooserBloc.of(context, listen: false);

          await FediConfirmAlertDialog(
            context: context,
            title: tr("app.auth.instance.logout.dialog.title"),
            content: tr("app.auth.instance.logout.dialog.content",
                args: [instance.userAtHost]),
            onAction: () async {
              if (isSelected) {
                await Navigator.of(context).pop();
                await Navigator.of(context).pop();
                var authHostBloc = AuthHostBloc.createFromContext(context,
                    instanceBaseUrl: instance.url);
                await authHostBloc.performAsyncInit();
                await authHostBloc.logout();
              } else {
                await Navigator.of(context).pop();
                await Navigator.of(context).pop();
                await instanceChooserBloc.removeInstance(instance);
              }
            },
          ).show(context);
        },
      );
}
