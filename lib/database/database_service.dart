import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IDatabaseService implements IDisposable {
  static IDatabaseService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IDatabaseService>(context, listen: listen);

  Future<void> clearAll();

  Future<void> clearByLimits({
    required Duration? ageLimit,
    required int? entriesCountByTypeLimit,
  });

  Future<void> delete();

  Future<int> calculateSizeInBytes();

  Future<DateTime?> calculateOldestEntryAge();

  Future<int> calculateMaxCountByType();
}
