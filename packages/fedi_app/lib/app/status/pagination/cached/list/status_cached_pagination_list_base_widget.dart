import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:flutter/widgets.dart';

abstract class StatusCachedPaginationListBaseWidget
    extends FediPaginationListWidget<IStatus> {
  const StatusCachedPaginationListBaseWidget({
    required Key? key,
    Widget? header,
    Widget? footer,
    bool? alwaysShowHeader,
    bool? alwaysShowFooter,
    ScrollController? scrollController,
    Widget? customLoadingWidget,
    Widget? customEmptyWidget,
    bool refreshOnFirstLoad = true,
  }) : super(
          key: key,
          customLoadingWidget: customLoadingWidget,
          customEmptyWidget: customEmptyWidget,
          scrollController: scrollController,
          footer: footer,
          header: header,
          alwaysShowHeader: alwaysShowHeader,
          alwaysShowFooter: alwaysShowFooter,
          refreshOnFirstLoad: refreshOnFirstLoad,
          isNeedToAddPaddingForUiTests: true,
        );
}
