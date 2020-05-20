import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class INotificationsHomeTabPageDrawerBloc extends Disposable {
  static INotificationsHomeTabPageDrawerBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<INotificationsHomeTabPageDrawerBloc>(context, listen: listen);

  bool get favourite;

  Stream<bool> get favouriteStream;

  Future<bool> changeFavourite(bool value);

  bool get follow;

  Stream<bool> get followStream;

  Future<bool> changeFollow(bool value);

  bool get mention;

  Stream<bool> get mentionStream;

  Future<bool> changeMention(bool value);

  bool get reblog;

  Stream<bool> get reblogStream;

  Future<bool> changeReblog(bool value);

  bool get poll;

  Stream<bool> get pollStream;

  Future<bool> changePoll(bool value);
}
