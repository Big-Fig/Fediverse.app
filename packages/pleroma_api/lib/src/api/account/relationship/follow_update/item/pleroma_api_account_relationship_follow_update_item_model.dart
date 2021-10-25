import '../../../../pleroma_api_model.dart';

abstract class IPleromaApiAccountRelationshipFollowUpdateItem
    implements IPleromaApiResponse {
  String get accountId;
  int? get followerCount;
  int? get followingCount;
}
