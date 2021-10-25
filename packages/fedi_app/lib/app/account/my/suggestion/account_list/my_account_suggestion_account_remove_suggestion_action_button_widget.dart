import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/my/suggestion/account_list/network_only/my_account_suggestion_account_list_network_only_list_bloc.dart';
import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_button_builder_widget.dart';
import 'package:fedi_app/app/ui/button/text/with_border/fedi_transparent_text_button_with_border.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MyAccountSuggestionAccountRemoveSuggestionActionButtonWidget
    extends StatelessWidget {
  const MyAccountSuggestionAccountRemoveSuggestionActionButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myAccountSuggestionAccountListNetworkOnlyListBloc =
        IMyAccountSuggestionAccountListNetworkOnlyListBloc.of(context);

    var account = Provider.of<IAccount>(context);
    var fediUiColorTheme = IFediUiColorTheme.of(context);

    return StreamBuilder<bool>(
      stream: myAccountSuggestionAccountListNetworkOnlyListBloc
          .isSuggestionForAccountRemovedStream(account: account),
      initialData: myAccountSuggestionAccountListNetworkOnlyListBloc
          .isSuggestionForAccountRemoved(account: account),
      builder: (context, snapshot) {
        var suggestionRemoved = snapshot.data!;
        if (suggestionRemoved) {
          return const SizedBox.shrink();
        }

        return UnifediAsyncOperationButtonBuilderWidget(
          asyncButtonAction: () async {
            await myAccountSuggestionAccountListNetworkOnlyListBloc
                .removeSuggestion(
              account: account,
            );
          },
          builder: (context, onPressed) => FediTransparentTextButtonWithBorder(
            S.of(context).app_account_my_suggestion_action_remove,
            onPressed: onPressed,
            color: fediUiColorTheme.mediumGrey,
            expanded: false,
          ),
        );
      },
    );
  }
}
