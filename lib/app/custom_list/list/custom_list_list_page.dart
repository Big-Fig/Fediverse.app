import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/custom_list/list/custom_list_pagination_list_widget.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: "app.custom_list.list.title".tr(),
      ),
      body: SafeArea(
        child: CustomListPaginationListWidget(),
      ),
    );
  }
}
