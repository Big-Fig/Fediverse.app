import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPushSubscriptionBloc extends Disposable {

  static IPushSubscriptionBloc of(BuildContext context, {listen: true}) =>
      Provider.of<IPushSubscriptionBloc>(context, listen: listen);



  bool get favourite;

  Stream<bool> get favouriteStream;

  Future<bool> changeFavourite(bool value);

  bool get follow;

  Stream<bool> get followStream;

  Future<bool>changeFollow(bool value);

  bool get mention;

  Stream<bool> get mentionStream;

  Future<bool>changeMention(bool value);

  bool get reblog;

  Stream<bool> get reblogStream;

  Future<bool>changeReblog(bool value);

  bool get poll;

  Stream<bool> get pollStream;

  Future<bool> changePoll(bool value);
}