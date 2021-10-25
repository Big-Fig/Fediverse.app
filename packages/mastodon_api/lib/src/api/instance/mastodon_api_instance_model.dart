import 'package:fediverse_api/fediverse_api.dart';

import '../account/mastodon_api_account_model.dart';
import '../mastodon_api_model.dart';
import '../version/mastodon_api_version_model_impl.dart';
import 'stats/mastodon_api_instance_stats_model.dart';
import 'urls/mastodon_api_instance_urls_model.dart';

abstract class IMastodonApiInstance
    implements IFediverseApiInstance, IMastodonApiResponse {
  static const maxAttachedMedia = 8;
  String? get title;

  String? get shortDescription;

  String? get description;

  String? get email;

  IMastodonApiInstanceUrls? get urls;

  IMastodonApiInstanceStats? get stats;

  String? get thumbnail;

  List<String>? get languages;

  bool? get registrations;

  bool? get approvalRequired;

  bool? get invitesEnabled;

  IMastodonApiAccount? get contactAccount;
}

extension IMastodonApiInstanceExtension on IMastodonApiInstance {
  MastodonApiVersion get versionAsMastodonApi =>
      MastodonApiVersion.fromApiVersionString(versionString);
}
