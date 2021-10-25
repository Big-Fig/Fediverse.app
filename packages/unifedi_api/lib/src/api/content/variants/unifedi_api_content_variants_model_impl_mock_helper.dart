// ignore_for_file: no-magic-number
import 'unifedi_api_content_variants_model_impl.dart';

class UnifediApiContentVariantsMockHelper {
  static UnifediApiContentVariants generate({
    required String seed,
  }) =>
      UnifediApiContentVariants(
        textPlain: seed + 'textPlain',
      );
}
