import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_model.dart';

// ignore_for_file: no-magic-number
class TimelinesHomeTabStorageModelMockHelper {
  static TimelinesHomeTabStorage createTestTimelinesHomeTabStorage({
    required String seed,
  }) =>
      TimelinesHomeTabStorage(
        timelineIds: [
          seed + '1',
          seed + '2',
        ],
      );
}
