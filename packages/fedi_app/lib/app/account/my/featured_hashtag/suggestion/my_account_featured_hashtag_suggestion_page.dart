import 'package:fedi_app/app/account/my/featured_hashtag/suggestion/my_account_featured_hashtag_suggestion_bloc_impl.dart';
import 'package:fedi_app/app/account/my/featured_hashtag/suggestion/my_account_featured_hashtag_suggestion_widget.dart';
import 'package:fedi_app/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAccountFeaturedHashtagSuggestionPage extends StatelessWidget {
  const MyAccountFeaturedHashtagSuggestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediPageTitleAppBar(
          title: S.of(context).app_account_my_featuredTags_suggestions_title,
        ),
        body: const SafeArea(
          child: MyAccountFeaturedHashtagSuggestionWidget(),
        ),
      );
}

MaterialPageRoute<void> createMyAccountFeaturedHashtagSuggestionPageRoute() =>
    MaterialPageRoute<void>(
      builder: (context) =>
          MyAccountFeaturedHashtagSuggestionBloc.provideToContext(
        context,
        child: const MyAccountFeaturedHashtagSuggestionPage(),
      ),
    );

void goToMyAccountFeaturedHashtagSuggestionPage(BuildContext context) {
  Navigator.push(
    context,
    createMyAccountFeaturedHashtagSuggestionPageRoute(),
  );
}
