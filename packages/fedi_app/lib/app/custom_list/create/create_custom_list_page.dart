import 'package:fedi_app/app/custom_list/create/create_custom_list_bloc_impl.dart';
import 'package:fedi_app/app/custom_list/custom_list_model.dart';
import 'package:fedi_app/app/custom_list/edit/account_list/edit_custom_list_account_list_pagination_list_bloc.dart';
import 'package:fedi_app/app/custom_list/edit/edit_custom_list_app_bar_save_action_widget.dart';
import 'package:fedi_app/app/custom_list/edit/edit_custom_list_bloc.dart';
import 'package:fedi_app/app/custom_list/edit/edit_custom_list_widget.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateCustomListPage extends StatelessWidget {
  const CreateCustomListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediPageTitleAppBar(
          title: S.of(context).app_customList_create_title,
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

void goToCreateCustomListPage({
  required BuildContext context,
  required Function(ICustomList) onSubmit,
}) {
  Navigator.push(
    context,
    createCreateCustomListPageRoute(
      context: context,
      onSubmit: onSubmit,
    ),
  );
}

MaterialPageRoute<void> createCreateCustomListPageRoute({
  required BuildContext context,
  required Function(ICustomList) onSubmit,
}) =>
    MaterialPageRoute<void>(
      builder: (context) => CreateCustomListBloc.provideToContext(
        context,
        child: ProxyProvider<IEditCustomListBloc,
            IEditCustomListAccountListPaginationListBloc>(
          update: (context, value, _) =>
              value.editCustomListAccountListPaginationListBloc,
          child: const CreateCustomListPage(),
        ),
        onSubmit: onSubmit,
      ),
    );
