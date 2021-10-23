import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/filter/repository/filter_repository_model.dart';
import 'package:fedi/app/notification/list/cached/notification_cached_list_bloc.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository_model.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class NotificationCachedListBloc extends AsyncInitLoadingBloc
    implements INotificationCachedListBloc {
  final IUnifediApiNotificationService pleromaNotificationService;
  final INotificationRepository notificationRepository;
  final IFilterRepository filterRepository;
  final List<UnifediApiNotificationType> excludeTypes;

  NotificationRepositoryFilters get _notificationRepositoryFilters =>
      NotificationRepositoryFilters.only(
        excludeTypes: excludeTypes,
        excludeStatusTextConditions: filters
            .map(
              (filter) => filter.toStatusTextCondition(),
            )
            .toList(),
      );

  @override
  IUnifediApiService get unifediApi => pleromaNotificationService;

  NotificationCachedListBloc({
    required this.pleromaNotificationService,
    required this.notificationRepository,
    required this.filterRepository,
    required this.excludeTypes,
  });

  // ignore: avoid-late-keyword
  late List<IFilter> filters;

  FilterRepositoryFilters get filterRepositoryFilters =>
      const FilterRepositoryFilters(
        onlyWithContextTypes: [
          UnifediApiFilterContextType.notificationsValue,
        ],
        notExpired: true,
      );

  @override
  Future<void> internalAsyncInit() async {
    filters = await filterRepository.findAllInAppType(
      filters: filterRepositoryFilters,
      pagination: null,
      orderingTerms: null,
    );

    filterRepository
        .watchFindAllInAppType(
      filters: filterRepositoryFilters,
      pagination: null,
      orderingTerms: null,
    )
        .listen(
      (newFilters) {
        if (!listEquals(filters, newFilters)) {
          // perhaps we should refresh UI list after this?
          filters = newFilters;
        }
      },
    ).disposeWith(this);
  }

  @override
  Future<List<INotification>> loadLocalItems({
    required int? limit,
    required INotification? newerThan,
    required INotification? olderThan,
  }) =>
      notificationRepository.findAllInAppType(
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

  @override
  Future<void> refreshItemsFromRemoteForPage({
    required int? limit,
    required INotification? newerThan,
    required INotification? olderThan,
  }) async {
    // todo: dont exclude pleroma types on mastodon instances
    var remoteNotifications = await pleromaNotificationService.getNotifications(
      includeTypes: null,
      excludeVisibilities: null,
      onlyFromAccountId: null,
      pagination: UnifediApiPagination(
        limit: limit,
        minId: newerThan?.remoteId,
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
    required List<UnifediApiNotificationType> excludeTypes,
  }) =>
      NotificationCachedListBloc(
        pleromaNotificationService: Provider.of<IUnifediApiNotificationService>(
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
    required List<UnifediApiNotificationType> excludeTypes,
    required Widget child,
  }) =>
      DisposableProvider<INotificationCachedListBloc>(
        create: (context) => NotificationCachedListBloc.createFromContext(
          context,
          excludeTypes: excludeTypes,
        ),
        child: child,
      );

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
  Future<void> dismissAll() async {
    await pleromaNotificationService.dismissAll();
    await notificationRepository.dismissAll();
  }
}
