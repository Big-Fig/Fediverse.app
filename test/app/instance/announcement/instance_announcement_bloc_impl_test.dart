import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_bloc.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_bloc_impl.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_model_adapter.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository.dart';
import 'package:fedi/app/instance/announcement/repository/instance_announcement_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:moor/ffi.dart';
import 'package:unifedi_api/unifedi_api.dart';

import './instance_announcement_bloc_impl_test.mocks.dart';
import '../../../rxdart/rxdart_test_helper.dart';
import 'instance_announcement_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
// ignore_for_file: avoid-ignoring-return-values
@GenerateMocks([
  IUnifediApiAnnouncementService,
])
void main() {
  late IInstanceAnnouncement instanceAnnouncement;
  late IInstanceAnnouncementBloc instanceAnnouncementBloc;
  late MockIUnifediApiAnnouncementService unifediApiAnnouncementServiceMock;
  late AppDatabase database;
  late IInstanceAnnouncementRepository instanceAnnouncementRepository;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    instanceAnnouncementRepository = InstanceAnnouncementRepository(
      appDatabase: database,
    );

    unifediApiAnnouncementServiceMock = MockIUnifediApiAnnouncementService();

    instanceAnnouncement =
        await InstanceAnnouncementMockHelper.createTestInstanceAnnouncement(
      seed: 'seed1',
    );

    instanceAnnouncementBloc = InstanceAnnouncementBloc(
      instanceAnnouncement: instanceAnnouncement,
      unifediApiAnnouncementService: unifediApiAnnouncementServiceMock,
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

    await RxDartMockHelper.waitToExecuteRxCallbacks();
  }

  test('instanceAnnouncement', () async {
    InstanceAnnouncementMockHelper.expectInstanceAnnouncement(
      instanceAnnouncementBloc.instanceAnnouncement,
      instanceAnnouncement,
    );

    var newValue =
        await InstanceAnnouncementMockHelper.createTestInstanceAnnouncement(
      seed: 'seed2',
      remoteId: instanceAnnouncement.remoteId,
    );

    IInstanceAnnouncement? listened;

    var subscription =
        instanceAnnouncementBloc.instanceAnnouncementStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);
    InstanceAnnouncementMockHelper.expectInstanceAnnouncement(
      listened,
      instanceAnnouncement,
    );

    await _update(newValue);

    InstanceAnnouncementMockHelper.expectInstanceAnnouncement(
      instanceAnnouncementBloc.instanceAnnouncement,
      newValue,
    );
    InstanceAnnouncementMockHelper.expectInstanceAnnouncement(
      listened,
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
  //   var listened;
  //
  //   var subscription =
  //       instanceAnnouncementBloc.isExpiredStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   listened = null;
  //   await RxDartMockHelper.waitForData(() => listened);
  //   expect(
  //     listened,
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
  //     listened,
  //     false,
  //   );
  //
  //   await subscription.cancel();
  //
  //   subscription = instanceAnnouncementBloc
  //   .isExpiredStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   listened = null;
  //   await RxDartMockHelper.waitForData(() => listened);
  //   expect(listened, instanceAnnouncement.isExpired);
  //
  //   await _update(instanceAnnouncement.copyWith(expiresAt: DateTime(1990)));
  //
  //   expect(
  //     instanceAnnouncementBloc.isExpired,
  //     true,
  //   );
  //   expect(
  //     listened,
  //     true,
  //   );
  //   await subscription.cancel();
  // });
}
