import '../../../unifedi_api_model.dart';
import '../focus/unifedi_api_media_attachment_focus_model.dart';
import '../size/unifedi_api_media_attachment_size_model.dart';

abstract class IUnifediApiMediaAttachmentMeta
    implements IUnifediApiResponsePart {
  IUnifediApiMediaAttachmentFocus? get focus;

  IUnifediApiMediaAttachmentSize? get original;

  IUnifediApiMediaAttachmentSize? get small;
}
