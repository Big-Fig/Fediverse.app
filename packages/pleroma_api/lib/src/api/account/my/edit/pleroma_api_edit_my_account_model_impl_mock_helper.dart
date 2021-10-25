import '../../../field/pleroma_api_field_model_impl_mock_helper.dart';
import 'pleroma_api_edit_my_account_model_impl.dart';

// ignore_for_file: no-magic-number, no-equal-arguments

class PleromaApiEditMyAccountMockHelper {
  static PleromaApiEditMyAccount generate({
    required String seed,
  }) =>
      PleromaApiEditMyAccount(
        fieldsAttributes: [
          PleromaApiFieldMockHelper.generate(seed: seed + '1'),
          PleromaApiFieldMockHelper.generate(seed: seed + '2'),
        ],
        discoverable: seed.hashCode % 2 == 0,
        bot: seed.hashCode % 2 == 1,
        displayName: seed + 'displayName',
        note: seed + 'note',
        locked: seed.hashCode % 2 == 0,
        privacy: seed + 'privacy',
        sensitive: seed.hashCode % 2 == 1,
        language: seed + 'language',
        avatarLocalFilePath: seed + 'avatarLocalFilePath',
        deleteAvatar: null,
        headerLocalFilePath: seed + 'headerLocalFilePath',
        deleteHeader: null,
        noRichText: seed.hashCode % 2 == 0,
        hideFollowers: seed.hashCode % 2 == 1,
        hideFollows: seed.hashCode % 2 == 0,
        hideFollowersCount: seed.hashCode % 2 == 1,
        hideFollowsCount: seed.hashCode % 2 == 0,
        hideFavorites: seed.hashCode % 2 == 1,
        showRole: seed.hashCode % 2 == 0,
        defaultScope: seed + 'defaultScope',
        pleromaSettingsStore: <String, dynamic>{
          '1': 1,
          '2': '2',
        },
        skipThreadContainment: seed.hashCode % 2 == 0,
        allowFollowingMove: seed.hashCode % 2 == 1,
        acceptsChatMessages: seed.hashCode % 2 == 0,
        alsoKnownAs: [
          seed + 'alsoKnownAs1',
          seed + 'alsoKnownAs2',
        ],
        pleromaBackgroundImageLocalFilePath:
            seed + 'pleromaBackgroundImageLocalFilePath',
        deletePleromaBackgroundImage: null,
      );
}
