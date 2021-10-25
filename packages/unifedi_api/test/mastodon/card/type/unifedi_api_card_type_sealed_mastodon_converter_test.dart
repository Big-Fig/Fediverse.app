import 'package:mastodon_api/mastodon_api.dart';
import 'package:test/test.dart';
import 'package:unifedi_api/src/api/card/type/unifedi_api_card_type_sealed.dart';
import 'package:unifedi_api/src/mastodon/card/type/unifedi_api_card_type_sealed_mastodon_converter.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toUnifediApiCardType', () async {
    expect(
      UnifediApiCardType.richValue.toMastodonApiCardType(),
      MastodonApiCardType.richValue,
    );
  });
  test('toUnifediApiCardType', () async {
    expect(
      MastodonApiCardType.richValue.toUnifediApiCardType(),
      UnifediApiCardType.richValue,
    );
  });
}
