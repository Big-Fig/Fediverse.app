import 'package:fedi/refactored/app/notification/notification_model.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_widget.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class NotificationPaginationListBaseWidget
    extends PaginationListWidget<INotification> {
  NotificationPaginationListBaseWidget({
    @required Key key,
    Widget header,
    Widget footer,
    bool alwaysShowHeader,
    bool alwaysShowFooter
  }) : super(
            key: key,
            footer: footer,
            header: header,
            alwaysShowHeader: alwaysShowHeader,
            alwaysShowFooter: alwaysShowFooter);

  @override
  IPaginationListBloc<PaginationPage<INotification>, INotification>
      retrievePaginationListBloc(BuildContext context,
          {@required bool listen}) {
    var paginationListBloc = Provider.of<
            IPaginationListBloc<PaginationPage<INotification>, INotification>>(
        context,
        listen: listen);
    return paginationListBloc;
  }
}
