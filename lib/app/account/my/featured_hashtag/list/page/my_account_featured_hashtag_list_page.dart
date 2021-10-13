import 'package:fedi/app/account/my/featured_hashtag/list/my_account_featured_hashtag_list_widget.dart';
import 'package:fedi/app/account/my/featured_hashtag/list/page/my_account_featured_hashtag_list_page_bloc_impl.dart';
import 'package:fedi/app/account/my/featured_hashtag/suggestion/my_account_featured_hashtag_suggestion_page.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_app_bar_text_action_widget.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountFeaturedHashtagListPage extends StatelessWidget {
  const AccountFeaturedHashtagListPage();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediPageTitleAppBar(
          title: S.of(context).app_account_my_featuredTags_title,
          actions: [
            FediPageAppBarTextActionWidget(
              text:
                  S.of(context).app_account_my_featuredTags_action_suggestions,
              onPressed: () {
                goToMyAccountFeaturedHashtagSuggestionPage(context);
              },
            ),
          ],
        ),
        body: const SafeArea(
          child: AccountFeaturedHashtagListWidget(),
        ),
      );
}

MaterialPageRoute<void> createAccountFeaturedHashtagListPageRoute() =>
    MaterialPageRoute<void>(
      builder: (context) => AccountFeaturedHashtagListPageBloc.provideToContext(
        context,
        child: const AccountFeaturedHashtagListPage(),
      ),
    );

void goToAccountFeaturedHashtagListPage(BuildContext context) {
  Navigator.push(
    context,
    createAccountFeaturedHashtagListPageRoute(),
  );
}
