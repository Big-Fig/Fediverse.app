import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:test/test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toMastodonApiFilterContextTypes', () async {
    expect(
      UrlPathHelper.join(['1', '2']),
      '1/2',
    );
  });
}
