import 'package:fedi/app/media/attachment/upload/list/upload_media_attachment_list_bloc.dart';
import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PostMessageBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const PostMessageBlocProxyProvider({required this.child});

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IPostMessageBloc, IUploadMediaAttachmentsCollectionBloc>(
        update: (context, value, previous) => value.uploadMediaAttachmentsBloc,
        child: child,
      );
}
