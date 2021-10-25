import '../../../../unifedi_api_model.dart';

abstract class IUnifediApiAccountRelationshipFollowUpdateItem
    implements IUnifediApiResponse {
  String get accountId;
  int? get followerCount;
  int? get followingCount;
}
