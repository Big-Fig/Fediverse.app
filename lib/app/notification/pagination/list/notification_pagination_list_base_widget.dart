import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class NotificationPaginationListBaseWidget
    extends FediPaginationListWidget<INotification> {
  const NotificationPaginationListBaseWidget({
    @required Key key,
    Widget header,
    Widget footer,
    bool alwaysShowHeader,
    bool alwaysShowFooter,
    ScrollController scrollController,
  }) : super(
          key: key,
          footer: footer,
          header: header,
          alwaysShowHeader: alwaysShowHeader,
          alwaysShowFooter: alwaysShowFooter,
          scrollController: scrollController,
        );

  @override
  IPaginationListBloc<PaginationPage<INotification>, INotification>
      retrievePaginationListBloc(BuildContext context,
          {@required bool listen}) {
    var paginationListBloc = Provider.of<
        IPaginationListBloc<CachedPaginationPage<INotification>,
            INotification>>(context, listen: listen);
    return paginationListBloc;
  }
}
