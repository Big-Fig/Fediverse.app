import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_bloc.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_bloc_impl.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_model_adapter.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository_impl.dart';
import 'package:fedi/pleroma/api/announcement/pleroma_api_announcement_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moor/ffi.dart';

import './instance_announcement_bloc_impl_test.mocks.dart';
import 'instance_announcement_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
@GenerateMocks([
  IPleromaApiAnnouncementService,
])
void main() {
  late IInstanceAnnouncement instanceAnnouncement;
  late IInstanceAnnouncementBloc instanceAnnouncementBloc;
  late MockIPleromaApiAnnouncementService pleromaAnnouncementServiceMock;
  late AppDatabase database;
  late IInstanceAnnouncementRepository instanceAnnouncementRepository;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    instanceAnnouncementRepository = InstanceAnnouncementRepository(
      appDatabase: database,
    );

    pleromaAnnouncementServiceMock = MockIPleromaApiAnnouncementService();

    when(pleromaAnnouncementServiceMock.isConnected).thenReturn(true);
    when(pleromaAnnouncementServiceMock.pleromaApiState)
        .thenReturn(PleromaApiState.validAuth);

    instanceAnnouncement =
        await InstanceAnnouncementTestHelper.createTestInstanceAnnouncement(
      seed: 'seed1',
    );

    instanceAnnouncementBloc = InstanceAnnouncementBloc(
      instanceAnnouncement: instanceAnnouncement,
      pleromaApiAnnouncementService: pleromaAnnouncementServiceMock,
      instanceAnnouncementRepository: instanceAnnouncementRepository,
      delayInit: false,
    );
  });

  tearDown(() async {
    await instanceAnnouncementBloc.dispose();
    await instanceAnnouncementRepository.dispose();
    await database.close();
  });

  Future _update(IInstanceAnnouncement instanceAnnouncement) async {
    await instanceAnnouncementRepository.upsertInRemoteType(
      instanceAnnouncement.toPleromaInstanceAnnouncement(),
    );
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
  }

  test('instanceAnnouncement', () async {
    InstanceAnnouncementTestHelper.expectInstanceAnnouncement(
      instanceAnnouncementBloc.instanceAnnouncement,
      instanceAnnouncement,
    );

    var newValue =
        await InstanceAnnouncementTestHelper.createTestInstanceAnnouncement(
      seed: 'seed2',
      remoteId: instanceAnnouncement.remoteId,
    );

    var listenedValue;

    var subscription =
        instanceAnnouncementBloc.instanceAnnouncementStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    InstanceAnnouncementTestHelper.expectInstanceAnnouncement(
      listenedValue,
      instanceAnnouncement,
    );

    await _update(newValue);

    InstanceAnnouncementTestHelper.expectInstanceAnnouncement(
      instanceAnnouncementBloc.instanceAnnouncement,
      newValue,
    );
    InstanceAnnouncementTestHelper.expectInstanceAnnouncement(
      listenedValue,
      newValue,
    );
    await subscription.cancel();
  });
  //
  // test('isExpired', () async {
  //   expect(
  //     instanceAnnouncementBloc.isExpired,
  //     false,
  //   );
  //   expect(
  //     instanceAnnouncementBloc.isExpired,
  //     instanceAnnouncement.isExpired,
  //   );
  //
  //   var listenedValue;
  //
  //   var subscription =
  //       instanceAnnouncementBloc.isExpiredStream.listen((newValue) {
  //     listenedValue = newValue;
  //   });
  //   // hack to execute notify callbacks
  //   await Future.delayed(Duration(milliseconds: 1));
  //   expect(
  //     listenedValue,
  //     instanceAnnouncement.isExpired,
  //   );
  //
  //   await _update(instanceAnnouncement.copyWith(expiresAt: DateTime(3000)));
  //
  //   expect(
  //     instanceAnnouncementBloc.isExpired,
  //     false,
  //   );
  //   expect(
  //     listenedValue,
  //     false,
  //   );
  //
  //   await subscription.cancel();
  //
  //   subscription = instanceAnnouncementBloc.isExpiredStream.listen((newValue) {
  //     listenedValue = newValue;
  //   });
  //   // hack to execute notify callbacks
  //   await Future.delayed(Duration(milliseconds: 1));
  //   expect(listenedValue, instanceAnnouncement.isExpired);
  //
  //   await _update(instanceAnnouncement.copyWith(expiresAt: DateTime(1990)));
  //
  //   expect(
  //     instanceAnnouncementBloc.isExpired,
  //     true,
  //   );
  //   expect(
  //     listenedValue,
  //     true,
  //   );
  //   await subscription.cancel();
  // });
}
