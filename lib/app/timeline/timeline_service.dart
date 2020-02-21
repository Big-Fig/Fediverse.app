import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';

abstract class ITimelineService implements DisposableOwner {
  Future<List<IStatus>> loadStatuses();
}