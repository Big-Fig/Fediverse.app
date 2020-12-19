import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/notification/list/cached/notification_cached_list_bloc.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository_model.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/mastodon/filter/mastodon_filter_model.dart';
import 'package:fedi/mastodon/notification/mastodon_notification_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_service.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';

class NotificationCachedListBloc extends AsyncInitLoadingBloc
    implements INotificationCachedListBloc {
  final IPleromaNotificationService pleromaNotificationService;
  final INotificationRepository notificationRepository;
  final IFilterRepository filterRepository;
  final List<PleromaNotificationType> excludeTypes;

  @override
  IPleromaApi get pleromaApi => pleromaNotificationService;

  NotificationCachedListBloc({
    @required this.pleromaNotificationService,
    @required this.notificationRepository,
    @required this.filterRepository,
    this.excludeTypes,
  });

  List<IFilter> filters;

  @override
  Future internalAsyncInit() async {
    filters = await filterRepository.getFilters(
      olderThanFilter: null,
      newerThanFilter: null,
      limit: null,
      offset: null,
      orderingTermData: null,
      onlyWithContextTypes: [
        MastodonFilterContextType.notifications,
      ],
      notExpired: true,
    );
  }

  @override
  Future<List<INotification>> loadLocalItems(
      {@required int limit,
      @required INotification newerThan,
      @required INotification olderThan}) {
    return notificationRepository.getNotifications(
      excludeTypes: excludeTypes,
      olderThanNotification: olderThan,
      newerThanNotification: newerThan,
      limit: limit,
      offset: null,
      orderingTermData: NotificationOrderingTermData(
        orderingMode: OrderingMode.desc,
        orderByType: NotificationOrderByType.createdAt,
      ),
      excludeStatusTextConditions: filters
          .map(
            (filter) => filter.toStatusTextCondition(),
          )
          .toList(),
    );
  }

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required INotification newerThan,
      @required INotification olderThan}) async {
    // todo: don't exclude pleroma types on mastodon instances
    var remoteNotifications = await pleromaNotificationService.getNotifications(
        request: MastodonNotificationsRequest(
            excludeTypes: excludeTypes
                ?.map(
                  (type) => type.toJsonValue(),
                )
                ?.toList(),
            maxId: olderThan?.remoteId,
            sinceId: newerThan?.remoteId,
            limit: limit));

    if (remoteNotifications != null) {
      await notificationRepository
          .upsertRemoteNotifications(remoteNotifications, unread: false);
      return true;
    } else {
      return false;
    }
  }

  static NotificationCachedListBloc createFromContext(BuildContext context,
          {@required List<PleromaNotificationType> excludeTypes}) =>
      NotificationCachedListBloc(
        pleromaNotificationService:
            IPleromaNotificationService.of(context, listen: false),
        excludeTypes: excludeTypes,
        notificationRepository:
            INotificationRepository.of(context, listen: false),
        filterRepository: IFilterRepository.of(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    @required List<PleromaNotificationType> excludeTypes,
    @required Widget child,
  }) {
    return DisposableProvider<INotificationCachedListBloc>(
      create: (context) => NotificationCachedListBloc.createFromContext(
        context,
        excludeTypes: excludeTypes,
      ),
      child: child,
    );
  }

  @override
  Stream<List<INotification>> watchLocalItemsNewerThanItem(
          INotification item) =>
      notificationRepository.watchNotifications(
        excludeTypes: excludeTypes,
        olderThanNotification: null,
        newerThanNotification: item,
        limit: null,
        offset: null,
        orderingTermData: NotificationOrderingTermData(
          orderingMode: OrderingMode.desc,
          orderByType: NotificationOrderByType.createdAt,
        ),
        excludeStatusTextConditions: filters
            .map(
              (filter) => filter.toStatusTextCondition(),
            )
            .toList(),
      );

  @override
  Future dismissAll() async {
    await pleromaNotificationService.dismissAll();
    await notificationRepository.dismissAll();
  }
}
