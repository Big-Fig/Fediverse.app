import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/custom_list/create/create_custom_list_page.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/list/custom_list_network_only_list_bloc_impl.dart';
import 'package:fedi/app/custom_list/list/custom_list_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/custom_list/list/custom_list_pagination_list_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomListListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: "app.custom_list.list.title".tr(),
        actions: <Widget>[
          FediIconButton(
            icon: Icon(FediIcons.plus),
            onPressed: () {
              goToCreateCustomListPage(context: context);
            },
          )
        ],
      ),
      body: SafeArea(
        child: CustomListPaginationListWidget(),
      ),
    );
  }
}

void goToCustomListListPage({
  @required BuildContext context,
}) {
  Navigator.push(
    context,
    createCustomListListPageRoute(
      context: context,
    ),
  );
}

MaterialPageRoute createCustomListListPageRoute({
  @required BuildContext context,
}) {
  return MaterialPageRoute(
    builder: (context) => CustomListNetworkOnlyListBloc.provideToContext(
      context,
      child: CustomListNetworkOnlyPaginationBloc.provideToContext(
        context,
        child: DisposableProvider<
            IPaginationListBloc<PaginationPage<ICustomList>, ICustomList>>(
          create: (context) => PaginationListBloc(
            paginationBloc: Provider.of<
                IPaginationBloc<PaginationPage<ICustomList>, ICustomList>>(
              context,
              listen: false,
            ),
          ),
          child: CustomListListPage(),
        ),
      ),
    ),
  );
}
