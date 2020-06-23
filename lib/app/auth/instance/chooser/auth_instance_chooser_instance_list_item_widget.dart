import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/app/account/display_name/account_display_name_widget.dart';
import 'package:fedi/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/chooser/auth_instance_chooser_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/dialog/alert/confirm_alert_dialog.dart';
import 'package:flutter/cupertino.dart';

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
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                buildLogoutButton(context, instance),
                SizedBox(
                  width: 16.0,
                ),
                Flexible(
                  child: buildAccountInfo(context, instanceChooserBloc),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: buildSelectedIcon(),
          ),
        ],
      ),
    );
  }

  GestureDetector buildAccountInfo(
      BuildContext context, IAuthInstanceChooserBloc instanceChooserBloc) {
    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          _showConfirmChooseInstance(context, instanceChooserBloc);
        }
      },
      child: Row(
        children: [
          AccountAvatarWidget(
            imageSize: 48.0,
            progressSize: 36.0,
          ),
          SizedBox(
            width: 16.0,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AccountDisplayNameWidget(),
                buildInstanceUserAtHost(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSelectedIcon() {
    if (isSelected) {
      return FediIconInCircleTransparentButton(
        FediIcons.check,
        size: FediSizes.smallFilledButtonHeight,
        onPressed: null,
        color: FediColors.primaryColor,
      );
    } else {
      return SizedBox(width: FediSizes.smallFilledButtonHeight);
    }
  }

  Text buildInstanceUserAtHost() {
    return Text(
      instance.userAtHost,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 14.0,
        color: FediColors.darkGrey,
        height: 1.15,
      ),
    );
  }

  void _showConfirmChooseInstance(
      BuildContext context, IAuthInstanceChooserBloc instanceChooserBloc) {
    ConfirmAlertDialog(
      context: context,
      title: tr("app.auth.instance.chooser.dialog.title"),
      content: tr("app.auth.instance.chooser.dialog.title"),
      onAction: () {
        instanceChooserBloc.chooseInstance(instance);
      },
    ).show(context);
  }

  Widget buildLogoutButton(BuildContext context, AuthInstance instance) =>
      FediIconInCircleTransparentButton(
        FediIcons.remove,
        color: FediColors.darkGrey,
        size: FediSizes.smallFilledButtonHeight,
        onPressed: () async {
          var instanceChooserBloc =
          IAuthInstanceChooserBloc.of(context, listen: false);

          await ConfirmAlertDialog(
            context: context,
            title: tr("app.auth.instance.logout.dialog.title"),
            content: tr("app.auth.instance.logout.dialog.content"),
            onAction: () async {
              if (isSelected) {
                var authHostBloc = AuthHostBloc.createFromContext(context,
                    instanceBaseUrl: instance.url);
                await authHostBloc.performAsyncInit();
                await authHostBloc.logout();


              } else {
                await instanceChooserBloc.removeInstance(instance);
                Navigator.of(context).pop();
              }
            },
          ).show(context);
        },
      );
}
