import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_button_builder_widget.dart';
import 'package:fedi_app/app/custom_list/edit/account_list/edit_custom_list_account_list_pagination_list_bloc.dart';
import 'package:fedi_app/app/ui/button/text/with_border/fedi_transparent_text_button_with_border.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CustomListAccountListItemAddRemoveActionWidget extends StatelessWidget {
  const CustomListAccountListItemAddRemoveActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editCustomListAccountListBloc =
        IEditCustomListAccountListPaginationListBloc.of(context);
    var paginationListBloc = IPaginationListBloc.of(context);

    var account = Provider.of<IAccount>(context);

    var fediUiColorTheme = IFediUiColorTheme.of(context);

    return StreamBuilder<bool>(
      stream: editCustomListAccountListBloc.isItemAddedStream(account),
      builder: (context, snapshot) {
        var isItemAddedStream = snapshot.data;

        if (isItemAddedStream == null) {
          return const SizedBox.shrink();
        }

        return UnifediAsyncOperationButtonBuilderWidget(
          asyncButtonAction: () async {
            if (isItemAddedStream) {
              await editCustomListAccountListBloc.removeItem(account);
            } else {
              await editCustomListAccountListBloc.addItem(account);
            }

            await paginationListBloc.refreshWithController();
          },
          builder: (context, onPressed) => FediTransparentTextButtonWithBorder(
            isItemAddedStream
                ? S
                    .of(context)
                    .app_account_my_customList_edit_account_action_remove
                : S
                    .of(context)
                    .app_account_my_customList_edit_account_action_add,
            onPressed: onPressed,
            color: isItemAddedStream
                ? fediUiColorTheme.error
                : fediUiColorTheme.primary,
            expanded: false,
          ),
        );
      },
    );
  }
}
