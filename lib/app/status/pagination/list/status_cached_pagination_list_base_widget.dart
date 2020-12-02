import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:flutter/widgets.dart';

abstract class StatusCachedPaginationListBaseWidget
    extends FediPaginationListWidget<IStatus> {
  const StatusCachedPaginationListBaseWidget({
    @required Key key,
    Widget header,
    Widget footer,
    bool alwaysShowHeader,
    bool alwaysShowFooter,
    ScrollController scrollController,
    Widget customLoadingWidget,
    Widget customEmptyWidget,
  }) : super(
          key: key,
          customLoadingWidget: customLoadingWidget,
          customEmptyWidget: customEmptyWidget,
          scrollController: scrollController,
          footer: footer,
          header: header,
          alwaysShowHeader: alwaysShowHeader,
          alwaysShowFooter: alwaysShowFooter,
        );
}
