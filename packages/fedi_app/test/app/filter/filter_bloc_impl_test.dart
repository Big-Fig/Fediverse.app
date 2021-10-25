import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/filter/filter_bloc.dart';
import 'package:fedi_app/app/filter/filter_bloc_impl.dart';
import 'package:fedi_app/app/filter/filter_model.dart';
import 'package:fedi_app/app/filter/filter_model_adapter.dart';
import 'package:fedi_app/app/filter/repository/filter_repository.dart';
import 'package:fedi_app/app/filter/repository/filter_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:moor/ffi.dart';
import 'package:unifedi_api/unifedi_api.dart';

import '../../rxdart/rxdart_test_helper.dart';
import 'filter_bloc_impl_test.mocks.dart';
import 'filter_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
// ignore_for_file: avoid-ignoring-return-values
@GenerateMocks([
  IUnifediApiFilterService,
])
void main() {
  late IFilter filter;
  late IFilterBloc filterBloc;
  late MockIUnifediApiFilterService unifediApiFilterServiceMock;
  late AppDatabase database;
  late IFilterRepository filterRepository;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    filterRepository = FilterRepository(
      appDatabase: database,
    );

    unifediApiFilterServiceMock = MockIUnifediApiFilterService();

    filter = await FilterMockHelper.createTestFilter(
      seed: 'seed1',
    );

    filterBloc = FilterBloc(
      filter: filter,
      unifediApiFilterService: unifediApiFilterServiceMock,
      filterRepository: filterRepository,
      delayInit: false,
    );
  });

  tearDown(() async {
    await filterBloc.dispose();
    await filterRepository.dispose();
    await database.close();
  });

  Future _update(IFilter filter) async {
    await filterRepository.upsertInRemoteType(
      filter.toUnifediFilter(),
    );

    await RxDartMockHelper.waitToExecuteRxCallbacks();
  }

  test('filter', () async {
    FilterMockHelper.expectFilter(filterBloc.filter, filter);

    var newValue = await FilterMockHelper.createTestFilter(
      seed: 'seed2',
      remoteId: filter.remoteId,
    );

    IFilter? listened;

    var subscription = filterBloc.filterStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    FilterMockHelper.expectFilter(
      listened,
      filter,
    );

    await _update(newValue);

    FilterMockHelper.expectFilter(
      filterBloc.filter,
      newValue,
    );
    FilterMockHelper.expectFilter(
      listened,
      newValue,
    );
    await subscription.cancel();
  });

  test('isExpired', () async {
    expect(
      filterBloc.isExpired,
      false,
    );
    expect(
      filterBloc.isExpired,
      filter.isExpired,
    );

    bool? listened;

    var subscription = filterBloc.isExpiredStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);
    expect(
      listened,
      filter.isExpired,
    );

    await _update(filter.copyWithTemp(expiresAt: DateTime(3000)));

    expect(
      filterBloc.isExpired,
      false,
    );
    expect(
      listened,
      false,
    );

    await subscription.cancel();

    subscription = filterBloc.isExpiredStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);
    expect(listened, filter.isExpired);

    await _update(filter.copyWithTemp(expiresAt: DateTime(1990)));

    expect(
      filterBloc.isExpired,
      true,
    );
    expect(
      listened,
      true,
    );
    await subscription.cancel();
  });
}
