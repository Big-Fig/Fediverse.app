import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IThreadPostStatusBloc implements IPostStatusBloc {

  static IThreadPostStatusBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IThreadPostStatusBloc>(context, listen: listen);

  IStatus get notCanceledOriginInReplyToStatus;

  Stream<IStatus> get notCanceledOriginInReplyToStatusStream;

  bool get originInReplyToStatusCanceled;

  Stream<bool> get originInReplyToStatusCanceledStream;

  void cancelOriginInReplyToStatus();
}