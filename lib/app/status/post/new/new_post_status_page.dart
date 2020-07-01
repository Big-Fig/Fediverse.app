import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/app/status/post/new/new_post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_compose_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_dismiss_icon_button.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewPostStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: tr("app"
            ".status.post.new.title"),
        leading: const FediDismissIconButton(),
      ),
      body: SafeArea(
        child:  PostStatusComposeWidget(
          goBackOnSuccess: true,
          expanded: true,
          maxLines: null,
          displayAccountAvatar: false,
        ),
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
            child: ProxyProvider<IPostStatusBloc, IUploadMediaAttachmentsCollectionBloc>(
                update: (context, value, previous) => value.mediaAttachmentsBloc,
                child: NewPostStatusPage()))),
  );
}
