import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/timeline/type/timeline_type_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

extension TimelineLabelExtension on Timeline {
  String calculateLabel(BuildContext context) {
    if (label?.isNotEmpty == true) {
      return label;
    } else {
      switch (type) {
        case TimelineType.public:
          if (onlyLocal) {
            return S.of(context).app_timeline_type_public_local;
          } else if (!onlyLocal && !onlyRemote) {
            return S.of(context).app_timeline_type_public_all;
          } else {
            return S.of(context).app_timeline_type_public;
          }
          break;
        case TimelineType.customList:
          return S.of(context).app_timeline_type_customList;

          break;
        case TimelineType.home:
          return S.of(context).app_timeline_type_home;
          break;
        case TimelineType.hashtag:
          return S.of(context).app_timeline_type_hashtag;
          break;
        case TimelineType.account:
          return S.of(context).app_timeline_type_account;
          break;
        default:
          throw UnsupportedError("type $type not supported");
      }
    }
  }
}
