import 'package:fedi/app/account/my/account_block/my_account_account_block_list_page.dart';
import 'package:fedi/app/account/my/account_mute/my_account_account_mute_list_page.dart';
import 'package:fedi/app/account/my/domain_block/list/my_account_domain_block_list_page.dart';
import 'package:fedi/app/account/my/edit/edit_my_account_page.dart';
import 'package:fedi/app/account/my/endorsement/my_account_endorsement_page.dart';
import 'package:fedi/app/account/my/featured_hashtag/list/page/my_account_featured_hashtag_list_page.dart';
import 'package:fedi/app/account/my/follow_request/badge/my_account_follow_request_count_int_badge_bloc_impl.dart';
import 'package:fedi/app/account/my/follow_request/my_account_follow_request_list_page.dart';
import 'package:fedi/app/account/my/statuses/favourited/my_account_favourited_statuses_page.dart';
import 'package:fedi/app/account/my/suggestion/my_account_suggestion_page.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/filter/list/filter_list_page.dart';
import 'package:fedi/app/status/draft/list/draft_status_list_page.dart';
import 'package:fedi/app/status/scheduled/list/scheduled_status_list_page.dart';
import 'package:fedi/app/ui/badge/int/fedi_int_badge_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/app/ui/selection/fedi_selection_item_row_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountHomeTabMenuActionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediPageTitleAppBar(
        title: S.of(context).app_account_my_menu_account_subpage_title,
      ),
      body: Padding(
        padding: FediPadding.verticalSmallPadding,
        child: const _AccountHomeTabMenuActionsBody(),
      ),
    );
  }

  const AccountHomeTabMenuActionsPage();
}

class _AccountHomeTabMenuActionsBody extends StatelessWidget {
  const _AccountHomeTabMenuActionsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const _MyAccountSettingsEditButton(),
        const _MyAccountSettingsFiltersButton(),
        const _MyAccountSettingsScheduledButton(),
        const _MyAccountSettingsDraftsButton(),
        const _MyAccountSettingsFavouritedButton(),
        const _MyAccountSettingsFollowRequestsButton(),
        const _MyAccountSettingsAccountBlocksButton(),
        const _MyAccountSettingsAccountMutesButton(),
        const _MyAccountSettingsDomainBlocksButton(),
        const _MyAccountSettingsFeaturedTagsButton(),
        const _MyAccountSettingsEndorsementsButton(),
        const _MyAccountSettingsSuggestionsButton(),
      ],
    );
  }
}

class _MyAccountSettingsEditButton extends StatelessWidget {
  const _MyAccountSettingsEditButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_account_my_action_edit,
      onClick: () {
        goToEditMyAccountPage(context);
      },
    );
  }
}

class _MyAccountSettingsScheduledButton extends StatelessWidget {
  const _MyAccountSettingsScheduledButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_account_my_action_scheduledPosts,
      onClick: () {
        goToScheduledStatusListPage(context);
      },
    );
  }
}

class _MyAccountSettingsDraftsButton extends StatelessWidget {
  const _MyAccountSettingsDraftsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_account_my_action_draftPosts,
      onClick: () {
        goToDraftStatusListPage(context);
      },
    );
  }
}

class _MyAccountSettingsFavouritedButton extends StatelessWidget {
  const _MyAccountSettingsFavouritedButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_account_my_action_favourited,
      onClick: () {
        goToMyAccountFavouritedStatusesPage(context);
      },
    );
  }
}

class _MyAccountSettingsFeaturedTagsButton extends StatelessWidget {
  const _MyAccountSettingsFeaturedTagsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentAuthInstanceBloc = ICurrentAuthInstanceBloc.of(context);
    var authInstance = currentAuthInstanceBloc.currentInstance!;

    if (authInstance.isFeaturedTagsSupported) {
      return SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_account_my_action_featuredTags,
        onClick: () {
          goToAccountFeaturedHashtagListPage(context);
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class _MyAccountSettingsEndorsementsButton extends StatelessWidget {
  const _MyAccountSettingsEndorsementsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentAuthInstanceBloc = ICurrentAuthInstanceBloc.of(context);
    var authInstance = currentAuthInstanceBloc.currentInstance!;

    if (authInstance.isEndorsementSupported) {
      return SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_account_my_action_endorsement,
        onClick: () {
          goToMyAccountEndorsementPage(context);
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
class _MyAccountSettingsSuggestionsButton extends StatelessWidget {
  const _MyAccountSettingsSuggestionsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentAuthInstanceBloc = ICurrentAuthInstanceBloc.of(context);
    var authInstance = currentAuthInstanceBloc.currentInstance!;

    if (authInstance.isSuggestionSupported) {
      return SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_account_my_action_suggestion,
        onClick: () {
          goToMyAccountSuggestionPage(context);
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class _MyAccountSettingsFollowRequestsButton extends StatelessWidget {
  const _MyAccountSettingsFollowRequestsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var onClick = () {
      goToMyAccountFollowRequestListPage(context);
    };

    return InkWell(
      onTap: onClick,
      child: FediSelectionItemRowWidget(
        leading: null,
        ending: FediSelectionItemIconWidget(
          onClick: onClick,
        ),
        title: MyAccountFollowRequestCountIntBadgeBloc.provideToContext(
          context,
          child: FediIntBadgeWidget(
            offset: 0.0,
            child: SimpleFediSelectionItemRowTitleWidget(
              title: S.of(context).app_account_my_action_followRequests,
            ),
          ),
        ),
      ),
    );
  }
}

class _MyAccountSettingsAccountBlocksButton extends StatelessWidget {
  const _MyAccountSettingsAccountBlocksButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_account_my_action_accountBlocks,
      onClick: () {
        goToMyAccountAccountBlockListPage(context);
      },
    );
  }
}

class _MyAccountSettingsAccountMutesButton extends StatelessWidget {
  const _MyAccountSettingsAccountMutesButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_account_my_action_accountMutes,
      onClick: () {
        goToMyAccountAccountMuteListPage(context);
      },
    );
  }
}

class _MyAccountSettingsDomainBlocksButton extends StatelessWidget {
  const _MyAccountSettingsDomainBlocksButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_account_my_action_domainBlocks,
      onClick: () {
        goToMyAccountDomainBlockListPage(context);
      },
    );
  }
}

class _MyAccountSettingsFiltersButton extends StatelessWidget {
  const _MyAccountSettingsFiltersButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_account_my_action_filters,
      onClick: () {
        goToFilterListPage(context);
      },
    );
  }
}

void goAccountHomeTabMenuActionsPage(BuildContext context) {
  Navigator.push(
    context,
    createAccountHomeTabMenuActionsPageRoute(),
  );
}

MaterialPageRoute createAccountHomeTabMenuActionsPageRoute() {
  return MaterialPageRoute(
    builder: (context) => const AccountHomeTabMenuActionsPage(),
  );
}
