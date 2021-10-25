import 'package:fedi_app/app/account/my/account_block/my_account_account_block_list_page.dart';
import 'package:fedi_app/app/account/my/account_mute/my_account_account_mute_list_page.dart';
import 'package:fedi_app/app/account/my/domain_block/list/my_account_domain_block_list_page.dart';
import 'package:fedi_app/app/account/my/edit/edit_my_account_page.dart';
import 'package:fedi_app/app/account/my/endorsement/my_account_endorsement_page.dart';
import 'package:fedi_app/app/account/my/featured_hashtag/list/page/my_account_featured_hashtag_list_page.dart';
import 'package:fedi_app/app/account/my/follow_request/badge/my_account_follow_request_count_int_badge_bloc_impl.dart';
import 'package:fedi_app/app/account/my/follow_request/my_account_follow_request_list_page.dart';
import 'package:fedi_app/app/account/my/statuses/favourited/my_account_favourited_statuses_page.dart';
import 'package:fedi_app/app/account/my/suggestion/my_account_suggestion_page.dart';
import 'package:fedi_app/app/filter/list/filter_list_page.dart';
import 'package:fedi_app/app/status/draft/list/draft_status_list_page.dart';
import 'package:fedi_app/app/status/scheduled/list/scheduled_status_list_page.dart';
import 'package:fedi_app/app/ui/badge/int/fedi_int_badge_widget.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi_app/app/ui/selection/fedi_selection_item_row_widget.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class AccountHomeTabMenuActionsPage extends StatelessWidget {
  const AccountHomeTabMenuActionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediPageTitleAppBar(
          title: S.of(context).app_account_my_menu_account_subpage_title,
        ),
        body: const Padding(
          padding: FediPadding.verticalSmallPadding,
          child: _AccountHomeTabMenuActionsBody(),
        ),
      );
}

class _AccountHomeTabMenuActionsBody extends StatelessWidget {
  const _AccountHomeTabMenuActionsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.zero,
        children: const [
          _MyAccountSettingsEditButton(),
          _MyAccountSettingsFiltersButton(),
          _MyAccountSettingsScheduledButton(),
          _MyAccountSettingsDraftsButton(),
          _MyAccountSettingsFavouritedButton(),
          _MyAccountSettingsFollowRequestsButton(),
          _MyAccountSettingsAccountBlocksButton(),
          _MyAccountSettingsAccountMutesButton(),
          _MyAccountSettingsDomainBlocksButton(),
          _MyAccountSettingsFeaturedTagsButton(),
          _MyAccountSettingsEndorsementsButton(),
          _MyAccountSettingsSuggestionsButton(),
        ],
      );
}

class _MyAccountSettingsEditButton extends StatelessWidget {
  const _MyAccountSettingsEditButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_account_my_action_edit,
        onClick: () {
          goToEditMyAccountPage(context);
        },
      );
}

class _MyAccountSettingsScheduledButton extends StatelessWidget {
  const _MyAccountSettingsScheduledButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_account_my_action_scheduledPosts,
        onClick: () {
          goToScheduledStatusListPage(context);
        },
      );
}

class _MyAccountSettingsDraftsButton extends StatelessWidget {
  const _MyAccountSettingsDraftsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_account_my_action_draftPosts,
        onClick: () {
          goToDraftStatusListPage(context);
        },
      );
}

class _MyAccountSettingsFavouritedButton extends StatelessWidget {
  const _MyAccountSettingsFavouritedButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_account_my_action_favourited,
        onClick: () {
          goToMyAccountFavouritedStatusesPage(context);
        },
      );
}

class _MyAccountSettingsFeaturedTagsButton extends StatelessWidget {
  const _MyAccountSettingsFeaturedTagsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var unifediApiMyAccountService =
        Provider.of<IUnifediApiMyAccountService>(context);
    var featureSupported = unifediApiMyAccountService.isFeatureSupported(
      unifediApiMyAccountService.getMyAccountFeaturedTagsFeature,
    );
    if (featureSupported) {
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
    var unifediApiMyAccountService =
        Provider.of<IUnifediApiMyAccountService>(context);
    var featureSupported = unifediApiMyAccountService.isFeatureSupported(
      unifediApiMyAccountService.getMyEndorsementsFeature,
    );
    if (featureSupported) {
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
    var unifediApiMyAccountService =
        Provider.of<IUnifediApiMyAccountService>(context);
    var featureSupported = unifediApiMyAccountService.isFeatureSupported(
      unifediApiMyAccountService.getMySuggestionsFeature,
    );
    if (featureSupported) {
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
    void onClick() {
      goToMyAccountFollowRequestListPage(context);
    }

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
  Widget build(BuildContext context) => SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_account_my_action_accountBlocks,
        onClick: () {
          goToMyAccountAccountBlockListPage(context);
        },
      );
}

class _MyAccountSettingsAccountMutesButton extends StatelessWidget {
  const _MyAccountSettingsAccountMutesButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_account_my_action_accountMutes,
        onClick: () {
          goToMyAccountAccountMuteListPage(context);
        },
      );
}

class _MyAccountSettingsDomainBlocksButton extends StatelessWidget {
  const _MyAccountSettingsDomainBlocksButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_account_my_action_domainBlocks,
        onClick: () {
          goToMyAccountDomainBlockListPage(context);
        },
      );
}

class _MyAccountSettingsFiltersButton extends StatelessWidget {
  const _MyAccountSettingsFiltersButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_account_my_action_filters,
        onClick: () {
          goToFilterListPage(context);
        },
      );
}

void goAccountHomeTabMenuActionsPage(BuildContext context) {
  Navigator.push(
    context,
    createAccountHomeTabMenuActionsPageRoute(),
  );
}

MaterialPageRoute<void> createAccountHomeTabMenuActionsPageRoute() =>
    MaterialPageRoute<void>(
      builder: (context) => const AccountHomeTabMenuActionsPage(),
    );
