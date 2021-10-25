// ignore_for_file: no-magic-number, no-equal-arguments

import 'unifedi_api_instance_urls_model_impl.dart';

class UnifediApiInstanceUrlsMockHelper {
  static UnifediApiInstanceUrls generate({
    required String seed,
  }) =>
      UnifediApiInstanceUrls(
        streamingApi: seed + 'streamingApi',
      );
}
