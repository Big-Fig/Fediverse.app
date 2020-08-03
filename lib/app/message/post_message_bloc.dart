import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPostMessageBloc implements Disposable {
  static IPostMessageBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPostMessageBloc>(context, listen: listen);

  TextEditingController get inputTextController;

  IUploadMediaAttachmentsCollectionBloc get mediaAttachmentsBloc;

  bool get isReadyToPost;

  Stream<bool> get isReadyToPostStream;

  String get inputText;

  Stream<String> get inputTextStream;

  Future<bool> post();

  void appendText(String textToAppend);

  PostStatusSelectedAction get selectedAction;

  Stream<PostStatusSelectedAction> get selectedActionStream;

  void toggleAttachActionSelection();

  void toggleEmojiActionSelection();


  Stream<bool> get isAnySelectedActionVisibleStream;
  bool get isAnySelectedActionVisible;
}
