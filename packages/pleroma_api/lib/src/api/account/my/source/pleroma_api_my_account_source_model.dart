import 'package:mastodon_api/mastodon_api.dart';
import '../../../field/pleroma_api_field_model.dart';

import '../../../pleroma_api_model.dart';

abstract class IPleromaApiMyAccountSource
    implements IMastodonApiMyAccountSource, IPleromaApiResponsePart {
  @override
  List<IPleromaApiField>? get fields;

  IPleromaApiMyAccountSourcePleromaPart? get pleroma;
}

abstract class IPleromaApiMyAccountSourcePleromaPart
    implements IPleromaApiResponsePart {
  ///  show_role: boolean, nullable,
  ///  true when the user wants his role (e.g admin, moderator) to be shown
  bool? get showRole;

  ///  no_rich_text - boolean, nullable,
  ///  true when html tags are stripped from all statuses requested from the API
  bool? get noRichText;

  ///  discoverable: boolean,
  ///  true when the user allows discovery of the account
  ///  in search results and other services.
  bool? get discoverable;

  /// actor_type: string, the type of this account.
  String? get actorType;
}
