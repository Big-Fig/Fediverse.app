import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/my/account_mute/my_account_account_mute_network_only_account_list_bloc.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_transparent_text_button_with_border.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:flutter/cupertino.dart';

class MyAccountAccountMuteActionMuteButtonWidget extends StatelessWidget {
  final bool defaultMuting;

  const MyAccountAccountMuteActionMuteButtonWidget({
    Key key,
    @required this.defaultMuting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listBloc = IMyAccountAccountMuteNetworkOnlyAccountListBloc.of(context);
    var paginationListBloc = IPaginationListBloc.of(context);
    var fediUiColorTheme = IFediUiColorTheme.of(context);

    var accountBloc = IAccountBloc.of(context);

    return StreamBuilder<bool>(
      stream: accountBloc.relationshipMutingStream,
      builder: (context, snapshot) {
        var relationshipMuting = snapshot.data ?? defaultMuting;
        if (relationshipMuting == null) {
          return const SizedBox.shrink();
        }

        return PleromaAsyncOperationButtonBuilderWidget(
          asyncButtonAction: () async {
            if (relationshipMuting) {
              await listBloc.removeAccountMute(
                account: accountBloc.account,
              );
            } else {
              await listBloc.addAccountMute(
                account: accountBloc.account,
              );
            }
            await paginationListBloc.refreshWithController();
          },
          builder: (context, onPressed) => FediTransparentTextButtonWithBorder(
            relationshipMuting
                ? S.of(context).app_account_my_accountMute_action_unmute
                : S.of(context).app_account_my_accountMute_action_mute,
            onPressed: onPressed,
            color: relationshipMuting
                ? fediUiColorTheme.mediumGrey
                : fediUiColorTheme.error,
            expanded: false,
          ),
        );
      },
    );
  }
}
