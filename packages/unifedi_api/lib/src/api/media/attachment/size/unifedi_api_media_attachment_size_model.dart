import '../../../unifedi_api_model.dart';

abstract class IUnifediApiMediaAttachmentSize
    implements IUnifediApiResponsePart {
  int get width;

  int get height;

  String? get size;

  double? get aspect;
}
