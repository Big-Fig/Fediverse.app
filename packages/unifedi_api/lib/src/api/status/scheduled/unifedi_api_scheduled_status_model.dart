import '../../media/attachment/unifedi_api_media_attachment_model.dart';
import '../../unifedi_api_model.dart';
import 'params/unifedi_api_scheduled_status_params_model.dart';

abstract class IUnifediApiScheduledStatus implements IUnifediApiResponse {
  String get id;

  DateTime get scheduledAt;

  IUnifediApiScheduledStatusParams get params;

  List<IUnifediApiMediaAttachment>? get mediaAttachments;
}
