import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/app/filter/repository/filter_repository_model.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository_model.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/mastodon/api/filter/mastodon_filter_model.dart';
import 'package:fedi/pleroma/api/notification/pleroma_notification_model.dart';
import 'package:rxdart/rxdart.dart';

class NotificationUnreadExcludeTypesBoolBadgeBloc extends AsyncInitLoadingBloc
    implements IFediBoolBadgeBloc {
  final List<PleromaNotificationType> excludeTypes;
  final INotificationRepository notificationRepository;
  final IFilterRepository filterRepository;

  final BehaviorSubject<bool> badgeSubject = BehaviorSubject.seeded(false);

  late List<IFilter> filters;

  NotificationUnreadExcludeTypesBoolBadgeBloc({
    required this.excludeTypes,
    required this.notificationRepository,
    required this.filterRepository,
  }) {
    addDisposable(subject: badgeSubject);
    performAsyncInit();
  }

  @override
  Stream<bool> get badgeStream => badgeSubject.stream;

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

    if (!isDisposed) {
      notificationRepository
          .watchFindCount(
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
          .map((count) => count > 0)
          .listen(
        (unread) {
          badgeSubject.add(unread);
        },
      );
    }
  }
}
