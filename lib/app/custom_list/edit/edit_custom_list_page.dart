import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/custom_list/accounts/custom_list_account_list_widget.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/form/custom_list_form_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditCustomListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: "app.custom_list.edit.title".tr(),
        actions: <Widget>[
          FediIconButton(
            icon: Icon(FediIcons.check),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CustomListFormWidget(),
            CustomListAccountListWidget(),
          ],
        ),
      ),
    );
  }
}

void goToEditCustomListPage({
  @required BuildContext context,
  @required ICustomList customList,
}) {
  Navigator.push(
    context,
    createEditCustomListPageRoute(
      context: context,
      customList: customList,
    ),
  );
}

MaterialPageRoute createEditCustomListPageRoute({
  @required BuildContext context,
  @required ICustomList customList,
}) {
  return MaterialPageRoute(builder: (context) => EditCustomListPage());
}
