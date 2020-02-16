
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/Pleroma/status/pleroma_status_model.dart';
import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/Models/Emoji.dart';

abstract class IStatus {
//
//  int get localId;
//  String get remoteId;
//  DateTime get createdAt;
//  String get inReplyToRemoteId;
//  String get inReplyToAccountRemoteId;
//  bool get sensitive;
//  String get spoilerText;
//  PleromaVisibility get visibility;
//  String get uri;
//  String get url;
//  int get repliesCount;
//  int get reblogsCount;
//  int get favouritesCount;
//  bool get favourited;
//  bool get reblogged;
//  bool get muted;
//  bool get bookmarked;
//  bool get pinned;
//  String get content;
//  IStatus get reblog;
//  Application get application;
//  Account get account;
//  List<PleromaMediaAttachment> get mediaAttachments;
//  List<Mention> get mentions;
//  List<Tag> get tags;
//  List<Emoji> get emojis;
//  dynamic get poll;
}

abstract class DbStatusWrapper implements IStatus {
  final DbStatus dbStatus;

  DbStatusWrapper(this.dbStatus);

  factory DbStatusWrapper.fromJson(Map<String, dynamic> json) {
//    return DbStatusWrapper(DbStatus.fromJson(json));
    return null;
  }

}
