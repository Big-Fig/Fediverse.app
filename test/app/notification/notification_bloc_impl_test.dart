import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/notification/notification_bloc.dart';
import 'package:fedi/app/notification/notification_bloc_impl.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/notification_model_adapter.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_service_impl.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moor/ffi.dart';

import '../account/account_test_helper.dart';
import '../status/status_test_helper.dart';
import 'notification_bloc_impl_test.mocks.dart';
import 'notification_test_helper.dart';

// ignore_for_file: no-magic-number
@GenerateMocks([PleromaApiNotificationService])
void main() {
  late INotification notification;
  late DbStatusPopulatedWrapper status;
  late INotificationBloc notificationBloc;
  late MockPleromaApiNotificationService pleromaNotificationServiceMock;
  late AppDatabase database;
  late IAccountRepository accountRepository;
  late IStatusRepository statusRepository;
  late IPleromaChatMessageRepository chatMessageRepository;
  late INotificationRepository notificationRepository;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(appDatabase: database);
    statusRepository = StatusRepository(
      appDatabase: database,
      accountRepository: accountRepository,
    );
    chatMessageRepository = PleromaChatMessageRepository(
      appDatabase: database,
      accountRepository: accountRepository,
    );
    notificationRepository = NotificationRepository(
      chatMessageRepository: chatMessageRepository,
      appDatabase: database,
      accountRepository: accountRepository,
      statusRepository: statusRepository,
    );

    pleromaNotificationServiceMock = MockPleromaApiNotificationService();

    when(pleromaNotificationServiceMock.isConnected).thenReturn(true);
    when(pleromaNotificationServiceMock.pleromaApiState)
        .thenReturn(PleromaApiState.validAuth);

    status = await StatusTestHelper.createTestStatus(seed: "seed4");

    notification = await NotificationTestHelper.createTestNotification(
      seed: "seed1",
      status: status.dbStatusPopulated,
    );

    notificationBloc = NotificationBloc(
      notification: notification,
      pleromaNotificationService: pleromaNotificationServiceMock,
      notificationRepository: notificationRepository,
      delayInit: false,
    );
  });

  tearDown(() async {
    await notificationBloc.dispose();
    await notificationRepository.dispose();
    await statusRepository.dispose();
    await accountRepository.dispose();
    await database.close();
  });

  Future _update(
    INotification notification, {
    bool unread = false,
  }) async {
    await notificationRepository.upsertRemoteNotification(
      notification.toPleromaNotification(),
      unread: unread,
      batchTransaction: null,
    );
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
  }

  test('notification', () async {
    NotificationTestHelper.expectNotification(
        notificationBloc.notification, notification);

    var newValue = await NotificationTestHelper.createTestNotification(
      seed: "seed2",
      remoteId: notification.remoteId,
    );

    var listenedValue;

    var subscription = notificationBloc.notificationStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    NotificationTestHelper.expectNotification(
      listenedValue,
      notification,
    );

    await _update(newValue);

    NotificationTestHelper.expectNotification(
      notificationBloc.notification,
      newValue,
    );
    NotificationTestHelper.expectNotification(
      listenedValue,
      newValue,
    );
    await subscription.cancel();
  });

  test('account', () async {
    AccountTestHelper.expectAccount(
      notificationBloc.account,
      notification.account,
    );

    var newValue = await AccountTestHelper.createTestAccount(seed: "seed3");

    var listenedValue;

    var subscription = notificationBloc.accountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    AccountTestHelper.expectAccount(
      listenedValue,
      notification.account,
    );

    await _update(notification.copyWith(account: newValue));

    AccountTestHelper.expectAccount(
      notificationBloc.account,
      newValue,
    );
    AccountTestHelper.expectAccount(
      listenedValue,
      newValue,
    );
    await subscription.cancel();
  });

  test('status', () async {
    StatusTestHelper.expectStatus(
      notificationBloc.status,
      notification.status,
    );

    var newValue = await StatusTestHelper.createTestStatus(seed: "seed3");

    var listenedValue;

    var subscription = notificationBloc.statusStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    StatusTestHelper.expectStatus(
      listenedValue,
      notification.status,
    );

    await _update(notification.copyWith(status: newValue));

    StatusTestHelper.expectStatus(
      notificationBloc.status,
      newValue,
    );
    StatusTestHelper.expectStatus(
      listenedValue,
      newValue,
    );
    await subscription.cancel();
  });

  test('createdAt', () async {
    expect(
      notificationBloc.createdAt,
      notification.createdAt,
    );

    var newValue = DateTime(1990);

    var listenedValue;

    var subscription = notificationBloc.createdAtStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      notification.createdAt,
    );

    await _update(notification.copyWith(createdAt: newValue));

    expect(
      notificationBloc.createdAt,
      newValue,
    );
    expect(
      listenedValue,
      newValue,
    );
    await subscription.cancel();
  });
}
