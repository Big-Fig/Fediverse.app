import '../unifedi_api_post_status_model.dart';

abstract class IUnifediApiSchedulePostStatus
    implements IUnifediApiBasePostStatus {
  DateTime get scheduledAt;
}
