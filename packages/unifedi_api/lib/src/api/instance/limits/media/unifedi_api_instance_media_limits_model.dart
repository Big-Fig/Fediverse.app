import '../../../unifedi_api_model.dart';

abstract class IUnifediApiInstanceMediaLimits
    implements IUnifediApiResponsePart {
  int? get uploadLimit;

  int? get avatarUploadLimit;

  int? get backgroundUploadLimit;

  int? get bannerUploadLimit;

  int? get descriptionLimit;
}
