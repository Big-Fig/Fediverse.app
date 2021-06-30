import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/pleroma/api/announcement/pleroma_api_announcement_model.dart';
import 'package:fedi/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceAnnouncementRepository
    implements
        IAppRemoteReadWriteRepository<
            DbInstanceAnnouncement,
            IInstanceAnnouncement,
            IPleromaApiAnnouncement,
            int,
            String,
            InstanceAnnouncementRepositoryFilters,
            InstanceAnnouncementOrderingTermData>,
        IDisposable {
  static IInstanceAnnouncementRepository of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceAnnouncementRepository>(context, listen: listen);

  Future<int> calculateCount({
    required InstanceAnnouncementRepositoryFilters? filters,
  });

  Stream<int> watchCalculateCount({
    required InstanceAnnouncementRepositoryFilters? filters,
  });
}
