import 'package:fedi/app/account/featured_hashtag/list/account_featured_hashtag_list_widget.dart';
import 'package:fedi/app/account/featured_hashtag/list/page/account_featured_hashtag_list_page_bloc_impl.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fedi/generated/l10n.dart';

class AccountFeaturedHashtagListPage extends StatelessWidget {
  const AccountFeaturedHashtagListPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediPageTitleAppBar(
        title: S.of(context).app_account_my_featuredTags_title,
      ),
      body: const SafeArea(
        child: AccountFeaturedHashtagListWidget(),
      ),
    );
  }
}

MaterialPageRoute createAccountFeaturedHashtagListPageRoute() =>
    MaterialPageRoute(
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
