import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PostMessageBlocProxyProvider extends StatelessWidget {
  final Widget child;

  PostMessageBlocProxyProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IPostMessageBloc,
        IUploadMediaAttachmentsCollectionBloc>(
      update: (context, value, previous) => value.mediaAttachmentsBloc,
      child: child,
    );
  }
}
