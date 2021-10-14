import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/select/select_account_list_bloc.dart';
import 'package:fedi/app/async/pleroma/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/share/to_account/share_to_account_bloc.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_transparent_text_button_with_border.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ShareSelectAccountItemSendActionWidget extends StatelessWidget {
  const ShareSelectAccountItemSendActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    var account = Provider.of<IAccount>(context);
    var shareToAccountBloc = IShareToAccountBloc.of(context);

    return StreamBuilder<bool>(
      stream: shareToAccountBloc.isAlreadySharedToAccountStream(account),
      builder: (context, snapshot) {
        var isAlreadySharedToAccount = snapshot.data;

        if (isAlreadySharedToAccount != null) {
          return PleromaAsyncOperationButtonBuilderWidget(
            builder: (context, onPressed) =>
                FediTransparentTextButtonWithBorder(
              isAlreadySharedToAccount
                  ? S.of(context).app_share_action_sent
                  : S.of(context).app_share_action_send,
              onPressed: isAlreadySharedToAccount ? null : onPressed,
              color: !isAlreadySharedToAccount && onPressed != null
                  ? fediUiColorTheme.mediumGrey
                  : fediUiColorTheme.lightGrey,
              expanded: false,
            ),
            asyncButtonAction: () async {
              var selectAccountListBloc =
                  ISelectAccountListBloc.of(context, listen: false);

              var success = await shareToAccountBloc.shareToAccount(account);

              if (success) {
                selectAccountListBloc.onAccountSelected(account);
              }
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
