import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/status/post/new/new_post_status_bloc_impl.dart';
import 'package:fedi/refactored/app/status/post/post_status_bloc.dart';
import 'package:fedi/refactored/app/status/post/post_status_widget.dart';
import 'package:fedi/refactored/app/ui/fedi_colors.dart';
import 'package:fedi/refactored/app/ui/fedi_icons.dart';
import 'package:fedi/refactored/app/ui/header/fedi_sub_header_text.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPostStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // Dark == white status bar -- for  IOS.
        brightness: Brightness.light,
        backgroundColor: FediColors.white,
        title: FediSubHeaderText(
            AppLocalizations.of(context).tr("app.status.post.new.title")),
        leading: IconButton(
          icon: Icon(FediIcons.close, color: FediColors.darkGrey),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const PostStatusWidget(
        goBackOnSuccess: true,
        displayMentions: true,
        expanded: true,
      ),
    );
  }
}

void goToNewPostStatusPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<IPostStatusBloc>(
            create: (context) => NewPostStatusBloc.createFromContext(context),
            child: NewPostStatusPage())),
  );
}
