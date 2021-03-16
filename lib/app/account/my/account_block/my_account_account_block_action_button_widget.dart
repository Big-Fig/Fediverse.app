import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/my/account_block/my_account_account_block_network_only_account_list_bloc.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_transparent_text_button_with_border.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:flutter/cupertino.dart';

class MyAccountAccountBlockActionButtonWidget extends StatelessWidget {
  final IMyAccountAccountBlockNetworkOnlyAccountListBloc listBloc;
  final IPaginationListBloc paginationListBloc;
  final bool defaultBlocking;

  const MyAccountAccountBlockActionButtonWidget({
    Key? key,
    required this.listBloc,
    required this.paginationListBloc,
    required this.defaultBlocking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);

    var accountBloc = IAccountBloc.of(context);

    return StreamBuilder<bool?>(
      stream: accountBloc.relationshipBlockingStream,
      initialData: accountBloc.relationshipBlocking,
      builder: (context, snapshot) {
        var relationshipBlocking = snapshot.data ?? defaultBlocking;

        return PleromaAsyncOperationButtonBuilderWidget(
          asyncButtonAction: () async {
            if (relationshipBlocking) {
              await listBloc.removeAccountBlock(
                account: accountBloc.account!,
              );
            } else {
              await listBloc.addAccountBlock(
                account: accountBloc.account!,
              );
            }
            await paginationListBloc.refreshWithController();
          },
          builder: (context, onPressed) => FediTransparentTextButtonWithBorder(
            relationshipBlocking
                ? S.of(context).app_account_my_accountBlock_action_unblock
                : S.of(context).app_account_my_accountBlock_action_block,
            onPressed: onPressed,
            color: relationshipBlocking
                ? fediUiColorTheme.mediumGrey
                : fediUiColorTheme.error,
            expanded: false,
          ),
        );
      },
    );
  }
}
