import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

class InstanceAnnouncementRepositoryTestHelper {
  static Future<DbInstanceAnnouncement> insertDbInstanceAnnouncement(
    InstanceAnnouncementRepository instanceAnnouncementRepository,
    DbInstanceAnnouncement instanceAnnouncementData,
  ) async {
    var id = await instanceAnnouncementRepository.insertInDbType(
      instanceAnnouncementData,
      mode: null,
    );
    assert(id > 0, true);
    var dbInstanceAnnouncement = instanceAnnouncementData.copyWith(id: id);

    return dbInstanceAnnouncement;
  }
}
