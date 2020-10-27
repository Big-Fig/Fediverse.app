import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/custom_list/create/create_custom_list_bloc_impl.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_app_bar_save_action_widget.dart';
import 'package:fedi/app/custom_list/form/custom_list_form_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateCustomListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: S.of(context).app_customList_create_title,
        actions: <Widget>[
          EditCustomListAppBarSaveActionWidget(),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: FediPadding.allBigPadding,
          child: CustomListFormWidget(),
        ),
      ),
    );
  }
}

void goToCreateCustomListPage({
  @required BuildContext context,
  @required VoidCallback successCallback,
}) {
  Navigator.push(
    context,
    createCreateCustomListPageRoute(
      context: context,
      successCallback: successCallback,
    ),
  );
}

MaterialPageRoute createCreateCustomListPageRoute({
  @required BuildContext context,
  @required VoidCallback successCallback,
}) {
  return MaterialPageRoute(
    builder: (context) => CreateCustomListBloc.provideToContext(
      context,
      child: CreateCustomListPage(),
        successCallback:successCallback,
    ),
  );
}
