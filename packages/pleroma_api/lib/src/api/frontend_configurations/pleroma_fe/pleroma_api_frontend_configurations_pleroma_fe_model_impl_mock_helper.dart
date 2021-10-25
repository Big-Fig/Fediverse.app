// ignore_for_file: no-magic-number
import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'pleroma_api_frontend_configurations_pleroma_fe_model_impl.dart';

class PleromaApiFrontendConfigurationsPleromaFeMockHelper {
  // ignore: long-method
  static PleromaApiFrontendConfigurationsPleromaFe generate({
    required String seed,
  }) =>
      PleromaApiFrontendConfigurationsPleromaFe(
        alwaysShowSubjectInput: BoolMockHelper.generate(
          seed: seed + 'alwaysShowSubjectInput',
        ),
        background: seed + 'background',
        collapseMessageWithSubject: BoolMockHelper.generate(
          seed: seed + 'collapseMessageWithSubject',
        ),
        disableChat: BoolMockHelper.generate(
          seed: seed + 'disableChat',
        ),
        greentext: BoolMockHelper.generate(
          seed: seed + 'greentext',
        ),
        hideFilteredStatuses: BoolMockHelper.generate(
          seed: seed + 'hideFilteredStatuses',
        ),
        hideMutedPosts: BoolMockHelper.generate(
          seed: seed + 'hideMutedPosts',
        ),
        hidePostStats: BoolMockHelper.generate(
          seed: seed + 'hidePostStats',
        ),
        hideUserStats: BoolMockHelper.generate(
          seed: seed + 'hideUserStats',
        ),
        loginMethod: seed + 'loginMethod',
        logo: seed + 'logo',
        logoMargin: seed + 'logoMargin',
        logoMask: BoolMockHelper.generate(
          seed: seed + 'logoMask',
        ),
        minimalScopesMode: BoolMockHelper.generate(
          seed: seed + 'minimalScopesMode',
        ),
        noAttachmentLinks: BoolMockHelper.generate(
          seed: seed + 'noAttachmentLinks',
        ),
        nsfwCensorImage: seed + 'nsfwCensorImage',
        postContentType: seed + 'postContentType',
        redirectRootLogin: seed + 'redirectRootLogin',
        redirectRootNoLogin: seed + 'redirectRootNoLogin',
        scopeCopy: BoolMockHelper.generate(
          seed: seed + 'scopeCopy',
        ),
        showFeaturesPanel: BoolMockHelper.generate(
          seed: seed + 'showFeaturesPanel',
        ),
        showInstanceSpecificPanel: BoolMockHelper.generate(
          seed: seed + 'showInstanceSpecificPanel',
        ),
        sidebarRight: BoolMockHelper.generate(
          seed: seed + 'sidebarRight',
        ),
        subjectLineBehavior: seed + 'subjectLineBehavior',
        theme: seed + 'theme',
        webPushNotifications: BoolMockHelper.generate(
          seed: seed + 'webPushNotifications',
        ),
      );
}
