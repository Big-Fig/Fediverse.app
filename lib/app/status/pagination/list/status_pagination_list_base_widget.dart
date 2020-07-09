import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:flutter/widgets.dart';

abstract class StatusPaginationListBaseWidget
    extends PaginationListWidget<IStatus> {
  const StatusPaginationListBaseWidget({
    @required Key key,
    Widget header,
    Widget footer,
    bool alwaysShowHeader,
    bool alwaysShowFooter,
  }) : super(
            key: key,
            footer: footer,
            header: header,
            alwaysShowHeader: alwaysShowHeader,
            alwaysShowFooter: alwaysShowFooter);
}
