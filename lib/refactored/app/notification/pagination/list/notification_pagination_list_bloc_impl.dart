//import 'package:fedi/refactored/app/notification/notification_model.dart';
//import 'package:fedi/refactored/app/notification/pagination/list/notification_pagination_list_bloc.dart';
//import 'package:fedi/refactored/pagination/list/pagination_list_bloc_impl.dart';
//import 'package:fedi/refactored/pagination/pagination_bloc.dart';
//import 'package:fedi/refactored/pagination/pagination_model.dart';
//import 'package:flutter/widgets.dart';
//import 'package:provider/provider.dart';
//
//class NotificationPaginationListBloc
//    extends PaginationListBloc<PaginationPage<INotification>, INotification>
//    implements INotificationPaginationListBloc {
//  NotificationPaginationListBloc(
//      {@required
//          IPaginationBloc<PaginationPage<INotification>, INotification>
//              paginationBloc})
//      : super(paginationBloc: paginationBloc);
//
//  static NotificationPaginationListBloc createFromContext(
//          BuildContext context) =>
//      NotificationPaginationListBloc(
//          paginationBloc: Provider.of<
//              IPaginationBloc<PaginationPage<INotification>,
//                  INotification>>(context, listen: false));
//}
