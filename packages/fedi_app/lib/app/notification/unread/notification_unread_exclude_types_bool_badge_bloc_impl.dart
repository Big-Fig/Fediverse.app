import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/filter/filter_model.dart';
import 'package:fedi_app/app/filter/repository/filter_repository.dart';
import 'package:fedi_app/app/filter/repository/filter_repository_model.dart';
import 'package:fedi_app/app/notification/repository/notification_repository.dart';
import 'package:fedi_app/app/notification/repository/notification_repository_model.dart';
import 'package:fedi_app/app/status/repository/status_repository_model.dart';
import 'package:fedi_app/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

class NotificationUnreadExcludeTypesBoolBadgeBloc extends AsyncInitLoadingBloc
    implements IFediBoolBadgeBloc {
  final List<UnifediApiNotificationType> excludeTypes;
  final INotificationRepository notificationRepository;
  final IFilterRepository filterRepository;

  final BehaviorSubject<bool> badgeSubject = BehaviorSubject.seeded(false);

  // ignore: avoid-late-keyword
  late List<IFilter> filters;

  NotificationUnreadExcludeTypesBoolBadgeBloc({
    required this.excludeTypes,
    required this.notificationRepository,
    required this.filterRepository,
  }) {
    badgeSubject.disposeWith(this);
    performAsyncInit();
  }

  @override
  Stream<bool> get badgeStream => badgeSubject.stream;

  StreamSubscription? countSubscription;

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
          filters = newFilters;
          reSubscribeForCount();
        }
      },
    ).disposeWith(this);

    reSubscribeForCount();
    addCustomDisposable(() => countSubscription?.cancel());
  }

  void reSubscribeForCount() {
    countSubscription?.cancel();
    if (!isDisposed) {
      countSubscription = notificationRepository
          .watchCalculateCount(
            filters: NotificationRepositoryFilters.only(
              onlyUnread: true,
              excludeTypes: excludeTypes,
              excludeStatusTextConditions: filters
                  .map(
                    (filter) => filter.toStatusTextCondition(),
                  )
                  .toList(),
            ),
          )
          .map((count) => count > 0)
          .listen(
        // ignore: unnecessary_lambdas
        (unread) {
          badgeSubject.add(unread);
        },
      );
    }
  }
}
