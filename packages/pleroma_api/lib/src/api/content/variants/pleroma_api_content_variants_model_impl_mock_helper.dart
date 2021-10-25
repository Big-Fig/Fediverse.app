// ignore_for_file: no-magic-number
import 'pleroma_api_content_variants_model_impl.dart';

class PleromaApiContentVariantsMockHelper {
  static PleromaApiContentVariants generate({
    required String seed,
  }) =>
      PleromaApiContentVariants(
        textPlain: seed + 'textPlain',
      );
}
