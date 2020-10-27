import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/custom_list/accounts/custom_list_account_list_widget.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_app_bar_save_action_widget.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_bloc_impl.dart';
import 'package:fedi/app/custom_list/form/custom_list_form_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditCustomListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: S.of(context).app_customList_edit_title,

        actions: <Widget>[
          EditCustomListAppBarSaveActionWidget(),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: FediPadding.allBigPadding,
              child: CustomListFormWidget(),
            ),
            Expanded(
              child: CustomListAccountListWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

void goToEditCustomListPage({
  @required BuildContext context,
  @required ICustomList customList,
  @required VoidCallback successCallback,
}) {
  Navigator.push(
    context,
    createEditCustomListPageRoute(
      context: context,
      customList: customList,
      successCallback: successCallback,
    ),
  );
}

MaterialPageRoute createEditCustomListPageRoute({
  @required BuildContext context,
  @required ICustomList customList,
  @required VoidCallback successCallback,
}) {
  return MaterialPageRoute(
    builder: (context) => EditCustomListBloc.provideToContext(
      context,
      child: EditCustomListPage(),
      initialValue: customList,
      successCallback: successCallback,
    ),
  );
}
