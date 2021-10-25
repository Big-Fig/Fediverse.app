import 'package:fedi_app/app/account/account_bloc.dart';
import 'package:fedi_app/app/account/action/mute/account_action_mute_dialog.dart';
import 'package:fedi_app/app/account/my/account_mute/my_account_account_mute_network_only_account_list_bloc.dart';
import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_button_builder_widget.dart';
import 'package:fedi_app/app/ui/button/text/with_border/fedi_transparent_text_button_with_border.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:flutter/cupertino.dart';

class MyAccountAccountMuteActionMuteButtonWidget extends StatelessWidget {
  final bool? defaultMuting;

  const MyAccountAccountMuteActionMuteButtonWidget({
    Key? key,
    required this.defaultMuting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listBloc = IMyAccountAccountMuteNetworkOnlyAccountListBloc.of(context);
    var paginationListBloc = IPaginationListBloc.of(context);
    var fediUiColorTheme = IFediUiColorTheme.of(context);

    var accountBloc = IAccountBloc.of(context);

    return StreamBuilder<bool?>(
      stream: accountBloc.relationshipMutingStream,
      builder: (context, snapshot) {
        var relationshipMuting = snapshot.data ?? defaultMuting;
        if (relationshipMuting == null) {
          return const SizedBox.shrink();
        }

        if (relationshipMuting) {
          return UnifediAsyncOperationButtonBuilderWidget(
            asyncButtonAction: () async {
              await listBloc.removeAccountMute(
                account: accountBloc.account,
              );
              await paginationListBloc.refreshWithController();
            },
            builder: (context, onPressed) =>
                FediTransparentTextButtonWithBorder(
              S.of(context).app_account_my_accountMute_action_unmute,
              onPressed: onPressed,
              color: fediUiColorTheme.mediumGrey,
              expanded: false,
            ),
          );
        } else {
          return FediTransparentTextButtonWithBorder(
            S.of(context).app_account_my_accountMute_action_mute,
            onPressed: () async {
              await showAccountActionMuteDialog(
                context: context,
                accountBloc: accountBloc,
              );

              // ignore: avoid-ignoring-return-values
              await paginationListBloc.refreshWithoutController();
            },
            color: fediUiColorTheme.error,
            expanded: false,
          );
        }
      },
    );
  }
}
