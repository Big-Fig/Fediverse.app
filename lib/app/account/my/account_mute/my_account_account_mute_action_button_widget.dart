import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/my/account_mute/my_account_account_mute_network_only_account_list_bloc.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/ui/button/text/fedi_transparent_text_button.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:flutter/cupertino.dart';

class MyAccountAccountMuteActionButtonWidget extends StatelessWidget {
  final IMyAccountAccountMuteNetworkOnlyAccountListBloc listBloc;
  final IPaginationListBloc paginationListBloc;
  final bool defaultMuting;

  const MyAccountAccountMuteActionButtonWidget({
    Key key,
    @required this.listBloc,
    @required this.paginationListBloc,
    @required this.defaultMuting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);

    var accountBloc = IAccountBloc.of(context);

    return StreamBuilder<bool>(
      stream: accountBloc.relationshipMutingStream,
      initialData: accountBloc.relationshipMuting,
      builder: (context, snapshot) {
        var relationshipMuting = snapshot.data ?? defaultMuting;

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
          builder: (context, onPressed) => FediTransparentTextButton(
            relationshipMuting
                ? S.of(context).app_account_my_accountMute_action_unmute
                : S.of(context).app_account_my_accountMute_action_mute,
            onPressed: onPressed,
            color: relationshipMuting
                ? fediUiColorTheme.primary
                : fediUiColorTheme.error,
          ),
        );
      },
    );
  }
}
