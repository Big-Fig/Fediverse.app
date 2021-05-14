import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/my/account_mute/my_account_account_mute_network_only_account_list_bloc.dart';
import 'package:fedi/app/async/pleroma/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/toast/toast_service.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class MyAccountAccountMuteActionNotificationsButtonWidget
    extends StatelessWidget {
  final bool defaultMuting;

  const MyAccountAccountMuteActionNotificationsButtonWidget({
    Key? key,
    required this.defaultMuting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);

    return StreamBuilder<bool?>(
      stream: accountBloc.relationshipMutingStream,
      builder: (context, snapshot) {
        var relationshipMuting = snapshot.data ?? defaultMuting;

        if (relationshipMuting) {
          return const _MyAccountAccountMuteActionNotificationsButtonBodyWidget();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _MyAccountAccountMuteActionNotificationsButtonBodyWidget
    extends StatelessWidget {
  const _MyAccountAccountMuteActionNotificationsButtonBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);

    var accountBloc = IAccountBloc.of(context);

    var listBloc = IMyAccountAccountMuteNetworkOnlyAccountListBloc.of(context);

    return StreamBuilder<bool?>(
      stream: accountBloc.relationshipMutingNotificationsStream,
      builder: (context, snapshot) {
        var relationshipMutingNotifications = snapshot.data;
        if (relationshipMutingNotifications == null) {
          return const SizedBox.shrink();
        }

        return PleromaAsyncOperationButtonBuilderWidget(
          asyncButtonAction: () async {
            var newMutingNotifications =
                !accountBloc.relationshipMutingNotifications!;
            await listBloc.changeAccountMute(
              account: accountBloc.account,
              notifications: newMutingNotifications,
              duration: null,
            );

            var toastService = IToastService.of(context, listen: false);
            if (newMutingNotifications) {
              toastService.showInfoToast(
                context: context,
                title: S
                    .of(context)
                    .app_account_mute_toast_mute_with_notifications,
              );
            } else {
              toastService.showInfoToast(
                context: context,
                title: S
                    .of(context)
                    .app_account_mute_toast_mute_without_notifications,
              );
            }
          },
          builder: (context, onPressed) => FediIconButton(
            icon: Icon(relationshipMutingNotifications
                ? FediIcons.mute
                : FediIcons.unmute),
            onPressed: onPressed,
            color: relationshipMutingNotifications
                ? fediUiColorTheme.darkGrey
                : fediUiColorTheme.primary,
          ),
        );
      },
    );
  }
}
