import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository_model.dart';
import 'package:fedi/app/ui/badge/int/fedi_int_badge_bloc.dart';
import 'package:flutter/widgets.dart';

class InstanceAnnouncementCountIntBadgeBloc extends DisposableOwner
    implements IFediIntBadgeBloc {
  final IInstanceAnnouncementRepository instanceAnnouncementRepository;

  InstanceAnnouncementCountIntBadgeBloc({
    required this.instanceAnnouncementRepository,
  });

  @override
  Stream<int> get badgeStream =>
      instanceAnnouncementRepository.watchCalculateCount(
        filters: InstanceAnnouncementRepositoryFilters(
          withDismissed: false,
          withExpired: false,
          withNotStartedYet: false,
        ),
      );

  static InstanceAnnouncementCountIntBadgeBloc createFromContext(
    BuildContext context,
  ) =>
      InstanceAnnouncementCountIntBadgeBloc(
        instanceAnnouncementRepository: IInstanceAnnouncementRepository.of(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProvider<IFediIntBadgeBloc>(
        create: InstanceAnnouncementCountIntBadgeBloc.createFromContext,
        child: child,
      );
}
