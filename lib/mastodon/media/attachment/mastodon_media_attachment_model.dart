import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

abstract class IMastodonMediaAttachment {
  String get description;
  String get id;
  String get previewUrl;
  String get remoteUrl;
  String get textUrl;
  String get type;
  String get url;
}
