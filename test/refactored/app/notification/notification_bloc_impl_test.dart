import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/app/account/repository/account_repository_impl.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/notification/notification_bloc.dart';
import 'package:fedi/refactored/app/notification/notification_bloc_impl.dart';
import 'package:fedi/refactored/app/notification/notification_model.dart';
import 'package:fedi/refactored/app/notification/notification_model_adapter.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository_impl.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/status/repository/status_repository_impl.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:moor_ffi/moor_ffi.dart';

import '../../pleroma/account/pleroma_account_service_mock.dart';
import '../../pleroma/notification/pleroma_notification_service_mock.dart';
import '../account/account_model_helper.dart';
import '../status/status_model_helper.dart';
import 'notification_model_helper.dart';

void main() {
  INotification notification;
  DbStatusPopulatedWrapper status;
  INotificationBloc notificationBloc;
  PleromaNotificationServiceMock pleromaNotificationServiceMock;
  PleromaAccountServiceMock pleromaAccountServiceMock;
  AppDatabase database;
  IAccountRepository accountRepository;
  IStatusRepository statusRepository;
  INotificationRepository notificationRepository;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(appDatabase: database);
    statusRepository = StatusRepository(
        appDatabase: database, accountRepository: accountRepository);
    notificationRepository = NotificationRepository(
        appDatabase: database,
        accountRepository: accountRepository,
        statusRepository: statusRepository);

    pleromaNotificationServiceMock = PleromaNotificationServiceMock();

    when(pleromaNotificationServiceMock.isApiReadyToUse).thenReturn(true);

    status = await createTestStatus(seed: "seed4");

    notification = await createTestNotification(seed: "seed1", status: status
        .dbStatusPopulated);

    notificationBloc = NotificationBloc(
        notification: notification,
        pleromaNotificationService: pleromaNotificationServiceMock,
        notificationRepository: notificationRepository,
        delayInit: false);
  });

  tearDown(() async {
    notificationBloc.dispose();
    notificationRepository.dispose();
    statusRepository.dispose();
    accountRepository.dispose();
    await database.close();
  });

  Future _update(INotification notification, {bool unread: false}) async {
    await notificationRepository.upsertRemoteNotification(
        mapLocalNotificationToRemoteNotification(notification),
        unread: unread);
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
  }


  test('notification', () async {
    expectNotification(notificationBloc.notification, notification);

    var newValue =
    await createTestNotification(
        seed: "seed2", remoteId: notification.remoteId);

    var listenedValue;

    var subscription = notificationBloc.notificationStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expectNotification(listenedValue, notification);

    await _update(newValue);

    expectNotification(notificationBloc.notification, newValue);
    expectNotification(listenedValue, newValue);
    subscription.cancel();
  });



  test('account', () async {
    expectAccount(notificationBloc.account, notification.account);

    var newValue = await createTestAccount(seed: "seed3");

    var listenedValue;

    var subscription = notificationBloc.accountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expectAccount(listenedValue, notification.account);

    await _update(notification.copyWith(account: newValue));

    expectAccount(notificationBloc.account, newValue);
    expectAccount(listenedValue, newValue);
    subscription.cancel();
  });

  test('status', () async {
    expectStatus(notificationBloc.status, notification.status);

    var newValue = await createTestStatus(seed: "seed3");

    var listenedValue;

    var subscription = notificationBloc.statusStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expectStatus(listenedValue, notification.status);

    await _update(notification.copyWith(status: newValue));

    expectStatus(notificationBloc.status, newValue);
    expectStatus(listenedValue, newValue);
    subscription.cancel();
  });


  test('createdAt', () async {
    expect(notificationBloc.createdAt, notification.createdAt);

    var newValue = DateTime(1990);

    var listenedValue;

    var subscription = notificationBloc.createdAtStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, notification.createdAt);

    await _update(notification.copyWith(createdAt: newValue));

    expect(notificationBloc.createdAt, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });

}
