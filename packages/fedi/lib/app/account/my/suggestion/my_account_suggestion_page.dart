import 'package:fedi/app/account/my/suggestion/my_account_suggestion_bloc_impl.dart';
import 'package:fedi/app/account/my/suggestion/my_account_suggestion_widget.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocalMyAccountSuggestionPage extends StatelessWidget {
  const LocalMyAccountSuggestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediPageTitleAppBar(
          title: S.of(context).app_account_my_suggestion_title,
        ),
        body: const SafeArea(
          child: MyAccountSuggestionWidget(),
        ),
      );
}

MaterialPageRoute<void> createMyAccountSuggestionPageRoute() =>
    MaterialPageRoute<void>(
      builder: (context) => MyAccountSuggestionBloc.provideToContext(
        context,
        child: const LocalMyAccountSuggestionPage(),
      ),
    );

void goToMyAccountSuggestionPage(BuildContext context) {
  Navigator.push(
    context,
    createMyAccountSuggestionPageRoute(),
  );
}
