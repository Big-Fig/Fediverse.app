import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/edit/account_list/edit_custom_list_account_list_pagination_list_bloc.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_app_bar_save_action_widget.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_bloc.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_bloc_impl.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditCustomListPage extends StatelessWidget {
  const EditCustomListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediPageTitleAppBar(
          title: S.of(context).app_customList_edit_title,
          actions: const <Widget>[
            EditCustomListAppBarSaveActionWidget(),
          ],
        ),
        body: const SafeArea(
          child: Padding(
            padding: FediPadding.allBigPadding,
            child: EditCustomListWidget(),
          ),
        ),
      );
}

void goToEditCustomListPage({
  required BuildContext context,
  required ICustomList customList,
  required Function(ICustomList customList) onSubmit,
  required VoidCallback onDelete,
}) {
  Navigator.push(
    context,
    createEditCustomListPageRoute(
      context: context,
      customList: customList,
      onSubmit: onSubmit,
      onDelete: onDelete,
    ),
  );
}

MaterialPageRoute<void> createEditCustomListPageRoute({
  required BuildContext context,
  required ICustomList customList,
  required Function(ICustomList customList) onSubmit,
  required VoidCallback onDelete,
}) =>
    MaterialPageRoute<void>(
      builder: (context) => EditCustomListBloc.provideToContext(
        context,
        onSubmit: onSubmit,
        onDelete: onDelete,
        child: ProxyProvider<IEditCustomListBloc,
            IEditCustomListAccountListPaginationListBloc>(
          update: (context, value, _) =>
              value.editCustomListAccountListPaginationListBloc,
          child: const EditCustomListPage(),
        ),
        initialValue: customList,
      ),
    );
