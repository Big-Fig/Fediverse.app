import 'package:fedi/app/custom_list/create/create_custom_list_bloc_impl.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/edit/account_list/edit_custom_list_account_list_pagination_list_bloc.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_app_bar_save_action_widget.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_bloc.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateCustomListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediPageTitleAppBar(
        title: S.of(context).app_customList_create_title,
        actions: <Widget>[
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

  const CreateCustomListPage();
}

void goToCreateCustomListPage({
  @required BuildContext context,
  @required Function(ICustomList) onSubmit,
}) {
  Navigator.push(
    context,
    createCreateCustomListPageRoute(
      context: context,
      onSubmit: onSubmit,
    ),
  );
}

MaterialPageRoute createCreateCustomListPageRoute({
  @required BuildContext context,
  @required Function(ICustomList) onSubmit,
}) {
  return MaterialPageRoute(
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
}
