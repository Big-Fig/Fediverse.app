import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/status/list/hashtag_status_list_widget.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HashtagPage extends StatelessWidget {
  final IHashtag hashtag;

  HashtagPage({
    @required this.hashtag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: hashtag.name,
      ),
      body: SafeArea(
        child: HashtagStatusListWidget(),
      ),
    );
  }
}

void goToHashtagPage({
  @required BuildContext context,
  @required IHashtag hashtag,
}) {
  Navigator.push(
    context,
    createHashtagPageRoute(
      context: context,
      hashtag: hashtag,
    ),
  );
}

MaterialPageRoute createHashtagPageRoute({
  @required BuildContext context,
  @required IHashtag hashtag,
}) {
  return MaterialPageRoute(
      builder: (context) => HashtagPage(
            hashtag: hashtag,
          ));
}
