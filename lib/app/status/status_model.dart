
import 'package:fedi/Pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/Models/Emoji.dart';

abstract class IStatus {

  int get localId;
  String get remoteId;
  DateTime get createdAt;
  String get inReplyToRemoteId;
  String get inReplyToAccountRemoteId;
  bool get sensitive;
  String get spoilerText;
  Visibility get visibility;
  String get uri;
  String get url;
  int get repliesCount;
  int get reblogsCount;
  int get favouritesCount;
  bool get favourited;
  bool get reblogged;
  bool get muted;
  bool get bookmarked;
  bool get pinned;
  String get content;
  IStatus get reblog;
  Application get application;
  Account get account;
  List<MediaAttachment> get mediaAttachments;
  List<Mention> get mentions;
  List<Tag> get tags;
  List<Emoji> get emojis;
  dynamic get poll;
}

class DbStatusWrapper implements IStatus {
  final DbStatus dbStatus;

  DbStatusWrapper(this.dbStatus);

  factory DbStatusWrapper.fromJson(Map<String, dynamic> json) {
    return DbStatusWrapper(DbStatus.fromJson(json));
  }

  @override
  String get remoteId => dbStatus.remoteId;

  @override
  int get localId => dbStatus.id;

  @override
  // TODO: implement account
  Account get account => null;

  @override
  // TODO: implement application
  Application get application => null;

  @override
  // TODO: implement bookmarked
  bool get bookmarked => null;

  @override
  // TODO: implement content
  String get content => null;

  @override
  // TODO: implement createdAt
  DateTime get createdAt => null;

  @override
  // TODO: implement emojis
  List<Emoji> get emojis => null;

  @override
  // TODO: implement favourited
  bool get favourited => null;

  @override
  // TODO: implement favouritesCount
  int get favouritesCount => null;

  @override
  // TODO: implement inReplyToAccountRemoteId
  String get inReplyToAccountRemoteId => null;

  @override
  // TODO: implement inReplyToRemoteId
  String get inReplyToRemoteId => null;

  @override
  // TODO: implement mediaAttachments
  List<MediaAttachment> get mediaAttachments => null;

  @override
  // TODO: implement mentions
  List<Mention> get mentions => null;

  @override
  // TODO: implement muted
  bool get muted => null;

  @override
  // TODO: implement pinned
  bool get pinned => null;

  @override
  // TODO: implement poll
  get poll => null;

  @override
  // TODO: implement reblog
  IStatus get reblog => null;

  @override
  // TODO: implement reblogged
  bool get reblogged => null;

  @override
  // TODO: implement reblogsCount
  int get reblogsCount => null;

  @override
  // TODO: implement repliesCount
  int get repliesCount => null;

  @override
  // TODO: implement sensitive
  bool get sensitive => null;

  @override
  // TODO: implement spoilerText
  String get spoilerText => null;

  @override
  // TODO: implement tags
  List<Tag> get tags => null;

  @override
  // TODO: implement uri
  String get uri => null;

  @override
  // TODO: implement url
  String get url => null;

  @override
  // TODO: implement visibility
  Visibility get visibility => null;
}
