import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/custom_list/custom_list_model.dart';
import 'package:fedi_app/app/custom_list/list/custom_list_list_create_button_widget.dart';
import 'package:fedi_app/app/custom_list/list/network_only/custom_list_network_only_list_bloc_impl.dart';
import 'package:fedi_app/app/custom_list/list/pagination/custom_list_pagination_list_widget.dart';
import 'package:fedi_app/app/custom_list/list/pagination/network_only/custom_list_network_only_pagination_bloc_impl.dart';
import 'package:fedi_app/app/ui/empty/fedi_empty_widget.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi_app/pagination/pagination_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomListListPage extends StatelessWidget {
  const CustomListListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediPageTitleAppBar(
          title: S.of(context).app_account_my_customList_list_title,
        ),
        body: const SafeArea(
          child: CustomListPaginationListWidget(
            customEmptyWidget: _CustomListListPageEmptyWidget(),
            footer: Padding(
              padding: FediPadding.allBigPadding,
              child: CustomListListCreateButtonWidget(),
            ),
            alwaysShowFooter: false,
          ),
        ),
      );
}

class _CustomListListPageEmptyWidget extends StatelessWidget {
  const _CustomListListPageEmptyWidget();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FediEmptyWidget(
          title: s.app_account_my_customList_list_empty_title,
          subTitle: s.app_account_my_customList_list_empty_subtitle,
        ),
        const CustomListListCreateButtonWidget(),
      ],
    );
  }
}

void goToCustomListListPage(
  BuildContext context,
) {
  Navigator.push(
    context,
    createCustomListListPageRoute(
      context: context,
    ),
  );
}

MaterialPageRoute<void> createCustomListListPageRoute({
  required BuildContext context,
}) =>
    MaterialPageRoute<void>(
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
            child: ProxyProvider<
                IPaginationListBloc<PaginationPage<ICustomList>, ICustomList>,
                IPaginationListBloc>(
              update: (context, value, previous) => value,
              child: const CustomListListPage(),
            ),
          ),
        ),
      ),
    );
