import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository_model.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/mastodon/filter/mastodon_filter_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class NotificationUnreadBadgeExcludeTypesBloc extends AsyncInitLoadingBloc
    implements IFediBoolBadgeBloc {
  final List<PleromaNotificationType> excludeTypes;
  final INotificationRepository notificationRepository;
  final IFilterRepository filterRepository;

  final BehaviorSubject<bool> badgeSubject = BehaviorSubject.seeded(false);

  List<IFilter> filters;

  NotificationUnreadBadgeExcludeTypesBloc({
    @required this.excludeTypes,
    @required this.notificationRepository,
    @required this.filterRepository,
  }) {
    addDisposable(subject: badgeSubject);
    performAsyncInit();
  }

  @override
  Stream<bool> get badgeStream => badgeSubject.stream;

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

    if (!isDisposed) {
      notificationRepository
          .watchCount(
            filters: NotificationRepositoryFilters(
              onlyUnread: true,
              excludeTypes: excludeTypes,
              excludeStatusTextConditions: filters
                  .map(
                    (filter) => filter.toStatusTextCondition(),
                  )
                  .toList(),
            ),
          )
          .map((count) => count != null && count > 0)
          .listen(
        (unread) {
          badgeSubject.add(unread);
        },
      );
    }
  }
}
