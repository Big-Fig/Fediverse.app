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
    builder: (context) => CustomListListPage(),
  );
//  return MaterialPageRoute(
//      builder: (context) => DisposableProvider<IStatusCachedListBloc>(
//            create: (BuildContext context) =>
//                CustomListTimelineStatusCachedListBloc(
//                    pleromaTimelineService: IPleromaTimelineService.of(
//                      context,
//                      listen: false,
//                    ),
//                    statusRepository: IStatusRepository.of(
//                      context,
//                      listen: false,
//                    ),
//                    timelineLocalPreferencesBloc:
//                        ITimelineSettingsLocalPreferencesBloc.of(context,
//                            listen: false),
//                    currentInstanceBloc: ICurrentAuthInstanceBloc.of(
//                      context,
//                      listen: false,
//                    ),
//                    customList: customList),
//            child: ProxyProvider<IStatusCachedListBloc,
//                    IPleromaCachedListBloc<IStatus>>(
//                update: (context, value, previous) => value,
//                child: StatusCachedPaginationBloc.provideToContext(context,
//                    child: StatusCachedPaginationListWithNewItemsBloc
//                        .provideToContext(context,
//                            mergeNewItemsImmediately: false,
//                            child: CustomListListPage(
//                              customList: customList,
//                            )))),
//          ));
}
