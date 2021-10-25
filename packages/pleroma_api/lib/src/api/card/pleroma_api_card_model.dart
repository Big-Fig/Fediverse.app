import 'package:mastodon_api/mastodon_api.dart';

import '../pleroma_api_model.dart';
import 'type/pleroma_api_card_type_sealed.dart';

abstract class IPleromaApiCard
    implements IMastodonApiCard, IPleromaApiResponse {}

extension IPleromaApiCardTypeExtension on IPleromaApiCard {
  PleromaApiCardType get typeAsPleromaApi => type.toPleromaApiCardType();
}
