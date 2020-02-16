

import 'package:fedi/mastodon/field/mastodon_field_model.dart';

abstract class IMastodonSource {
  
  String get privacy;
  
  bool get sensitive;
  
  String get language;
  
  String get note;
  
  List<IMastodonField> get fields;
  
  
  int get followRequestsCount;
}



