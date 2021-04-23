import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/filter/repository/filter_repository_model.dart';
import 'package:fedi/app/notification/list/cached/notification_cached_list_bloc.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository_model.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/mastodon/api/filter/mastodon_filter_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/notification/pleroma_notification_model.dart';
import 'package:fedi/pleroma/api/notification/pleroma_notification_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_pagination_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';

class NotificationCachedListBloc extends AsyncInitLoadingBloc
    implements INotificationCachedListBloc {
  final IPleromaNotificationService pleromaNotificationService;
  final INotificationRepository notificationRepository;
  final IFilterRepository filterRepository;
  final List<PleromaNotificationType> excludeTypes;

  NotificationRepositoryFilters get _notificationRepositoryFilters =>
      NotificationRepositoryFilters(
        excludeTypes: excludeTypes,
        excludeStatusTextConditions: filters
            .map(
              (filter) => filter.toStatusTextCondition(),
            )
            .toList(),
      );

  @override
  IPleromaApi get pleromaApi => pleromaNotificationService;

  NotificationCachedListBloc({
    required this.pleromaNotificationService,
    required this.notificationRepository,
    required this.filterRepository,
    required this.excludeTypes,
  });

  late List<IFilter> filters;

  @override
  Future internalAsyncInit() async {
    filters = await filterRepository.findAllInAppType(
      filters: FilterRepositoryFilters(
        onlyWithContextTypes: [
          MastodonFilterContextType.notifications,
        ],
        notExpired: true,
      ),
      pagination: null,
      orderingTerms: null,
    );
  }

  @override
  Future<List<INotification>> loadLocalItems({
    required int? limit,
    required INotification? newerThan,
    required INotification? olderThan,
  }) {
    return notificationRepository.findAllInAppType(
      filters: _notificationRepositoryFilters,
      pagination: RepositoryPagination<INotification>(
        olderThanItem: olderThan,
        newerThanItem: newerThan,
        limit: limit,
      ),
      orderingTerms: [
        NotificationRepositoryOrderingTermData.createdAtDesc,
      ],
    );
  }

  @override
  Future refreshItemsFromRemoteForPage({
    required int? limit,
    required INotification? newerThan,
    required INotification? olderThan,
  }) async {
    // todo: don't exclude pleroma types on mastodon instances
    var remoteNotifications = await pleromaNotificationService.getNotifications(
      pagination: PleromaPaginationRequest(
        limit: limit,
        sinceId: newerThan?.remoteId,
        maxId: olderThan?.remoteId,
      ),
      excludeTypes: excludeTypes,
    );

    await notificationRepository.upsertAllInRemoteType(
      remoteNotifications,
      batchTransaction: null,
    );
  }

  static NotificationCachedListBloc createFromContext(
    BuildContext context, {
    required List<PleromaNotificationType> excludeTypes,
  }) =>
      NotificationCachedListBloc(
        pleromaNotificationService: IPleromaNotificationService.of(
          context,
          listen: false,
        ),
        excludeTypes: excludeTypes,
        notificationRepository: INotificationRepository.of(
          context,
          listen: false,
        ),
        filterRepository: IFilterRepository.of(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    required List<PleromaNotificationType> excludeTypes,
    required Widget child,
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
    INotification? item,
  ) =>
      notificationRepository.watchFindAllInAppType(
        filters: _notificationRepositoryFilters,
        pagination: RepositoryPagination<INotification>(
          newerThanItem: item,
        ),
        orderingTerms: [
          NotificationRepositoryOrderingTermData.createdAtDesc,
        ],
      );

  @override
  Future dismissAll() async {
    await pleromaNotificationService.dismissAll();
    await notificationRepository.dismissAll();
  }
}
